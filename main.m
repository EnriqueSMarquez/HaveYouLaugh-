%%% Main file lauching the different steps
%%% the 'full' I'm using here is the kaggle77b_fullset in our Data folder

%Fix the rows where the user is putting the same values for all jokes
full = fixIdenticalRatings(full);

%-----

%Normalisation: expand values from the user's personal range to range -10:10
[normM, Corr, Mx, Mn] = normalise(full);

%Method 1) Fill the matrix by KNN Imputation
knn = fillWithKnn(normM);

%Denormalisation of the resulting matrix: go back to user's range
knnDenorm = denormalise(knn, Corr, Mx, Mn);

%------

%Method 2) Fill the matrix by Nuclear Norm Minimization
nuclRes = fillWithNuclearNorm(full);

%------

%Mix these two resulting matrices with some tuning of the parameters
res = tuning(full, nuclRes, knnDenorm);

exportFullMatrixToCsv(full, res);