function [Height,WaterList] = MakeHeight(Base,Depth)
WaterCount=sum(Base==12,'all');
% disp(WaterCount)
if ~WaterCount
    WaterList=0;
else
    WaterList=zeros(4,sum(WaterCount));
end
waterWrite=1;
rC=size(Base,1);cC=size(Base,2);
Depth(Depth==3)=0;
Height=zeros(rC+1,cC);
for c=1:cC
    r=rC;
    while(r>=1)
        if(Base(r,c)==12)%是水，则高度齐平
            Height(r,c)=Height(r+1,c)+1-1;%Base/Depth/WaterList(r,c)<==>Height(r+1,c)，这里调整的是北侧方块
            WaterList(1,waterWrite)=r;
            WaterList(2,waterWrite)=c;
            WaterList(3,waterWrite)=Height(r+1,c);
            switch Depth(r,c)
                case 2
                    WaterList(4,waterWrite)=WaterList(3,waterWrite)-0;
                case 1
                    WaterList(4,waterWrite)=WaterList(3,waterWrite)-4;
                case 0
                    WaterList(4,waterWrite)=WaterList(3,waterWrite)-6;
            end
            waterWrite=waterWrite+1;
        else
            Height(r,c)=Height(r+1,c)+1-Depth(r,c);
        end
        
        r=r-1;
    end
end
% offset=min(Height,[],1);
LowMap=Height;
if WaterCount
for waterWrite=1:WaterCount
   r=WaterList(1,waterWrite)+1;
   c=WaterList(2,waterWrite);
    LowMap(r+1,c)=min([LowMap(r+1,c),WaterList(4,waterWrite)-1]);
end
end
offset=min(LowMap,[],1);
Height=Height-offset;

if WaterCount
    for waterWrite=1:WaterCount
        c=WaterList(2,waterWrite);
        WaterList(3:4,waterWrite)=WaterList(3:4,waterWrite)-offset(c);
    end
else
    WaterList=0;
end
return;
% %%高度图中，最上面的一行是调节高度用的方块
% u=size(Base);
% v=size(Depth);
%
% % if u(1)~=v(1)||u(2)~=v(2)
% %     error("矩阵尺寸错误")
% % end
%     Height=zeros(129,128);
%     Depth=Depth-1;
%     w=sum(Base==12);
%     if w<=0
%         w=1;
%     end
%     WaterList=0;
%     w=1;
%
%     for j=1:128
%          %%error("C")
%         for t=1:128
%             i=129-t;
%             %%error("B")
%             if Depth(i,j)==2
%                 Depth(i,j)=-1;
%             end
%
%             Height(i,j)=Height(i+1,j)-Depth(i,j);
%
%
%                 %%error("A")
%                 if Base(i,j)==12
%                         Height(i,j)=Height(i+1,j);
%                         WaterList(1,w)=i;
%                         WaterList(2,w)=j;
%                         WaterList(3,w)=Height(i,j);
%                             switch Depth(i,j)
%                                 case {1}
%                                     WaterList(4,w)=WaterList(3,w)-0;
%                                 case {0}
%                                     WaterList(4,w)=WaterList(3,w)-4;
%                                 case {-1}
%                                     WaterList(4,w)=WaterList(3,w)-6;
%                                 otherwise
%                                     error("Depth中水深出错")
%                                     %%WaterList(4,w)=1024;
%                             end
%                         w=w+1;
%                 end
%         end
%     end
% %WaterList的中第一行是i，第二行是j，第三行是水柱顶高度，第四行是水柱低高度
%
%
% for j=1:1:128
%     u=size(WaterList);
%     if u~=[1,1]
%         v=sum(abs(WaterList(2,:)-j)<=1);
%         if v<=0
%             v=1;
%         end
%         TempList=zeros(4,v);
%         v=1;
%         for w=1:1:u(2)
%             if abs(WaterList(2,w)-j)<=1
%                 TempList(:,v)=WaterList(:,w);
%                 v=v+1;
%             end
%         end
%
%    %%Height(:,j)=HeightOpti(Height(:,j));
%
%    u=min(Height(:,j));
%    v=min(TempList(4,:));
%    %%v=u;
%    v=min(u,v);
%    Height(:,j)=Height(:,j)-v;
%
%
%
%
%    %%对WaterList进行高度修正
%    u=size(WaterList);
%    u=u(2);
%
%    for w=1:1:u
%        if(WaterList(2,w)==j)
%            WaterList(3:4,w)=WaterList(3:4,w)-v;
%        end
%    end
%     else
%         Height(:,j)=Height(:,j)-min(Height(:,j));
%    %%re=[0,0];
%    t=1;
%    %%for i=1:1:128
%       %MinH=min(Height(:,j));
%       %MaxH=max(Height(:,j));
%       %%高度优化
%
%    %%end
% end
end
