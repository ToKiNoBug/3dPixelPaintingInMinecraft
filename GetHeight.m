function [Height,WaterList] = GetHeight(Base,Depth)
%%�߶�ͼ�У��������һ���ǵ��ڸ߶��õķ���
u=size(Base);
v=size(Depth);

if u(1)~=v(1)||u(2)~=v(2)
    error("����ߴ����")
end
    Height=zeros(129,128);
    Depth=Depth-1;
    w=sum(Base==12);
    if w<=0 
        w=1;
    end
    WaterList=0;
    w=1;
    
    for j=1:128
         %%error("C")
        for t=1:128
            i=129-t;
            %%error("B")
            if Depth(i,j)==2
                Depth(i,j)=-1;
            end
            
            Height(i,j)=Height(i+1,j)-Depth(i,j);
            
            
                %%error("A")
                if Base(i,j)==12
                        Height(i,j)=Height(i+1,j);
                        WaterList(1,w)=i;
                        WaterList(2,w)=j;
                        WaterList(3,w)=Height(i,j);
                            switch Depth(i,j)
                                case {1}
                                    WaterList(4,w)=WaterList(3,w)-0;
                                case {0}
                                    WaterList(4,w)=WaterList(3,w)-4;
                                case {-1}
                                    WaterList(4,w)=WaterList(3,w)-6;
                                otherwise 
                                    error("Depth��ˮ�����")
                                    %%WaterList(4,w)=1024;
                            end
                        w=w+1; 
                end        
        end
    end
%WaterList���е�һ����i���ڶ�����j����������ˮ�����߶ȣ���������ˮ���͸߶�

   
for j=1:1:128
    u=size(WaterList);
    if u~=[1,1]
        v=sum(abs(WaterList(2,:)-j)<=1);
        if v<=0
            v=1;
        end
        TempList=zeros(4,v);
        v=1;
        for w=1:1:u(2)
            if abs(WaterList(2,w)-j)<=1
                TempList(:,v)=WaterList(:,w);
                v=v+1;
            end
        end
        
   %%Height(:,j)=HeightOpti(Height(:,j));
        
   u=min(Height(:,j));
   v=min(TempList(4,:));
   %%v=u;
   v=min(u,v);
   Height(:,j)=Height(:,j)-v;
   
   
   
   
   %%��WaterList���и߶�����
   u=size(WaterList);
   u=u(2);
   
   for w=1:1:u
       if(WaterList(2,w)==j)
           WaterList(3:4,w)=WaterList(3:4,w)-v;
       end
   end
    else
        Height(:,j)=Height(:,j)-min(Height(:,j));
   %%re=[0,0];
   t=1;
   %%for i=1:1:128
      %MinH=min(Height(:,j));
      %MaxH=max(Height(:,j));
      %%�߶��Ż�
      
   %%end
end
end
