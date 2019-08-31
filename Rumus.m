function hasil = Rumus(tabelfix,episode,queue)
    a           = 1;
    gamma       = 1;
    NextColumn  = [];
    MaxNextQueue= [];
    posisinext   =[];
    r           = [];
    for(i=1:18);
        
        posisinext      = episode(i+1,1);
        NextColumn      = queue(1:4,posisinext);
        MaxNextQueue    = max(NextColumn);
        r               = tabelfix(posisinext,3);
        
        %RUMUS baris dulu baru kolom
        queue(episode(i,2),episode(i,1))=queue(episode(i,2),episode(i,1))+a*(r+gamma*MaxNextQueue-queue(episode(i,2),episode(i,1)));    
    end;
    hasil=queue;
         
        
        
        