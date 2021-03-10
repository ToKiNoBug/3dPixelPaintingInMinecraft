function [PicMap,unFits] = PicAdjMan(PicT,TList,MapList)
u=size(PicT);
L=u(1)*u(2);
PicMap=uint8(zeros(u(1),u(2)));
unFits=zeros(u(1),u(2));
% Pic1=reshape(PicT(:,:,1),[1,u]);
% Pic2=reshape(PicT(:,:,2),[1,u]);
% Pic3=reshape(PicT(:,:,3),[1,u]);

for r=1:u(1)
   for c=1:u(2)
       [PicMap(r,c),unFits(r,c)]=ColorAdjMan(PicT(r,c,:),TList,MapList);
   end
end
unFits=mean(mean(unFits));
end

