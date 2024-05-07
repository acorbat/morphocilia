# morphocilia
Package for cilia segmentation and morphological description, and bile duct and canaliculi regionalization during development of liver thick sections.

## Segmentation
The [cilia_segmentation notebook](https://github.com/acorbat/morphocilia/blob/cilia_classifier/notebooks/cilia_segmentation.ipynb) shows the development of a strategy to binarise and label cilia from intrahepatic bile ducts stained with Arl13b. For the binarisation, the Napari APOC pixel classifier and some morphological parameters were used.
The function cilia_segmenter_cleaner in the [segmenter.py module](https://github.com/acorbat/morphocilia/blob/cilia_classifier/morphocilia/segmenter.py) is in charge of binarising and labelling the cilia channel of these bile duct images.

## Quantification
Once the images are segmented, the [cilia_quantification notebook](https://github.com/acorbat/morphocilia/blob/cilia_classifier/notebooks/cilia_quantification.ipynb) uses the scikit-image regionprops function to populate a table with relevant parameters for the classification of cilia into different types.
The cilia_props_table function from the [quantifier.py module](https://github.com/acorbat/morphocilia/blob/cilia_classifier/morphocilia/quantifier.py) is in charge of creating the aforementioned table.

## Classification
In the [cilia_classification notebook](https://github.com/acorbat/morphocilia/blob/cilia_classifier/notebooks/cilia_classification.ipynb) we developed a pipeline to classify cilia into 4 different classes: fibroblastic, looped, elongated, and uncertain. For this purpose the data was first scaled with the StandardScaler from sklearn. Then, the KNeighborsClassifier, also from sklearn, was trained with two parameters: solidity and axis_minor_length. These parameters had shown the best cilia separation in a previous pairplot.
The scale_columns and classify_cilia functions from the [classifier.py module](https://github.com/acorbat/morphocilia/blob/cilia_classifier/morphocilia/classifier.py) can be used to scale data and classify cilia from intrahepatic bile ducts.

## Region map
The [regionmapping notebook](https://github.com/acorbat/morphocilia/blob/cilia_classifier/notebooks/regionmapping.ipynb) contains several steps for the division of portal vein niche images into different regions based on CD13 (bile canaliculi) and OPN (bile ducts) stainings.
The first two steps consist of the segmentation of CD13+ and OPN+ regions. Otsu thresholding was applied to both stainings.
The third step of the notebook consists of the segmentation of lumina by combining DAPI (nuclei) and Phalloidin (F-actin) staining. In this case, Li thresholding was applied.
The last step of this notebook consists of the region mapper. This part of the notebook uses the previous CD13 and OPN segmentations to create a mask which separates the opn+, cd13+, and mixed regions.
The [segmenter.py module](https://github.com/acorbat/morphocilia/blob/cilia_classifier/morphocilia/segmenter.py) contains segment_cd13, segment_opn, and get_region_map to create a mask with the different regions of the portal vein niche.

## Mapping classified cilia
In the [classification_regionmap notebook](https://github.com/acorbat/morphocilia/blob/cilia_classifier/notebooks/classification_regionmap.ipynb) we combined the classification of cilia with the region they are located in.
The get_regions function from the [region_mapper.py module](https://github.com/acorbat/morphocilia/blob/cilia_classifier/morphocilia/region_mapper.py) takes the regionmap mask and returns a table with two columns: a first column indicating the region in which each cilia is located and a second one indicating whether the cilia is in one or more regions.

# Cilia classification and mapping in an entire dataset
The [cilia_mapping_all notebook](https://github.com/acorbat/morphocilia/blob/cilia_classifier/notebooks/cilia_mapping_all.ipynb) shows how to create a dataframe containing the classification of all cilia and their alocation into the different regions by iterating through all the images from an existing dataset.

# Development

Remember to always work in a new environment.

You should first ```git clone``` the repository locally and then make a new branch with ```git checkout -b [new_branch]```.

Install ```morphocilia``` in editable mode with tests running.

```
pip install -e .[test]
```

Then install ```pre-commit``` and install the pre-commit hooks (these run at ```git commit``` time and do some checks on the to-be-committed files):

```
pip install pre-commit
pre-commit install
```

## Structure

Modules composing morphocilia should work interconnected as shown below. If needed, a new uml can be created from ```umls.txt```.

![Pipeline](https://www.plantuml.com/plantuml/png/XLJ1RjmW4Btp5GWfjwHIb5iELQBqKgbHrJQtrMg5xOcN1WC5h6fLvTyx0-l5faWz6Hvl1kQz6J-4A7sS9yr-1cluvqcEmFymqH-bCQ23kD-9NcabnJKNJvzkx-ZxDKImpfgeZDYpTyQSxDym41b4vOz6wbDGGM0crji9gM3YSle3nWctu0MNWQVaXx1W6E6inyJdW_Cxw99T3d_ICWJrgi3lItn_0HVQjrcQY4Wlex9cHVsrEM2vxXJp8ZkTYdSsA3eKzw874xrLWxXcGeCPun71UQ8jQEMGTqB0Kox1ti_P7eVXnMvJfhjvF3aWHRMr3WQICaGlrNYCj8ROYpqcxa1RCmOUBVSmfdVmdUYKXiCmzubwF7LUfGIlglEsm_9ZjcBjnfTvKkOYUAgNB2cEj1aebIQyQOleXzixVhObSGauO02O2yUM1jbG4S_Cv6U-l7QgND-sAaKLON-hWJpXQChYqJ6M_HMdfgNzLTvYx-RTyWGmIqjLBm2pQgkjiD-JBVnPkahFP-dVmF-hvvJmGrZX_vKqnsmqRKkwCDcEQjrSlcUxrR1MHrYHiGEMCqdt0NL-pGddw6RAwLBD-OzmS_En6iY25rCBbWgemVBKchaKKFyCaD2UsXQOs6NgM5cMF6j7Qu1OzUWoLar2PhNxiuaIVzsphDKA5MMrpjVLpLW3n5eRLvQyKTC3c66Uz5y0)
