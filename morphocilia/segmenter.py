import numpy as np
from skimage.filters import threshold_otsu
from skimage.morphology import binary_dilation


def segment_cd13(cd13_channel: np.ndarray) -> np.ndarray:
    """Takes the CD13 channel stack and returns a mask for the CD13+ regions"""
    return cd13_channel > threshold_otsu(cd13_channel)


def segment_opn(opn_channel: np.ndarray) -> np.ndarray:
    """Takes the Osteopontin channel stack and returns a mask for the
    OPN+ regions"""
    opn_threshold = threshold_otsu(opn_channel)
    opn_mask = opn_channel > opn_threshold
    return binary_dilation(opn_mask)
