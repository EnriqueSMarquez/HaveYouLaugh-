%%%%%%%%%%%% Calculates the MSE of the 55 values %%%%%%%%%%%
%%%% Inputs :
%%%% - Correct = matrix containing the true values at 55 locations
%%%% - Missing = matrix containing the '55'
%%%% - Estimation = matrix containing our estimations of these values

function MSE = calculateMSE(correct, missing, estimation)

[nbUsers,nbMovies] = size(correct);

totError = 0;
nbEstimations = 0;

for i=1:nbUsers
    for j=1:nbMovies
        if (missing(i,j)==55)
            localError = correct(i,j) - estimation(i,j);
            totError = totError + localError^2;
            nbEstimations = nbEstimations + 1;
        end
    end
end

MSE = totError/nbEstimations;