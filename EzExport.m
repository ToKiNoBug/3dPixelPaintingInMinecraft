function [Count] = EzExport(Base,Depth,FileName,Mode,Pos,CBL)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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
%%����HeightOpti�����Ը߶Ƚ����Ż�
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

