function final = exportFullMatrixToCsv(original, estimate)

topublish = zeros(3000, 4);

[s1, ~] = size(original);

tsize = s1-3000;

for i=1:3000
    %first column is the userID
    topublish(i,1) = i;
    
    %fill the three 55 values per user
    cnt = 0;
    j = 1;
    while (cnt < 3)
        if (original(tsize+i,j)==55)
            value = estimate(tsize+i,j);
           
            %if value is out of bounds (-10, 10), we fix it
            if (value > 10)
                value = 10;
            elseif (value < -10)
                value = -10;
            end
            
            topublish(i,cnt+2) = value;
            cnt = cnt + 1;
        end
        j = j+1;
    end
end

headers = {'UserId','Rating1','Rating2','Rating3'};

csvwrite_with_headers('submission.csv', topublish, headers);

final = topublish;