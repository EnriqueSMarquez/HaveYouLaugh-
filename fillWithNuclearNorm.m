function res = fillWithNuclearNorm(m)

% this is the fifth technique to use
% but this experiment is done over the fourk dataset
% based on CVX toolbox
% it is mentioned in this article
% http://www.convexoptimization.com/wikimization/index.php/Matrix_Completion

clc;

addpath(genpath('./cvx/'));
addpath(genpath('./TFOCS/'));
addpath(genpath('./Shared/'));

t_test = m;

% the matrix is M x N
% m is the users, n is the jokes
[M, N] = size(t_test);

% Let omega be the indeces of the observed entries
% i.e the indeces of user ratings ratings that does not equal to 99 and 55
omega = find(t_test ~= 99 & t_test ~= 55);

% the observed entries themselves, not their indeces
% i.e these are the user ratings
observations = t_test(omega);

% smoothing parameter
mu = 0.00001;
epsilon = 0.01;

% The solver runs in seconds
tic
t_estm = solver_sNuclearBP( {M,N,omega}, observations, mu );
toc

% or we could use relaxted parameter for faster solution
%t_estm = solver_sNuclearBPDN( {M,N,omega}, observations, epsilon, mu );

res = t_estm;