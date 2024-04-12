def cilia_segmenter(cilia_channel):
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
    prediction = cilia_segmenter(
        "D:/estela/results/20240304/PixelClassifier_2.cl"
    )
    clean_cilia = cilia_cleaner(prediction)

    return clean_cilia
