from pprint import pprint

import numpy as np
from numpy.lib.stride_tricks import sliding_window_view

from systolic.im2col_test_img import outputs

np.set_printoptions(edgeitems=30, linewidth=100000,
                    formatter=dict(float=lambda x: "%.3g" % x))


def make_img(imgSize, padding, ch):
    # return np.pad(
    #     np.ones(imgSize * imgSize * ch).reshape(imgSize, imgSize, ch) % (1 << 7),
    #     ((padding, padding), (padding, padding
    #                           ), (0, 0))
    # )
    return np.pad(
        np.arange(1, imgSize * imgSize * ch + 1)[::-1].reshape(imgSize, imgSize, ch) % (1 << 7),
        ((padding, padding), (padding, padding
                              ), (0, 0))
    )


runtimeCycles = 1

channels = 1
inputCycles = 1
kernelSize = 5
padAmt = kernelSize // 2

imgSize = 16
noReg = (kernelSize - 1)
bufferSize = runtimeCycles * inputCycles * imgSize - noReg
latency = inputCycles * runtimeCycles * imgSize * (kernelSize - (padAmt + 1)) + (
        kernelSize - (padAmt + 1)) * runtimeCycles * inputCycles + 1

print(make_img(imgSize, 0, channels)[:, :, 0])
padded_img = make_img(imgSize, padAmt, channels)[:, :, 0]
# print()
print(padded_img)
# print()

checks = []
patches = sliding_window_view(padded_img, (kernelSize, kernelSize))
for _ in range(2):
    for i in reversed(range(imgSize)):
        for j in reversed(range(imgSize)):
            checks.append(patches[i, j])

for i, outs in enumerate(outputs):
    (imRowIdx, imColIdx), outs = outs[0], outs[1:]
    full = np.array(outs).reshape(kernelSize, kernelSize)
    if i >= latency - 1:
        correct = checks[i - (latency - 1)]


    regOuts = np.zeros(kernelSize * kernelSize)

    for kRowIdx in range(0, kernelSize):
        for kColIdx in range(0, kernelSize):
            ch = 0
            outsIdx = kRowIdx * kernelSize + kColIdx
            outAtRowColCh = outs[outsIdx]
            regOutIdx = outsIdx * channels + ch
            regOuts[regOutIdx] = outAtRowColCh

            # beginning of row condition (left side of patch)
            if padAmt <= imColIdx < kColIdx:
                regOuts[regOutIdx] = 0
            # wrap from end to beginning of row
            elif kColIdx <= imColIdx < padAmt:
                regOuts[regOutIdx] = 0

            if imColIdx < padAmt:
                # if colWrap act like the previous row!!!!
                prevRow = imRowIdx - 1
                print("prevRow", prevRow)
                if padAmt <= prevRow < kRowIdx:
                    regOuts[regOutIdx] = 0
                if kRowIdx <= prevRow < padAmt:
                    regOuts[regOutIdx] = 0
            else:
                # first row condition
                if padAmt <= imRowIdx < kRowIdx:
                    regOuts[regOutIdx] = 0
                # wrap from last row to first row of next image
                if kRowIdx <= imRowIdx < padAmt:
                    regOuts[regOutIdx] = 0

    r = regOuts.reshape(5, 5)
    if i >= latency - 1:
        print("correct")
        pprint(correct)
        print("r")
        pprint(r)
        if not np.all(r == correct):
            print(i, "false", imRowIdx, imColIdx)
            print("***********************")



# if (imColIdx - 1) % imgSize == imgSize - 1 or (imColIdx - 2) % imgSize == imgSize - 1:
#     colWrap = True
# else:
#     colWrap = False
#
# if (imRowIdx - 1) % imgSize == imgSize - 1 or (imRowIdx - 2) % imgSize == imgSize - 1:
#     rowWrap = True
# else:
#     rowWrap = False
#
# regOuts = np.zeros(kernelSize * kernelSize)
#
# for kRowIdx in range(0, kernelSize):
#     for kColIdx in range(0, kernelSize):
#         ch = 0
#         outsIdx = kRowIdx * kernelSize + kColIdx
#         outAtRowColCh = outs[outsIdx]
#         regOutIdx = outsIdx * channels + ch
#         regOuts[regOutIdx] = outAtRowColCh
#
#         # left condition
#         if padAmt <= imColIdx < kernelSize and kColIdx > imColIdx:
#             regOuts[regOutIdx] = 0
#         # wrap from right to left condition
#         if colWrap:
#             if imColIdx < padAmt and kColIdx <= imColIdx:
#                 regOuts[regOutIdx] = 0
#             # if colWrap act like the previous row!!!!
#             if padAmt <= imRowIdx - 1 < kernelSize and kRowIdx > imRowIdx - 1:
#                 regOuts[regOutIdx] = 0
#
#             if imRowIdx - 1 < padAmt and kRowIdx <= imRowIdx - 1:
#                 regOuts[regOutIdx] = 0
#
#         else:
#             if padAmt <= imRowIdx < kernelSize and kRowIdx > imRowIdx:
#                 regOuts[regOutIdx] = 0
#             # wrap from bottom to top
#             if rowWrap and imRowIdx < padAmt and kRowIdx <= imRowIdx:
#                 regOuts[regOutIdx] = 0