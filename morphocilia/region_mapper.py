import pandas as pd
from skimage.measure import regionprops_table


def parse_regions(region_number):
    if region_number == 1:
        return "cd13+"
    elif region_number == 2:
        return "opn+"
    elif region_number == 3:
        return "both"
    elif region_number == 0:
        return "NA"
    else:
        raise ValueError


def region_set(mask, intensity_image):
    return set(intensity_image[mask])


def get_regions(labelled_img, regionmap):
    props = regionprops_table(
        labelled_img,
        regionmap,
        properties=["label", "intensity_max"],
        extra_properties=[region_set],
    )

    df = pd.DataFrame(props)
    df = df.rename(
        columns={"intensity_max": "region", "region_set": "all_regions"}
    )
    df["region"] = df["region"].apply(parse_regions)
    return df
