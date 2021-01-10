function [featureVector] = CooccurrenceFeatures(CM, G)

	%Input:		CM (co-occurrence matrix)
    %           G (number of gray levels)
	%Output:	featureVector (energy, contrast, correlation, homogeneity and entropy)
    
    [rows cols] = size(CM);
    
    %ENERGY
    E = 0;
    
    %CONTRAST
    C = 0;
    
    %CORRELATION
    COR = 0;
    
    %ENTROPY
    H = 0;
    
    %LOCAL HOMOGENEITY
    LH = 0;
    
    %Compute ENERGY, CONTRAST, CORRELATION and HOMOGENEITY
    stats = graycoprops(CM,{'energy','contrast','correlation','homogeneity'});
    
    %Compute ENTROPY
    CM = CM/(sum(sum(CM)));
    for r = 1:rows
        for c = 1:cols
            if CM(r,c) ~= 0
                H = H + CM(r,c)*log2((CM(r,c)));
            end
        end
    end
    %Normalize entropy (entropy is max when all the entries of the matrix are equally probable)
    H = H/log2(1/(G^2));

    featureVector = [stats.Energy, stats.Contrast/((G - 1)^2), stats.Correlation/2 + 1/2, stats.Homogeneity, H];
end