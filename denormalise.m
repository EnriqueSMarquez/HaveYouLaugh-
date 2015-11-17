function denormM = denormalise(m, Corr, Mx, Mn)

%Needed just for the normalisation+immediately denormalisation tests
m(m==55 | m==99) = NaN;

[s1, s2] = size(m);

for i=1:s1
    for j=1:s2
        if (~(isnan(m(i,j))) && ~(Corr(i)==Inf))

            %Rescale and shift the normalised values to match the user
            m(i,j) = m(i,j)/Corr(i)+(Mx(i)+Mn(i))/2;

        end
    end
end

denormM = m;