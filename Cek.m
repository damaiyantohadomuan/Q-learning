function resultt = Cek(tabelaturan,counternow,xy,directionbefore)
    
    starttx=xy(1,1);
    startty=xy(1,2);
    hasill=0;
        %aturan agar tidak melangkah ke tempat yang sebelumnya 
    mirrortabel=tabelaturan;
    if (directionbefore==1)
        mirrortabel(counternow,5)=0;
    elseif (directionbefore==2)
        mirrortabel(counternow,4)=0;
    elseif (directionbefore==3)
        mirrortabel(counternow,7)=0;
    elseif (directionbefore==4)
        mirrortabel(counternow,6)=0;
    end
    %===========================================================   
    
    count=0;
    for(i=4:7)
        if(mirrortabel(counternow,i)==1)
            hasil(1,count+1)=i;
            count=count+1;
        end
    end
    x=randi([1,count]); 


    
    %Mengupdate nilai x dan y
    if(hasil(1,x)==4)
        starttx=starttx-1;
        arah=1;
    elseif(hasil(1,x)==5)
        starttx=starttx+1;
        arah=2;
    elseif(hasil(1,x)==6)
        startty=startty+1;
        arah=3;
    elseif(hasil(1,x)==7)
        startty=startty-1;
        arah=4;
    end
    %================================================
    
    resultt=[starttx startty arah];
    
end

    