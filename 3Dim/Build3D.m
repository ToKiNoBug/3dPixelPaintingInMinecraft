function [Build,BlockCount,Size] = Build3D(Base,Height,WaterList,NeedGlass)

if WaterList==0||size(WaterList,1)~=4
    WaterCount=0;
else
    WaterCount=size(WaterList,2);
end
HighMap=Height;
LowMap=Height;
if WaterCount
    for waterWrite=1:WaterCount
        r=WaterList(1,waterWrite)+1;
        c=WaterList(2,waterWrite);
        HighMap(r+1,c)=min([HighLowMap(r+1,c),WaterList(3,waterWrite)+1]);
        LowMap(r+1,c)=min([LowMap(r+1,c),WaterList(4,waterWrite)-1]);
    end
end

TotalHeight=max(HighMap-LowMap,[],'all')+1;



rCount=size(Base,1);
cCount=size(Base,2);

Build=uint8(zeros(cCount+2,TotalHeight,rCount+2));%xyz
Size=size(Build);

Offset=[2,1,2];

Base=Base+1;


if WaterCount
    %         u=u(2);
    for waterWrite=1:WaterCount
        r=WaterList(1,waterWrite);
        c=WaterList(2,waterWrite);
        Pos=Offset+[c-1,0,r-1];
        %%����ˮ�����ײ�����͸��Ӳ�����
        Pos(2)=Offset(2)+WaterList(4,waterWrite)-1;
        
        Build(Pos(1),Pos(2),Pos(3))=1;
        Pos(2)=Offset(2)+WaterList(3,waterWrite)+1;
        Build(Pos(1),Pos(2),Pos(3))=1;
        
        %%����ˮ�����൲�岣����
        Pos=Offset+[WaterList(2,waterWrite)-1,WaterList(4,waterWrite),WaterList(1,waterWrite)-1];
        Pos=Pos+[0,0,-1];
        
        %%�������������������
        Pos_=Pos;
        Pos_(2)=Offset(2)+WaterList(3,waterWrite);
        
        Build(Pos(1),Pos(2):Pos_(2),Pos(3))=1;
        
        
        %%����ˮ���ϲ൲�岣����
        Pos=Offset+[WaterList(2,waterWrite)-1,WaterList(4,waterWrite),WaterList(1,waterWrite)-1];
        Pos=Pos+[0,0,+1];
        Pos_=Pos;
        Pos_(2)=Offset(2)+WaterList(3,waterWrite);
        Build(Pos(1),Pos(2):Pos_(2),Pos(3))=1;
        
        %%����ˮ�����൲�岣����
        Pos=Offset+[WaterList(2,waterWrite)-1,WaterList(4,waterWrite),WaterList(1,waterWrite)-1];
        Pos=Pos+[-1,0,0];
        Pos_=Pos;
        Pos_(2)=Offset(2)+WaterList(3,waterWrite);
        Build(Pos(1),Pos(2):Pos_(2),Pos(3))=1;
        
        %%����ˮ�����൲�岣����
        Pos=Offset+[WaterList(2,waterWrite)-1,WaterList(4,waterWrite),WaterList(1,waterWrite)-1];
        Pos=Pos+[1,0,0];
        Pos_=Pos;
        Pos_(2)=Offset(2)+WaterList(3,waterWrite);
        Build(Pos(1),Pos(2):Pos_(2),Pos(3))=1;
        
    end
end

%%��ʼ���ɵ�ͼ�ڵķ���
for c=1:cCount
    for r=1:rCount
        Pos=Offset+[c-1,Height(r+1,c),r-1];
        if Base(r,c)~=13
            if NeedGlass(Base(r,c))&&round(Pos(2)-1)>=1
                Build(Pos(1),round(Pos(2)-1),Pos(3))=1;
            end
            
            Build(Pos(1),Pos(2),Pos(3))=Base(r,c);
            
        end
    end
end
%%����ˮ������

if WaterCount
    for waterWrite=1:WaterCount
        %%����ˮ��
        Pos=Offset+[WaterList(2,waterWrite)-1,WaterList(4,waterWrite),WaterList(1,waterWrite)-1];
        Pos_=Pos;
        Pos_(2)=Offset(2)+WaterList(3,waterWrite);
        Build(Pos(1),Pos(2):Pos_(2),Pos(3))=13;
        
        
        
    end
end
%%���ɱ���߽緽��
r=1;
for c=1:cCount
    Pos=Offset+[c-1,Height(r,c),r-2];
    Build(Pos(1),Pos(2),Pos(3))=12;
    
end
BlockCount=sum(logical(Build),'all');
end