function episode = Cobarandom(tabelfix)

%PENGISIAN TABEL
    tabelaturan =[];

    for (i=1:100)
        tabelaturan(i,1:3)= tabelfix(i,1:3); %x , y , dan counter
    end;

    tabelaturan(1,4:7)=[0 1 1 0];
    tabelaturan(10,4:7)=[0 1 0 1];
    tabelaturan(91,4:7)=[1 0 1 0];
    tabelaturan(100,4:7)=[1 0 0 1];

    for (i=2:9)
        tabelaturan(i,4:7)=[0 1 1 1];
    end
    for (i=11:10:81)
        tabelaturan(i,4:7)=[1 1 1 0];
    end
    for (i=92:99)
        tabelaturan(i,4:7)=[1 0 1 1];
    end
    for (i=20:10:90)
        tabelaturan(i,4:7)=[1 1 0 1];
    end
  
    
%MEMBUAT EPISODE RANDOM
    
    tmpx = 1 ; tmpy=1;
    xy=[tmpx tmpy];
    counter=CekCounter(tmpx,tmpy);
    directionbefore=0;
    hasil=Cek(tabelaturan,counter,xy,directionbefore); %hasil berupa aray , x , dan y
    
    startx=hasil(1,1);
    starty=hasil(1,2);
    arah=hasil(1,3);
    %hasilepisode
    episode(1,1)=counter
    episode(1,2)=arah
        
    %=====================clear================
     
    for (i=2:18) 
        xy=[startx starty];
        directionbefore=CekCounter(tmpx,tmpy);
        counter=CekCounter(startx,starty);
        hasil=Cek(tabelaturan,counter,xy,directionbefore); %hasil berupa aray , x , dan y
        
        tmpx=startx;
        tmpy=starty;
        startx=hasil(1,1);
        starty=hasil(1,2);
        arah=hasil(1,3);
        %hasilepisode
        episode(i,1)=counter
        episode(i,2)=arah
    end   
     
end

