function [] = TestMethod(groundTrueData)

[numberOfRows,~] = size(groundTrueData);
trainingSet = groundTrueData(1:floor(numberOfRows/2),:);
testSet = groundTrueData(floor(numberOfRows/2)+1:numberOfRows,:);
[testSize,~] = size(testSet);

testSetWithErasedValues = testSet;
elementsToUse = zeros(testSize,30);
for i=1:testSize
temp = randperm(100);
elementsToUse(i,:) = temp(1:30);
testSetWithErasedValues(i,elementsToUse(i,:)) = 99;
end

predictionsOnTestSet = FillMissingValues(trainingSet,testSetWithErasedValues);

for i=1:testSize
    for j=1:100
        if predictionsOnTestSet(i,j) < -10
            predictionsOnTestSet(i,j) = -10;
        elseif predictionsOnTestSet(i,j) > 10
            predictionsOnTestSet(i,j) = 10;
        end
    end
end

%%GET VECTORS
targetVector = 0;
predictionVector = 0;
for i=1:testSize
    targetVector = [targetVector ;testSet(i,elementsToUse(i,:))'];
    predictionVector = [predictionVector ;predictionsOnTestSet(i,elementsToUse(i,:))'];
end
targetVector(1) = [];
predictionVector(1) = [];
plot(targetVector,predictionVector,'bx')
end