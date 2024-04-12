from apoc import PixelClassifier
import numpy as np
from skimage.morphology import (
    binary_dilation,
    binary_erosion,
    remove_small_objects,
    label,
)
from skimage.measure import label


def cilia_segmenter(cilia_channel):
    """
    This function segments the cilia channel of a lifimage. It returns an ndarray.
    Parameters:
    path: path
        Path where the .lif file is found.
    index: integer
        Indicates the image to be later opened from the experiment file (starting from 0).
    """
    segmenter = PixelClassifier(
        opencl_filename="D:/estela/results/20240304/PixelClassifier_2.cl"
    )
    prediction = segmenter.predict(cilia_channel)

    return prediction


def cilia_cleaner(segmentation):
    eroded_prediction = binary_erosion((np.array(segmentation) > 1))
    polished_prediction = remove_small_objects(eroded_prediction, min_size=200)
    dilated_prediction = binary_dilation(polished_prediction)

    return dilated_prediction


def cilia_segmenter_cleaner(cilia_channel):
    prediction = cilia_segmenter(cilia_channel)
    clean_cilia = cilia_cleaner(prediction)
    labelled_prediction = label(clean_cilia)

    return labelled_prediction
