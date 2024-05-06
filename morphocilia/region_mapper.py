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


def get_regions(labelled_img, regionmap):
    props = regionprops_table(
        labelled_img,
        regionmap,
        properties=["label", "intensity_max"],
        extra_properties=[set],
    )

    df = pd.DataFrame(props)
    df = props.rename(columns={"intensity_max": "region", "set": "all_regions"})
    df["region"] = df["region"].apply(parse_regions)
    return df
