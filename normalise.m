function [normM, Corr, Mx, Mn] = normalise(m)

m(m==55 | m==99) = NaN;

[s1, s2] = size(m);

for i=1:s1 
    
    %1) Calculate ratio of the user's range wrt the the max range => Corr
    Mx(i) = max(m(i,:));
    Mn(i) = min(m(i,:));
    Corr(i) = Mx(i) - Mn(i);
    Corr(i) = 20 / Corr(i);
    
    %2) Calculate average of the user's ratings
    %Avr(i)= nanmean(m(i,:));
    
    for j=1:s2
        %! When a user puts the same rating for all jokes, his Corr(i)=Inf
        %His missing values are filled by another script, we ignore him here
        if (~isnan(m(i,j)) && ~(Corr(i)==Inf))

            % Rescale and shift the user's values to match the range -10:10
            m(i,j)= m(i,j)*Corr(i)-(Mx(i)+Mn(i))/2;
        end
    end
end

m(isnan(m)) = 55;
normM = m;