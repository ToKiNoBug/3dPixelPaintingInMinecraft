function [Count] = EzExport(Base,Depth,FileName,Mode,Pos,CBL)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% Base=Raw_to_BCD(Raw,"Base");
% Depth=Raw_to_BCD(Raw,"Depth");
% 
% % Base(Base==12)=25;
% Base(Base==32)=25;

[Height,WaterList]=GetHeight(Base,Depth);
u=size(Pos);
if u(1)~=1||u(2)~=3
    Pos=[-64,5,-64];
end
% Height=Height*0;
% WaterList(4,:)=WaterList(4,:)-WaterList(3,:);
% WaterList(3,:)=WaterList(3,:)*0+Pos(2);
% WaterList(4,:)=WaterList(4,:)+Pos(2);
%%调用HeightOpti函数对高度进行优化
%    for j=1:1:128
%        Height(:,j)=HeightClipNaturalOpti(Height(:,j));
%        u=min(Height(:,j));
%        Height(:,j)=Height(:,j)-u;
%    end
   
%    for i=1:3
%        [Height,WaterList]=HeightOptiSummary(Height,WaterList);
%    end
%  disp(WaterList)
Count=MapExport(Base,Height,WaterList,Pos,FileName,Mode,CBL);
end

