% Read the input image
clear;
close all
var_glcm={}
ent_glcm={}
ctr_glcm={}
current_fol = 'Enter current folder for images';
dest_fol='Enter place to save';
if ~isfolder(current_fol)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', current_fol);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(current_fol, '*.jpg');
jpgFiles = dir(filePattern);
for k = 1:length(jpgFiles)
  baseFileName = jpgFiles(k).name;
  fprintf(baseFileName)
  fullFileName = fullfile(current_fol, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);    
  I=imread(fullFileName);
  Agray = rgb2gray(A);
  imageSize = size(A);
  numRows = imageSize(1);
  numCols = imageSize(2);
  wavelengthMin = 4/sqrt(2);
  wavelengthMax = hypot(numRows,numCols);
  n = floor(log2(wavelengthMax/wavelengthMin));
  wavelength = 2.^(0:(n-2)) * wavelengthMin;
  deltaTheta = 15;
  orientation = 0:deltaTheta:(180-deltaTheta);
  g = gabor(wavelength,orientation);
  gabormag = imgaborfilt(Agray,g);
  for i = 1:length(g)
    sigma = 0.5*g(i).Wavelength;
    K = 3;
    gabormag(:,:,i) = imgaussfilt(gabormag(:,:,i),K*sigma); 
  end
  X = 1:numCols;
  Y = 1:numRows;
  [X,Y] = meshgrid(X,Y);
  featureSet = cat(3,gabormag,X);
  featureSet = cat(3,featureSet,Y);
  numPoints = numRows*numCols;
  X = reshape(featureSet,numRows*numCols,[]);
  X = bsxfun(@minus, X, mean(X));
  X = bsxfun(@rdivide,X,std(X));
  coeff = pca(X);
  feature2DImage = reshape(X*coeff(:,1),numRows,numCols);
end
save('Gabor_data.mat','feature2DImage');
