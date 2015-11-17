%%%%%%%%%%%CODE DEVELOPED BY WAITFORIT TEAM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%HAS THE COMPLETE POINTS AND MISSING POINTS AS INPUTS%%%%%%%%%%
%%%%%%%%%%%IT RETURNS THE FILLED MATRIX%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [fullMatrix] = FillMissingValuesEnriquesMethodRBF(groundTrueData,datasetWithMissingValues)
[rowsDatasetWithMissingValues,~] = size(datasetWithMissingValues);
fullMatrix = zeros(rowsDatasetWithMissingValues,100);
datasetWithMissingValues(datasetWithMissingValues == 55) = 99;
tic
for i=1:rowsDatasetWithMissingValues
    rowToFill = datasetWithMissingValues(i,:);
    columnsWithMissingValues = find(rowToFill == 99);
    [numberOfMissingValues,~] = size(columnsWithMissingValues');
    newRow = rowToFill;
    for j=1:numberOfMissingValues
        rowToFill(columnsWithMissingValues(j)) = Inf;
        temp = rowToFill;
        temp(find(temp == 99)) = [];
        X = groundTrueData;
        X(:,columnsWithMissingValues) = [];
        targets = groundTrueData(:,columnsWithMissingValues(j));
        [sizeOfTraining,~] = size(X);
        sigma = norm(X(ceil(rand*sizeOfTraining),:)-X(ceil(rand*sizeOfTraining),:));
        %%RETURN CLUSTERS
        K = sizeOfTraining/10;
        [C,~] = vl_kmeans(X',round(K));
        C = C';
        for a=1:sizeOfTraining
        for b=1:round(K)
        A(a,b)=exp(-norm(X(a,:) - C(b,:))/sigma^2);
        end
        end
        weights = A \ targets;
        for c=1:round(K)
        u(c) = exp(-norm(temp(temp ~= Inf) - C(c,:))/sigma^2);
        end
        newRow(columnsWithMissingValues(j)) = weights'*u';
        if newRow(columnsWithMissingValues(j)) > 10
        newRow(columnsWithMissingValues(j)) = 10;
        elseif newRow(columnsWithMissingValues(j)) < -10
        newRow(columnsWithMissingValues(j)) = -10;
        end
        rowToFill(columnsWithMissingValues(j)) = 99;
    end
    fullMatrix(i,:) = newRow;
    display(strcat('NUMBERS OF ROWS LEFT: ',num2str(rowsDatasetWithMissingValues- i)))
    toc
end

end