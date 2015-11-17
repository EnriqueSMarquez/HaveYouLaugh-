%%%%%%%%%%%CODE DEVELOPED BY WAITFORIT TEAM%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%HAS THE DATA SET AS INPUT AND RETURNS THE TOTAL MISSING VALUES
%%%%%%%%%%%PER ROW. ALSO, IT DRAWS AN HISTOGRAM WITH THOSE MISSING VALUES
function [numberOfMissingValues] = NumberOfMissingValuesInEachRow(dataset)
dataset(dataset == 55) = 99;
[rows,~] = size(dataset);
numberOfMissingValues = zeros(rows,1);
for i=1:rows
    rowToCheck = dataset(i,:);
    rowToCheck = rowToCheck(rowToCheck == 99);
    [rowToCheck,~] = size(rowToCheck(:));
    numberOfMissingValues(i) = rowToCheck;
end

histogramX = zeros(1,max(numberOfMissingValues));
for i=0:max(numberOfMissingValues)
    temp = size(numberOfMissingValues(numberOfMissingValues == i));
    histogramX(i+1) = temp(1,1);
end
histogramX = histogramX*100/rows;
bar(linspace(0,max(numberOfMissingValues),max(numberOfMissingValues)+1),histogramX)
axis([0 max(numberOfMissingValues) 0 max(histogramX) + 2])
ylabel('PERCENTAGE OF MISSING VALUES','FontSize',14)
xlabel('NUMBER OF MISSING VALUES','FontSize',16)
end