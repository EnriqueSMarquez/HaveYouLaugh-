%%%%%%%%%%%% Calculates the RMSE of the 55 values %%%%%%%%%%%
%%%% Inputs :
%%%% - Correct = matrix containing the true values at 55 locations
%%%% - Missing = matrix containing the '55'
%%%% - Estimation = matrix containing our estimations of these values
function RMSE = calculateRMSE(correct, missing, estimation)

res = calculateMSE(correct, missing, estimation);

RMSE = sqrt(res);