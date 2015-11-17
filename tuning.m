%%% Merges the results from the two matrices (obtained by NNM and KNN)

function res = tuning(original, nuclRes, knnRes)

[s1, ~] = size(original);

tsize = s1-3000;

res = original;

for i=1:3000

    cnt = 0;
    j = 1;
    while (cnt < 3)

        if (original(tsize+i,j)==55)
            
            value = nuclRes(tsize+i,j);
            
            %Values in the range -2:2 are decreased
            if ((value < 2) || value > -2)
                value = value*0.64;
            end
            
            %The best proportion of each matrix has been found empirically
            value = value*0.44 + knnRes(tsize+i,j)*0.56;
            
            %If a value is out of the range -10:10, we fix it
            if (value > 10)
                value = 10;
            elseif (value < -10)
                value = -10;
            end
            
            res(tsize+i,j) = value;
            cnt = cnt + 1;
        end
        j = j+1;
    end
end
