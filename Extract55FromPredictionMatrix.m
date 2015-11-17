function [matrix55] = Extract55FromPredictionMatrix(PredictionMatrix,testMatrix)

carrier = 1;
matrix55 = zeros(3000,3);
for i=1:3000
    for j=1:100
    
        if testMatrix(i,j) == 55
        matrix55(i,carrier) = PredictionMatrix(i,j);
        carrier = carrier + 1;
        end
        
    end
    carrier = 1;
end


end