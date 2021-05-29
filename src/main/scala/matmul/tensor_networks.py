import ast
import glob
import os
import pickle
import time

import cotengra as ctg
import matplotlib as mpl
import numpy as np
import quimb.tensor as qtn
from opt_einsum.contract import parse_backend, _tensordot
from qiskit import QuantumCircuit, BasicAer, execute
from scipy.linalg import block_diag

np.set_printoptions(
    edgeitems=30, linewidth=100000, formatter=dict(float=lambda x: "%.3g" % x)
)


def get_unitary(circ):
    backend = BasicAer.get_backend("unitary_simulator")
    job = execute(circ, backend)
    result = job.result()
    return result.get_unitary(circ, decimals=3)


mpl.rcParams["figure.dpi"] = 600


def core_contract(operands, inds, idx_rm, einsum_str, backend="auto"):
    backend = parse_backend(operands, backend)
    tmp_operands = [operands.pop(x) for x in inds]

    input_str, results_index = einsum_str.split("->")
    input_left, input_right = input_str.split(",")

    # Find indices to contract over
    left_pos, right_pos = [], []
    for s in idx_rm:
        left_pos.append(input_left.find(s))
        right_pos.append(input_right.find(s))
    axes = (tuple(left_pos), tuple(right_pos))

    # Contract!
    new_view = _tensordot(*tmp_operands, axes=axes, backend=backend)
    return new_view


def save_matrices(name, operands):
    pickle.dump(
        operands,
        open(f"{os.getcwd()}/{len(operands)}x{operands[0].shape}-{name}.pkl", "wb"),
    )


def to_matrix_nd(mat):
    tol = 1e-16
    mat.real[abs(mat.real) < tol] = 0.0
    mat.imag[abs(mat.imag) < tol] = 0.0
    qubit_mats = [mat[idx] for idx in np.ndindex(mat.shape[:-2])]
    block_mat = block_diag(*qubit_mats)
    return block_mat


def convert_matrices_to_csv():
    pickles = glob.glob("matrix_csvs/*.pkl")
    for pickl_fps in pickles:
        if (
            len(ast.literal_eval(pickl_fps.split("/")[1].split("x")[1].split("-")[0]))
            < 2
        ):
            continue
        csv_dir = pickl_fps.replace(".pkl", "").replace(", ", "_")
        os.makedirs(csv_dir, exist_ok=True)
        matrices = pickle.load(open(pickl_fps, "rb"))
        for i, matrix in enumerate(matrices):
            if len(matrix.shape) > 2:
                matrix = to_matrix_nd(matrix)
            np.savetxt(f"{csv_dir}/{i}_real.csv", np.real(matrix), delimiter=",")
            np.savetxt(f"{csv_dir}/{i}_imag.csv", np.imag(matrix), delimiter=",")


def create_contractsion():
    total_num_rounds = 30
    total_num_qubits = 30

    opt = ctg.ReusableHyperOptimizer(
        max_repeats=16,
        reconf_opts={},
        parallel=False,
        progbar=True,
        #     directory='ctg_path_cache',  # if you want a persistent path cache
    )

    opts = [("opt", opt), ("greedy", "greedy")]

    f = open(f"{os.getcwd()}/contraction_times.csv", "w")
    for num_rounds in range(2, total_num_rounds, 2):
        for num_qubits in range(2, total_num_qubits, 2):
            circ = qtn.Circuit(N=num_qubits, gate_opts={})
            qiskit_circ = QuantumCircuit(num_qubits, 1)

            for i in range(num_qubits):
                circ.h(i, gate_round=0)
                qiskit_circ.h(i)

            # 8 rounds of entangling gates
            for r in range(1, num_rounds):

                # even pairs
                for i in range(0, num_qubits, 2):
                    circ.cnot(i, i + 1, gate_round=r)
                    qiskit_circ.cnot(i, i + 1)

                # Y-rotations
                for i in range(num_qubits):
                    circ.rz(1.234, i, gate_round=r)
                    qiskit_circ.rz(1.234, i)

                # odd pairs
                for i in range(1, num_qubits - 1, 2):
                    circ.cz(i, i + 1, gate_round=r)
                    qiskit_circ.cz(i, i + 1)

                # X-rotations
                for i in range(num_qubits):
                    circ.rx(1.234, i, gate_round=r)
                    qiskit_circ.rx(1.234, i)

            # final layer of hadamards
            for i in range(num_qubits):
                circ.h(i, gate_round=r + 1)
                qiskit_circ.h(i)

            # _PATH_OPTIONS = {
            #     'auto': auto,
            #     'auto-hq': auto_hq,
            #     'optimal': optimal,
            #     'branch-all': branch_all,
            #     'branch-2': branch_2,
            #     'branch-1': branch_1,
            #     'greedy': greedy,
            #     'eager': greedy,
            #     'opportunistic': greedy,
            #     'dp': dynamic_programming,
            #     'dynamic-programming': dynamic_programming
            # }

            norm = circ.psi.H & circ.psi
            for (opt_name, optm) in opts:
                name = f"{opt_name}, {num_qubits}, {num_rounds}, {norm.num_tensors}"
                print(name)
                start = time.time()
                path_info = norm.contraction_info(optm)
                operands = [t.data for t in norm.tensors]
                for n, contraction in enumerate(path_info.contraction_list):
                    inds, idx_rm, einsum_str, remaining, do_blas = contraction
                    try:
                        new_view = core_contract(operands, inds, idx_rm, einsum_str)
                        operands.append(new_view)
                        if (
                            remaining is not None
                            and len(set(map(len, remaining))) == 1
                            and len(remaining) % 2 == 0
                        ):
                            save_matrices(name, operands)
                    except:
                        pass
                total_time = time.time() - start
                f.write(f"{total_time}s - {name}\n")
                f.flush()


if __name__ == "__main__":
    create_contractsion()
    convert_matrices_to_csv()
