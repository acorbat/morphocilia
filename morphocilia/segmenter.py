from apoc import PixelClassifier
import numpy as np
from skimage.exposure import rescale_intensity, adjust_gamma
from skimage.filters import threshold_otsu, threshold_li, gaussian
from skimage.morphology import (
    binary_dilation,
    binary_erosion,
    remove_small_objects,
    label,
    binary_opening,
    ball,
)
import os

MODULE_DIRECTORY = os.path.dirname(__file__)


def cilia_segmenter(cilia_channel):
    """
    Segments the cilia channel of a lifimage. The segmenter
    is previously trained with apoc.
    """
    path = os.path.join(MODULE_DIRECTORY, "PixelClassifier.cl")
    segmenter = PixelClassifier(opencl_filename=path)
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


def make_lumina_channel(
    f_actin_channel: np.ndarray, nuclei_channel: np.ndarray
) -> np.ndarray:
    """Makes the lumina channel from combining F-actin channel and nuclei
    channel with a couple of operations"""
    f_actin_channel = rescale_intensity(
        adjust_gamma(f_actin_channel.astype(float), gamma=0.5),
        out_range=(0, 255),
    )

    nuclei_channel = rescale_intensity(
        gaussian(
            adjust_gamma(nuclei_channel.astype(float), gamma=0.5),
            sigma=(2, 4, 4),
        ),
        out_range=(0, 255),
    )

    return f_actin_channel + nuclei_channel


def segment_cd13(cd13_channel: np.ndarray) -> np.ndarray:
    """Takes the CD13 channel stack and returns a mask for the CD13+ regions"""
    return cd13_channel > threshold_otsu(cd13_channel)


def segment_opn(opn_channel: np.ndarray) -> np.ndarray:
    """Takes the Osteopontin channel stack and returns a mask for the
    OPN+ regions"""
    opn_threshold = threshold_otsu(opn_channel)
    opn_mask = opn_channel > opn_threshold
    return binary_dilation(opn_mask)


def segment_lumina(lumina_channel: np.ndarray) -> np.ndarray:
    """Segments the lumina out of the lumina channel. Use make_lumina_channel
    to get the lumina channel."""
    lumina_threshold = threshold_li(lumina_channel)
    lumina_mask = lumina_channel < lumina_threshold
    lumina_mask = binary_closing(lumina_mask, footprint=ball(radius=5))
    lumina_mask = binary_opening(lumina_mask, footprint=ball(radius=1))
    return lumina_mask


def get_region_map(cd13_mask: np.ndarray, opn_mask: np.ndarray) -> np.ndarray:
    """Make the region map from the CD13+ and OPN+ segmentations"""
    expanded_cd13_mask = binary_dilation(
        cd13_mask, footprint=[(ball(radius=10)[::2], 2)]
    )
    expanded_opn_mask = binary_dilation(
        opn_mask, footprint=[(ball(radius=10)[::2], 2)]
    )

    return expanded_cd13_mask + 2 * expanded_opn_mask
