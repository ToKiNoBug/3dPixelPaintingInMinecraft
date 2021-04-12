function [Count] = MapExport(Base,Height,WaterList,NWPos,FileName,Mode,CustomBlockList)
Count=0;
%%Presser=[0,0,0,0];
%%0����ʹ��ѹ���壬1����ʹ��ѹ���塣�ĸ�λ�����ζ�Ӧľ�ʡ�ʯ�ʡ����ʺͽ���ѹ���塣
BlockList=["glass","grass_block","sandstone","mushroom_stem","redstone_block","ice","iron_block","birch_leaves","snow_block","clay","dirt","cobblestone","water","oak_planks","polished_diorite","orange_concrete","magenta_concrete","light_blue_concrete","yellow_concrete","lime_concrete","pink_concrete","gray_concrete","light_gray_concrete","cyan_concrete","purple_concrete","blue_concrete","brown_concrete","green_concrete","red_concrete","black_concrete","gold_block","diamond_block","lapis_block","emerald_block","spruce_planks","magma_block","white_terracotta","orange_terracotta","magenta_terracotta","light_blue_terracotta","yellow_terracotta","lime_terracotta","pink_terracotta","gray_terracotta","light_gray_terracotta","cyan_terracotta","purple_terracotta","blue_terracotta","brown_terracotta","green_terracotta","red_terracotta","black_terracotta"];

if Mode=="Custom"
    BlockList=CustomBlockList;
end

if Mode=="Survival_Cheaper"
    CustomBlockList=[6,"heavy_weighted_pressure_plate";8,"snow_block";30,"light_weighted_pressure_plate";31,"prismarine_bricks";35,"netherrack";];
   Mode="Replace";
end

if Mode=="Survival_Better"
    CustomBlockList=[10,"jungle_planks";11,"stone";31,"prismarine_bricks";35,"netherrack";];
    Mode="Replace";
end

if Mode=="InstBreak"
    CustomBlockList=[2,"smooth_sandstone";4,"tnt";6,"brewing_stand";8,"snow_block";10,"brown_mushroom_block";11,"smooth_stone";13,"note_block";15,"smooth_red_sandstone";16,"magenta_stained_glass";17,"light_blue_stained_glass";18,"yellow_stained_glass";19,"lime_stained_glass";20,"pink_stained_glass";21,"gray_stained_glass";22,"light_gray_stained_glass";23,"prismarine";24,"purple_stained_glass";25,"blue_stained_glass";26,"brown_stained_glass";27,"green_stained_glass";28,"red_stained_glass";29,"black_stained_glass";30,"light_weighted_pressure_plate";31,"prismarine_bricks";34,"podzol";35,"netherrack";];
    Mode="Replace";
end

if Mode=="Replace"
    Mode=size(CustomBlockList);
    Mode=Mode(1);
    for i=1:1:Mode(1)
       BlockList(str2double(CustomBlockList(i))+1)=CustomBlockList(i,2);
    end
end
%%���������Ҫ��ѹ�������⴦��Ļ�ɫ����
%%PBL:ѹ�����ɫ�б�Pressure base list
PBL=zeros(1,52);
for i=1:1:52
    switch BlockList(i)
        case "light_weighted_pressure_plate"
            PBL(i)=i;
        case "heavy_weighted_pressure_plate"
            PBL(i)=i;
        case "stone_pressure_plate"
            PBL(i)=i;
        case "oak_pressure_plate"
            PBL(i)=i;
        case "spruce_pressure_plate"
            PBL(i)=i;
        case "birch_pressure_plate"
            PBL(i)=i;
        case "jungle_pressure_plate"
            PBL(i)=i;
        case  "acacia_pressure_plate"
            PBL(i)=i;
        case "dark_oak_pressure_plate"
            PBL(i)=i;
        otherwise
            PBL(i)=-10;
    end
end
PBL=PBL(PBL~=-10);





fid=fopen(FileName,"w");
fprintf(fid,"%s\n","#�˺�����TokiNoBug�Ľ��ݵ�ͼ������������");
%������ˮ�ķ�װ
%%fprintf(fid,"")

Base=Base+1;

u=size(WaterList);
if u~=[1,1]
u=u(2);
for w=1:u
    i=WaterList(1,w);
    j=WaterList(2,w);
    Pos=NWPos+[j-1,0,i-1];
    %%����ˮ�����ײ�����͸��Ӳ�����
    Pos(2)=NWPos(2)+WaterList(4,w)-1;
    fprintf(fid,"%s","setblock ");
    fprintf(fid,"%d",Pos(1));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(2));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(3));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%s\n",BlockList(1));
    Count=Count+1;
    
    Pos(2)=NWPos(2)+WaterList(3,w)+1;
    fprintf(fid,"%s","setblock ");
    fprintf(fid,"%d",Pos(1));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(2));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(3));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%s\n",BlockList(1));
    Count=Count+1;
    %%����ˮ�����൲�岣����
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        Pos=Pos+[0,0,-1];
        fprintf(fid,"%s","fill ");
        %%�������ײ����������
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%�������������������
        Pos(2)=NWPos(2)+WaterList(3,w);
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%s\n",BlockList(1));
        Count=Count+1;
   %%����ˮ���ϲ൲�岣����
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        Pos=Pos+[0,0,+1];
        fprintf(fid,"%s","fill ");
        %%�������ײ����������
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%�������������������
        Pos(2)=NWPos(2)+WaterList(3,w);
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%s\n",BlockList(1));
        Count=Count+1;
    %%����ˮ�����൲�岣����
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        Pos=Pos+[-1,0,0];
        fprintf(fid,"%s","fill ");
        %%�������ײ����������
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%�������������������
        Pos(2)=NWPos(2)+WaterList(3,w);
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%s\n",BlockList(1));
        Count=Count+1;
   %%����ˮ�����൲�岣����
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        Pos=Pos+[1,0,0];
        fprintf(fid,"%s","fill ");
        %%�������ײ����������
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%�������������������
        Pos(2)=NWPos(2)+WaterList(3,w);
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%s\n",BlockList(1));
        Count=Count+1;
end
end

%%��ʼ���ɵ�ͼ�ڵķ���
for j=1:1:128
   for i=1:1:128
       t=i+1;
       Pos=NWPos+[j-1,Height(t,j),i-1];
       u=size(PBL(PBL==Base(i,j)));
       if(u(2)~=0)
           fprintf(fid,"%s","setblock ");
           fprintf(fid,"%d",Pos(1));
           fprintf(fid,"%s"," ");
           fprintf(fid,"%d",(Pos(2)-1));
           fprintf(fid,"%s"," ");
           fprintf(fid,"%d",Pos(3));
           fprintf(fid,"%s"," ");
           fprintf(fid,"%s\n",BlockList(1));
           Count=Count+1;
       end 
       
       if Base(i,j)~=13
           fprintf(fid,"%s","setblock ");
           fprintf(fid,"%d",Pos(1));
           fprintf(fid,"%s"," ");
           fprintf(fid,"%d",Pos(2));
           fprintf(fid,"%s"," ");
           fprintf(fid,"%d",Pos(3));
           fprintf(fid,"%s"," ");
           fprintf(fid,"%s\n",BlockList(Base(i,j)));
           Count=Count+1;
       end
   end
end
%%����ˮ������
u=size(WaterList);
if u~=[1,1]
u=u(2);
for w=1:1:u
    %%����ˮ��
    Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
    fprintf(fid,"%s","fill ");
    %%����ˮ���ײ����������
    fprintf(fid,"%d",Pos(1));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(2));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(3));
    fprintf(fid,"%s"," ");
    %%����ˮ���������������
    Pos(2)=NWPos(2)+WaterList(3,w);
    fprintf(fid,"%d",Pos(1));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(2));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(3));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%s\n","air");
    Count=Count+1;
    
    Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
    Pos(2)=NWPos(2)+WaterList(3,w);
    fprintf(fid,"%s","setblock ");
    fprintf(fid,"%d",Pos(1));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(2));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(3));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%s\n",BlockList(13));
    Count=Count+1;
    
    
end
end
%%���ɱ���߽緽��
i=1;
for j=1:1:128
       Pos=NWPos+[j-1,Height(i,j),i-2];
       fprintf(fid,"%s","setblock ");
       fprintf(fid,"%d",Pos(1));
       fprintf(fid,"%s"," ");
       fprintf(fid,"%d",Pos(2));
       fprintf(fid,"%s"," ");
       fprintf(fid,"%d",Pos(3));
       fprintf(fid,"%s"," ");
       fprintf(fid,"%s\n",BlockList(12));
       Count=Count+1;
end

fclose(fid);
end