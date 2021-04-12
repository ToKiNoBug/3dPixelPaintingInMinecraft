% for r=1:256
% for g=1:256
% for b=1:256
% RawColor=[r,g,b]-1;
% for i=1:232
% Dis(i)=sum((RawColor-ColorS(i,:)).^2);
% end
% u=BaseS(Dis==min(Dis)');
% AdjedMapColorS(r,g,b)=u(1);
% end
% end
% disp(r)
% end
% Adjuster=uint8(zeros(256,256,256));
Dis=int32(zeros(232,1));
for i=9446296:16777216
    r=Indexer(i).Color(1);
    g=Indexer(i).Color(2);
    b=Indexer(i).Color(3);
    CurrentColor=[r,g,b];
    Dis=sum((ColorC-CurrentColor).*(ColorC-CurrentColor),2)';
    [v,u]=min(Dis);
    CurrentMapColor=BaseC(u);
    Adjuster(r+1,g+1,b+1)=CurrentMapColor(1);
    if(mod(i,131072)==0)
        disp(i/131072);
    end
end