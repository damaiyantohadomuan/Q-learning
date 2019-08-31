%====================================================
%CREATED BY: DAMAIYANTO HADOMUAN /1301150061
%26/4/2018
%====================================================

%TABEL AGENT
tdfread('DataTugasML3.txt');
tabeltmp=[kolom1 kolom2 kolom3 kolom4 kolom5 kolom6 kolom7 kolom8 kolom9 kolom10];
tabel(1,1:10) = tabeltmp(10,1:10) ;
tabel(2,1:10) = tabeltmp(9,1:10);
tabel(3,1:10) = tabeltmp(8,1:10);
tabel(4,1:10) = tabeltmp(7,1:10);
tabel(6,1:10) = tabeltmp(6,1:10);
tabel(7,1:10) = tabeltmp(4,1:10);
tabel(8,1:10) = tabeltmp(3,1:10);
tabel(9,1:10)  = tabeltmp(2,1:10);
tabel(10,1:10) = tabeltmp(1,1:10);


baris=10;
kolom=10;


counter=1;
for (i=1:baris);
    for(j=1:kolom);
        tabelfix(counter,1)=i; %posisi x
        tabelfix(counter,2)=j; %posisi y
        tabelfix(counter,3)=counter; %Urutan posisi
        tabelfix(counter,4)=tabel(i,j); %Reward posisi dan kolom 5 untuk hasil arah
    counter=counter+1;
    end;
end;

%TABELQUEUE
queue(1:4,1:100) = 0;

%ATURAN
%baris 1= atas  , berarti row nya dikurang 1
%baris 2= bawah , berarti row nya ditambah 1
%baris 3= kanan , berarti kolom nya ditamabah 1
%baris 4= kiri  , berarti kolom nya dikurang 1


%PENENTUAN EPISODE //nomor posisi//Arah

%episode1 = Cobarandom(tabelfix);
episode1 = [ 1 2 ; 11 3 ; 12 3; 13 3;14 3; 15 2; 25 2; 35 2; 45 2 ;55 3; 56 3; 57 3; 58 2; 68 3; 69 2; 79 2;89 2 ; 99 3; 100 2 ]; 
queue=Rumus(tabelfix,episode1,queue);
episode2 = [ 1 2 ; 11 3 ; 12 2; 22 3;23 2; 33 3; 34 2; 44 3; 45 2 ;55 3; 56 2; 66 3; 67 2; 77 3 ;78 3; 79 2;89 2 ; 99 3 ;100 2 ];  %posisi %arah
queue=Rumus(tabelfix,episode2,queue);
episode3 = [ 1 3 ; 2 3 ; 3 3; 4 3;5 3; 6 3; 7 3; 8 3; 9 3 ;10 1; 20 1; 30 1; 40 1; 50 1 ;60 1; 70 1;80 1 ; 90 1 ;100 2 ];  %posisi %arah
queue=Rumus(tabelfix,episode3,queue);



%CEKMAKSIMALTABELQUEUE
nilai=0;
counter= 1;
max=0;
for (i=1:100);
    for(j=1:4);
      if(queue(j,i)>=max)
          nilai=j;
          max =queue(j,i);
      end;
    end;
    tabelfix(counter,5)=nilai; %Untuk inisiasi arah pada setiap kolom
    nilai=0;
    max  =0;
    counter=counter+1;
end;
 
finishx = 10; finishy = 10; %garisfinish
startx  = 1; starty  = 1; %garisstart
reward  = 0;              %reward
nextstep = [];            %penampung langkah selanjutnya
%langkah = [startx starty];%Data langkah dari awal sampai akhir
hasil=[];                 %Menampung nilai x,y pada nextstep
counterlangkah=1;         %Urutan langkah
fixounter=0;
while ((startx ~= finishx) || (starty ~=finishy))
        
        fixcounter=CekCounter(startx,starty);           %cekposisi
        reward   = reward+tabelfix(fixcounter,4);
        nextstep = tabelfix(fixcounter,5);
        hasil=ChangeNextStep(nextstep,startx,starty);
        startx=hasil(1,1);
        starty=hasil(1,2);
        langkah(counterlangkah,1)=hasil(1,1);
        langkah(counterlangkah,2)=hasil(1,2);
        counterlangkah=counterlangkah+1;
        
end

fixcounter=CekCounter(startx,starty);
reward   = reward+tabelfix(fixcounter,4); %reward ditambahkan setelah counter dicari

%Optimal Policy
%ATURAN
%baris 1= atas  
%baris 2= bawah 
%baris 3= kanan 
%baris 4= kiri  

optimalpolicy(1,1:10)= tabelfix(1:10,5);
optimalpolicy(2,1:10)= tabelfix(11:20,5);
optimalpolicy(3,1:10)= tabelfix(21:30,5);
optimalpolicy(4,1:10)= tabelfix(31:40,5);
optimalpolicy(5,1:10)= tabelfix(41:50,5);
optimalpolicy(6,1:10)= tabelfix(51:60,5);
optimalpolicy(7,1:10)= tabelfix(61:70,5);
optimalpolicy(8,1:10)= tabelfix(71:80,5);
optimalpolicy(9,1:10)= tabelfix(81:90,5);
optimalpolicy(10,1:10)=tabelfix(91:100,5);

disp('Optimal Policy');
disp(optimalpolicy);




%LANGKAH 
disp('LANGKAH AGENT ');
for (i=1:counterlangkah-1)
    fprintf('Langkah %f : x = %f , y=%f \n',i,langkah(i,1),langkah(i,2) );
end
fprintf('Total reward : %f',reward);

%=================================finish==================================
        
                

       






