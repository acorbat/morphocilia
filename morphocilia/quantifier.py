import numpy as np
import pandas as pd
from skimage.measure import regionprops_table


def cilia_props_table(label, cilia_channel):
    """
    Extracts selected properties from a cilia-channel image and its label. Returns a pandas dataframe.
    """
    props = regionprops_table(
        label,
        cilia_channel.compute(),
        properties=[
            "label",
            "area",
            "axis_major_length",
            "axis_minor_length",
            "intensity_max",
            "solidity",
        ],
    )
    data = pd.DataFrame(props)
    return data
