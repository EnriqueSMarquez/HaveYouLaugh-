%%%%%%%%%%%CODE DEVELOPED BY WAITFORIT TEAM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%HAS THE COMPLETE POINTS AND MISSING POINTS AS INPUTS%%%%%%%%%%
%%%%%%%%%%%IT RETURNS THE FILLED MATRIX%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [fullMatrix] = FillMissingValuesEnriquesMethod(groundTrueData,datasetWithMissingValues)
[rowsDatasetWithMissingValues,~] = size(datasetWithMissingValues);
datasetWith55 = datasetWithMissingValues;
datasetWithMissingValues(datasetWithMissingValues == 55) = 99;

fullMatrix = zeros(rowsDatasetWithMissingValues,100);
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
        [~,trainingSize] = size(X);
        targets = groundTrueData(:,columnsWithMissingValues(j));
        net = feedforwardnet(85);
        net = train(net,X',targets');
        newRow(columnsWithMissingValues(j)) = net(temp(temp ~= Inf));
        if newRow(columnsWithMissingValues(j)) > 10
        newRow(columnsWithMissingValues(j)) = 10;
        elseif newRow(columnsWithMissingValues(j)) < -10
        newRow(columnsWithMissingValues(j)) = -10;
        end
        rowToFill(columnsWithMissingValues(j)) = 99;
    end
    fullMatrix(i,:) = newRow;
    display(strcat('NUMBERS OF ROWS LEFT: ',num2str(rowsDatasetWithMissingValues- i)))
end
end