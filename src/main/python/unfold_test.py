import warnings
warnings.filterwarnings("ignore")

import torch
torch.set_printoptions(threshold=10_000, linewidth=10_000)

inp = torch.range(1, 100).resize(1, 1, 10, 10)
print("inp", inp)

# w = torch.randn(2, 1, 4, 5)
# w = torch.range(1, 9).resize(1, 1, 3, 3)
# # print(w)
# print("w", w.size())
# w = w.view(w.size(0), -1).t()
# # print(w)
# print("w view", w.size())

inp_unf = torch.nn.functional.unfold(inp, (3, 3))
print(inp_unf)
print("inp_unf size", inp_unf.size())

# Convolution is equivalent with Unfold + Matrix Multiplication + Fold (or view to output shape)
# out_unf = inp_unf.transpose(1, 2).matmul(w).transpose(1, 2)
# print("out_unf", out_unf.size())
