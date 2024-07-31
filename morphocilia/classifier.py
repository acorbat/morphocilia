import joblib
import os

MODULE_DIRECTORY = os.path.dirname(__file__)


def scale_columns(X, sca="Scaler"):
    """
    Previously trained scaler scales the properties "solidity" and
    "axis_minor_length" of a cilia-channel dataframe.
    """
    path = os.path.join(MODULE_DIRECTORY, f"{sca}.sca")
    scaler = joblib.load(path)
    return scaler.transform(X)


def classify_cilia(scaled_X, ml="CiliaClassifier"):
    """
    Classifies cilia from a dataframe based on previously scaled
    "solidity" and "axis_minor_length".
    """
    path = os.path.join(MODULE_DIRECTORY, f"{ml}.ml")
    cilia_classifier = joblib.load(path)
    return cilia_classifier.predict(scaled_X)
