%%%%%%%%%%%CODE DEVELOPED BY WAITFORIT TEAM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%HAS THE DATA SET AS INPUT AND RETURNS THE POINTS THAT DOES NOT
%%%%%%%%%%%HAVE MISSING ELEMENTS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [completeData] = FindHowManyPointsAreUseful(dataset)

[rows,columns] = size(dataset);
carrier = 1;
for i=1:rows
    rowToCheck = dataset(i,:);
    if isempty(rowToCheck(rowToCheck == 99)) == 1
        completeData(carrier,:) = dataset(i,:);
        carrier = carrier + 1;
    end
end
end