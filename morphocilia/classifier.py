import joblib
import pandas as pd


def scaler_df(df):
    """
    Previously trained scaler scales the properties "solidity" and "axis_minor_length" of a cilia-channel dataframe.
    """
    scaler = joblib.load("D:/estela/results/20240410/scaler.sca")
    X = df[["solidity", "axis_minor_length"]]
    scaled_features = scaler.transform(X)
    X[["scaled_solidity", "scaled_axis_minor_length"]] = pd.DataFrame(
        scaled_features, index=X.index, columns=X.columns
    )
    return X


def cilia_classifier(scaled_X):
    """
    Classifies cilia from a dataframe based on previously scaled "solidity" and "axis_minor_length".
    """
    cilia_classifier = joblib.load(
        "D:/estela/results/20240410/cilia_classifier.ml"
    )
    scaled_X["predicted"] = cilia_classifier.predict(
        scaled_X[["scaled_solidity", "scaled_axis_minor_length"]]
    )
    return scaled_X


def scaler_classifier(df):
    """
    Scales and classifies cilia from a dataframe based on "solidity" and "axis_minor_length".
    """
    scaler = joblib.load("D:/estela/results/20240410/scaler.sca")
    X = df[["solidity", "axis_minor_length"]]
    scaled_features = scaler.transform(X)
    X[["scaled_solidity", "scaled_axis_minor_length"]] = pd.DataFrame(
        scaled_features, index=X.index, columns=X.columns
    )
    cilia_classifier = joblib.load(
        "D:/estela/results/20240410/cilia_classifier.ml"
    )
    X["predicted"] = cilia_classifier.predict(
        X[["scaled_solidity", "scaled_axis_minor_length"]]
    )
    return X


def scaler_classifier_2(df):
    """
    Scales and classifies cilia from a dataframe based on "solidity" and "axis_minor_length".
    """
    scaler = joblib.load("D:/estela/results/20240410/scaler_3.sca")
    X = df[["solidity", "axis_minor_length"]]
    scaled_features = scaler.transform(X)
    X[["scaled_solidity", "scaled_axis_minor_length"]] = pd.DataFrame(
        scaled_features, index=X.index, columns=X.columns
    )
    cilia_classifier = joblib.load(
        "D:/estela/results/20240410/cilia_classifier_3.ml"
    )
    X["predicted"] = cilia_classifier.predict(
        X[["scaled_solidity", "scaled_axis_minor_length"]]
    )
    return X


def scale_columns(X, sca="scaler_3"):
    """
    Previously trained scaler scales the properties "solidity" and "axis_minor_length" of a cilia-channel dataframe.
    """
    scaler = joblib.load(f"D:/estela/results/20240410/{sca}.sca")
    return scaler.transform(X)


def classify_cilia(scaled_X, ml="cilia_classifier_3"):
    """
    Classifies cilia from a dataframe based on previously scaled "solidity" and "axis_minor_length".
    """
    cilia_classifier = joblib.load(f"D:/estela/results/20240410/{ml}.ml")
    return cilia_classifier.predict(scaled_X)


def scale_classify_cilia(X, sca="scaler_3", ml="cilia_classifier_3"):
    scaler = joblib.load(f"D:/estela/results/20240410/{sca}.sca")
    cilia_classifier = joblib.load(f"D:/estela/results/20240410/{ml}.ml")
    return cilia_classifier.predict(scaler.transform(X))


# df[["scaled_solidity", "scaled_axis_minor_length"]] = scaler(
#    df[["solidity", "axis_minor_length"]]
# )