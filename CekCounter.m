function fixcounter = CekCounter(startx,starty)
    fixcounter=[];
        counter=1;
        for(i=1:10);
            for(j=1:10);
                if(i==startx && j==starty)
                   fixcounter=counter;
                else
                    counter=counter+1;
                end
            end
        end       
end