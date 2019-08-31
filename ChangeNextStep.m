function hasil = ChangeNextStep(nextstep,startx,starty)
    %baris 1= atas , berarti row nya dikurang 1
    %baris 2= bawah , berarti row nya ditambah 1
    %baris 3= kanan , berarti kolom nya ditamabah 1
    %baris 4= kiri , berarti kolom nya dikurang 1

    if (nextstep==1)
        startx=startx-1;
    elseif (nextstep==2)
        startx=startx+1;
    elseif (nextstep==3)
        starty=starty+1;
    elseif (nextstep==4)
        starty=starty-1;
    end
    hasil=[startx starty];
    
        
        