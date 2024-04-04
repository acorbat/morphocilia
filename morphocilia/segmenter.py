import numpy as np
from skimage.filters import threshold_otsu


def segment_cd13(cd13_channel: np.ndarray) -> np.ndarray:
    """Takes the CD13 channel stack and returns a mask for the CD13+ regions"""
    return cd13_channel > threshold_otsu(cd13_channel)
