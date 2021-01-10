function [featureVector] = integrative_cooccurrence_matrices(I)

    %Integrative co-occurrence matrices

    %Input:     I (colour image)
    %Output:    featureVector (feature vector)
    
    featureVector = [];
    
    [rows, cols] = size(I);

    %Number of gray-scale levels
    G = 256;

    %Define displacements
    D = [1 0; 1 1; 0 1; -1 1; -1 0; -1 -1; 0 -1; 1 -1];

    
    averageMatrices = 'Y';  %for rotation invariance

    %Compute intra-band co-occurrence matrices
    CM_red = ComputeCooccurrenceMatrices(I(:,:,1), I(:,:,1), G, D, averageMatrices);
    CM_green = ComputeCooccurrenceMatrices(I(:,:,2), I(:,:,2), G, D, averageMatrices);
    CM_blue = ComputeCooccurrenceMatrices(I(:,:,3), I(:,:,3), G, D, averageMatrices);
    
    %Compute inter-band co-occurrence matrices
    CM_red_green = ComputeCooccurrenceMatrices(I(:,:,1), I(:,:,2), G, D, averageMatrices);
    CM_red_blue = ComputeCooccurrenceMatrices(I(:,:,1), I(:,:,3), G, D, averageMatrices);
    CM_green_blue = ComputeCooccurrenceMatrices(I(:,:,2), I(:,:,3), G, D, averageMatrices);
   
    %Compute features
    figure;
    bar(CooccurrenceFeatures(CM_red, G));
    title('CLCM Features for Red Channel');
    ylabel('Amplitude');
    xlabel('Features');
    disp(CooccurrenceFeatures(CM_red, G));
    
    figure;
    bar(CooccurrenceFeatures(CM_green, G));
    title('CLCM Features for Green Channel');
    ylabel('Amplitude');
    xlabel('Features');
    disp(CooccurrenceFeatures(CM_green, G));
    
    figure;
    bar(CooccurrenceFeatures(CM_blue, G));
    title('CLCM Features for Blue Channel');
    ylabel('Amplitude');
    xlabel('Features');
    disp(CooccurrenceFeatures(CM_blue, G));
    
    figure;
    bar(CooccurrenceFeatures(CM_red_green, G));
    title('CLCM Features for Red and Green Channel');
    ylabel('Amplitude');
    xlabel('Features');
    disp(CooccurrenceFeatures(CM_red_green, G));
    
    figure;
    bar(CooccurrenceFeatures(CM_red_blue, G));
    title('CLCM Features for Red and Blue Channel');
    ylabel('Amplitude');
    xlabel('Features');
    disp(CooccurrenceFeatures(CM_red_blue, G));
    
    figure;
    bar(CooccurrenceFeatures(CM_green_blue, G));
    title('CLCM Features for Green and Blue Channel');
    ylabel('Amplitude');
    xlabel('Features');
    disp(CooccurrenceFeatures(CM_green_blue, G));
    
    featureVector = [CooccurrenceFeatures(CM_red, G),...
                     CooccurrenceFeatures(CM_green, G),...
                     CooccurrenceFeatures(CM_blue, G),...
                     CooccurrenceFeatures(CM_red_green, G),...
                     CooccurrenceFeatures(CM_red_blue, G),...
                     CooccurrenceFeatures(CM_green_blue, G)];
     figure;
     bar(featureVector);
     title('Colour Level Covariance Feature Vector');
     ylabel('Amplitude');
     xlabel('Features');
end