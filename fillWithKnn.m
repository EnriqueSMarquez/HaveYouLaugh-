function res = fillWithKnn(m)

m(m==55 | m==99) = NaN;

res = knnimpute(m, 30);
%Parameter k=30 found empirically by Alexey :)