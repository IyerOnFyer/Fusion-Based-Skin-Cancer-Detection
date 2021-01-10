# Fusion-Based-Skin-Cancer-Detection

> **Authors:** 
> Dr. Ruban N
> Tharun J Iyer
> Dr. Alex Noel Joseph Raj
> Dr. Vijayraghavan R

## Introduction
- This repository provides code for the research "_**A Dermoscopic Skin Lesion Classification Technique using YOLO-CNN and Traditional Feature Model**_"
- The dataset can be downloaded from here. It is openly available:
- https://challenge.isic-archive.com/landing/2016/39 (David Gutman, Noel CF Codella, Emre Celebi, Brian Helba, Michael Marchetti, Nabin Mishra, and Allan Halpern. Skin lesion analysis toward melanoma detection: A challenge at the international symposium on biomedical imaging (ISBI) 2016, hosted by the international skin imaging collaboration (ISIC). arXiv preprint arXiv:1605.01397, 2016.)

## Steps to run the code
- First download the images from the above mentioned websites. They are open-source so the images are freely available
- The YOLO folder contains the source files to build the darkflow model. Darkflow is an implementation of the darknet model for tensorflow. Many thanks to Trieu and Trinh Hoang for the [Darkflow](https://github.com/thtrieu/darkflow) implementation that serves as a base model for this repo. 
- The GLCM, Gabor and CLCM folder contain source files to extract the GLCM, Gabor and CLCM features for this study. They should be run on the MATLAB platform and were orignally run on MATLAB R2019a. 
- Once the features are extracted, they are fused into the network as .mat files. 
