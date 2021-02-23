function [Pic] = ShowPicMap(PicMap,FullRGB)
u=size(PicMap);
PicMap=double(PicMap);
Index=mod(PicMap,4)*58+floor(PicMap/4);
Pic=zeros(u(1),u(2),3);
for r=1:u(1)
    for c=1:u(2)
       Pic(r,c,:)=reshape(FullRGB(Index(r,c),:),[1,1,3]); 
    end
end
% image(Pic);
end

