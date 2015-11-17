function [normalizedMatrix] = NormalizationOfData(predictedMatrix,matrixWithMissingValues)


[sizeOfData,~] = size(predictedMatrix);
normalizedMatrix = predictedMatrix;
for i=1:sizeOfData
   
    rowToCheck = matrixWithMissingValues(i,:);
    rowToCheck(rowToCheck == 99) = [];
    rowToCheck(rowToCheck == 55) = [];
    maxValueOfRow = max(rowToCheck);
    minValueOfRow = min(rowToCheck);

    for j=1:100
        
        if(matrixWithMissingValues(i,j) == 55 || matrixWithMissingValues(i,j) == 99)
        
            normalizedMatrix(i,j) = (predictedMatrix(i,j)+10)*(maxValueOfRow-minValueOfRow)/20+minValueOfRow;
            
        end
        
    end
    
end


end