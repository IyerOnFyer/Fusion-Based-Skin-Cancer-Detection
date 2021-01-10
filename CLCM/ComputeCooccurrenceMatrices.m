function CM = ComputeCooccurrenceMatrices(I1, I2, G, displacements, averageMatrices);

	%Input:		I1 and I2 are one-channel images
	%			displacements is a matrix of Nx2 displacements
	%			averageMatrices flag to average the matrices for
	%			rotation-invariance ('Y' == average matrices)
	%			G = number of grayscale levels
	%Output:	CM (co-occurrence matrices)
    % 
	
	[rows cols] = size(I1);

	if [rows cols] ~= size(I2)
		error('The input images should be the same size'); 
	end

	nDisplacements = size(displacements, 1);

	maxDispX = max(displacements(:,1));
	maxDispY = max(displacements(:,2));
	minDispX = min(displacements(:,1));
	minDispY = min(displacements(:,2));

	CM = zeros(G, G, nDisplacements);

	for r = 1:rows
		for c = 1:cols
			for d = 1:nDisplacements
			
				r_I2 = r + displacements(d,2);
				c_I2 = c + displacements(d,1);
			
				r_I2 = ConvertToToroidalCoordinate(r_I2, rows);
				c_I2 = ConvertToToroidalCoordinate(c_I2, cols);
						
				CM(I1(r,c) + 1, I2(r_I2,c_I2) + 1, d) = CM(I1(r,c) + 1, I2(r_I2,c_I2) + 1, d) + 1;
			end
		end
	end

	%Average matrices if required
	if averageMatrices == 'Y'
		AVGCM = mean(CM,3);
		CM = round(AVGCM);
	end

end