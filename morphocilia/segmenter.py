from apoc import PixelClassifier
import numpy as np
from skimage.morphology import (
    binary_dilation,
    binary_erosion,
    remove_small_objects,
    label,
)


def cilia_segmenter(cilia_channel):
    """
    Segments the cilia channel of a lifimage. The segmenter
    is previously trained with apoc.
    """
    segmenter = PixelClassifier(
        opencl_filename="D:/estela/results/20240304/PixelClassifier_2.cl"
    )
    prediction = segmenter.predict(cilia_channel)

    return prediction


def cilia_cleaner(segmentation):
    """
    Polishes the apoc segmentation of the cilia channel.
    """
    eroded_prediction = binary_erosion((np.array(segmentation) > 1))
    polished_prediction = remove_small_objects(eroded_prediction, min_size=200)
    dilated_prediction = binary_dilation(polished_prediction)

    return dilated_prediction


def cilia_segmenter_cleaner(cilia_channel):
    """
    Segments and polishes the segmentation of the cilia channel.
    Returns a label.
    """
    prediction = cilia_segmenter(cilia_channel)
    clean_cilia = cilia_cleaner(prediction)
    labelled_prediction = label(clean_cilia)

    return labelled_prediction
