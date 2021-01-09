# Fusion-Based-Skin-Cancer-Detection

> **Authors:** 
> Dr. Ruban N
> Tharun J Iyer
> Dr. Alex Noel Joseph Raj
> Dr. Vijayraghavan R

## Introduction
- This repository provides code for the research "_**A Dermoscopic Skin Lesion Classication Technique using YOLO-CNN and Traditional Feature Model**_"
- The dataset can be downloaded from here. It is openly available:
- https://challenge.isic-archive.com/landing/2016/39 (David Gutman, Noel CF Codella, Emre Celebi, Brian Helba, Michael Marchetti, Nabin Mishra, and Allan Halpern. Skin lesion analysis toward melanoma detection: A challenge at the international symposium on biomedical imaging (ISBI) 2016, hosted by the international skin imaging collaboration (ISIC). arXiv preprint arXiv:1605.01397, 2016.)

## Steps to run the code
- First download the images from the above mentioned websites. They are open-source so the images are freely available
- Run preprocess.m in the Preprocessing folder of the repository to preprocess the images. This is a MATLAB file. 
- The platform to train the models and run the predictions used was Google Colab. Hence, images are uploaded to a drive and the notebooks are mounted from the drive. 
- Run each IPYNB under the train folder to train the models and predict the masks. 
