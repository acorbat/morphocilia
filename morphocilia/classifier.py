import joblib
import pandas as pd


def scale_columns(X, sca="scaler_3"):
    """
    Previously trained scaler scales the properties "solidity" and "axis_minor_length" of a cilia-channel dataframe.
    """
    scaler = joblib.load(f"D:/estela/results/20240410/{sca}.sca")
    return scaler.transform(X)


def classify_cilia(scaled_X, ml="cilia_classifier_4"):
    """
    Classifies cilia from a dataframe based on previously scaled "solidity" and "axis_minor_length".
    """
    cilia_classifier = joblib.load(f"D:/estela/results/20240410/{ml}.ml")
    return cilia_classifier.predict(scaled_X)


def scale_classify_cilia(X, sca="scaler_3", ml="cilia_classifier_4"):
    scaler = joblib.load(f"D:/estela/results/20240410/{sca}.sca")
    cilia_classifier = joblib.load(f"D:/estela/results/20240410/{ml}.ml")
    return cilia_classifier.predict(scaler.transform(X))
