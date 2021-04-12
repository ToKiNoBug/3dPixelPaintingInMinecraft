function [PicMap] = PicAdjEuc(PicT,TList,MapList)
u=size(PicT);
% L=u(1)*u(2);
PicMap=zeros(u(1),u(2));
% unFits=zeros(u(1),u(2));
% Pic1=reshape(PicT(:,:,1),[1,u]);
% Pic2=reshape(PicT(:,:,2),[1,u]);
% Pic3=reshape(PicT(:,:,3),[1,u]);
% disp(size(TList))
% disp(size(MapList))
for r=1:u(1)
   for c=1:u(2)
       PicMap(r,c)=ColorAdjEuc(PicT(r,c,:),TList,MapList);
   end
end
% unFits=mean(mean(unFits));
PicMap=round(PicMap);
end

