%%%%%%%%%%%CODE DEVELOPED BY WAITFORIT TEAM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%HAS THE DATA SET AS INPUT AND RETURNS THE POINTS THAT %%%%%%%%
%%%%%%%%%%%HAVE MISSING ELEMENTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [dataset] = GetPointsWithMissingValues(dataset)

groundTrueData = FindHowManyPointsAreUseful(dataset);
[rowsGroundData,~] = size(groundTrueData);
for i=1:rowsGroundData
    index = find(ismember(dataset,groundTrueData(i,:)),1);
    dataset(index,:) = [];
    disp(strcat('NUMBER OF ROWS LEFT: ', num2str(rowsGroundData - i)))
end

end