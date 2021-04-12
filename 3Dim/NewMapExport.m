function [CommandCount] = NewMapExport(Base,Height,WaterList,NWPos,FileName,Mode,CustomBlockList)
CommandCount=0;
rCount=size(Base,1);
cCount=size(Base,2);
FileName=char(FileName);
PathWithoutSuffix=FileName(1:(strlength(FileName)-11));

NextFileId=1;

%%Presser=[0,0,0,0];
%%0����ʹ��ѹ���壬1����ʹ��ѹ���塣�ĸ�λ�����ζ�Ӧľ�ʡ�ʯ�ʡ����ʺͽ���ѹ���塣
BlockList=["glass","grass_block","sandstone","mushroom_stem","redstone_block","ice","iron_block","birch_leaves","snow_block","clay","dirt","cobblestone","water","oak_planks","polished_diorite","orange_concrete","magenta_concrete","light_blue_concrete","yellow_concrete","lime_concrete","pink_concrete","gray_concrete","light_gray_concrete","cyan_concrete","purple_concrete","blue_concrete","brown_concrete","green_concrete","red_concrete","black_concrete","gold_block","diamond_block","lapis_block","emerald_block","spruce_planks","magma_block","white_terracotta","orange_terracotta","magenta_terracotta","light_blue_terracotta","yellow_terracotta","lime_terracotta","pink_terracotta","gray_terracotta","light_gray_terracotta","cyan_terracotta","purple_terracotta","blue_terracotta","brown_terracotta","green_terracotta","red_terracotta","black_terracotta","crimson_nylium","crimson_planks","stripped_crimson_hyphae","warped_nylium","warped_planks","stripped_warped_hyphae","warped_wart_block"];

% if strcmp(Mode,"Custom")
%     BlockList=CustomBlockList.BlockList;
% end

if strcmp(Mode,"Survival_Cheaper")
    CustomBlockList.BlockList=["heavy_weighted_pressure_plate","snow_block","light_weighted_pressure_plate","prismarine_bricks"];
    CustomBlockList.BaseList=[6,8,30,31];
    Mode="Replace";
end

if strcmp(Mode,"InstBreak")
    CustomBlockList.BlockList=["smooth_sandstone","tnt","brewing_stand","snow_block","brown_mushroom_block","smooth_stone","note_block","smooth_red_sandstone","magenta_stained_glass","light_blue_stained_glass","yellow_stained_glass","lime_stained_glass","pink_stained_glass","gray_stained_glass","light_gray_stained_glass","prismarine","purple_stained_glass","blue_stained_glass","brown_stained_glass","green_stained_glass","red_stained_glass","black_stained_glass","light_weighted_pressure_plate","prismarine_bricks","podzol"];
    CustomBlockList.BaseList=[2,4,6,8,10,11,13,15:31,34];
    Mode="Replace";
end

if strcmp(Mode,"Survival_Better")
    CustomBlockList.BlockList=["jungle_planks","stone","prismarine_bricks"];
    CustomBlockList.BaseList=[10,11,31];
    Mode="Replace";
end



if strcmp(Mode,"Replace")
    BlockList(CustomBlockList.BaseList+1)=CustomBlockList.BlockList;
    
end
%%���������Ҫ��ѹ�������⴦��Ļ�ɫ����
%%PBL:ѹ�����ɫ�б�Pressure base list
% PBL=zeros(1,58);

fid=fopen(FileName,'w');
fprintf(fid,"%s\n","#�˺�����TokiNoBug�Ľ��ݵ�ͼ������������");
%������ˮ�ķ�װ
%%fprintf(fid,"")

Base=Base+1;

u=size(WaterList);
if u(1)~=1||u(2)~=1
    u=u(2);
    for w=1:u
        r=WaterList(1,w);
        c=WaterList(2,w);
        Pos=NWPos+[c-1,0,r-1];
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
        CommandCount=CommandCount+1;
        if mod(CommandCount,65536)==0&&CommandCount
            fclose(fid);
            FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
            NextFileId=NextFileId+1;
            fid=fopen(FileName,"w");
        end
        
        
        Pos(2)=NWPos(2)+WaterList(3,w)+1;
        fprintf(fid,"%s","setblock ");
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%s\n",BlockList(1));
        CommandCount=CommandCount+1;
        if mod(CommandCount,65536)==0&&CommandCount
            fclose(fid);
            FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
            NextFileId=NextFileId+1;
            fid=fopen(FileName,"w");
        end
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
        CommandCount=CommandCount+1;
        if mod(CommandCount,65536)==0&&CommandCount
            fclose(fid);
            FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
            NextFileId=NextFileId+1;
            fid=fopen(FileName,"w");
        end
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
        CommandCount=CommandCount+1;
        if mod(CommandCount,65536)==0&&CommandCount
            fclose(fid);
            FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
            NextFileId=NextFileId+1;
            fid=fopen(FileName,"w");
        end
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
        CommandCount=CommandCount+1;
        if mod(CommandCount,65536)==0&&CommandCount
            fclose(fid);
            FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
            NextFileId=NextFileId+1;
            fid=fopen(FileName,"w");
        end
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
        CommandCount=CommandCount+1;
        if mod(CommandCount,65536)==0&&CommandCount
            fclose(fid);
            FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
            NextFileId=NextFileId+1;
            fid=fopen(FileName,"w");
        end
    end
end

%%��ʼ���ɵ�ͼ�ڵķ���
for c=1:cCount
    for r=1:rCount
        %        t=r+1;
        Pos=NWPos+[c-1,Height(r+1,c),r-1];
        %        u=size(PBL(PBL==Base(r,c)));
        %        if(u(2)~=0)
        %            fprintf(fid,"%s","setblock ");
        %            fprintf(fid,"%d",Pos(1));
        %            fprintf(fid,"%s"," ");
        %            fprintf(fid,"%d",(Pos(2)-1));
        %            fprintf(fid,"%s"," ");
        %            fprintf(fid,"%d",Pos(3));
        %            fprintf(fid,"%s"," ");
        %            fprintf(fid,"%s\n",BlockList(1));
        %            Count=Count+1;
        %        end
        
        if Base(r,c)~=13
            Command=strcat("setblock ",num2str(Pos(1))," ",num2str(Pos(2))," ",num2str(Pos(3))," ",BlockList(Base(r,c)));
            %            fprintf(fid,"%s","setblock ");
            %            fprintf(fid,"%d",Pos(1));
            %            fprintf(fid,"%s"," ");
            %            fprintf(fid,"%d",Pos(2));
            %            fprintf(fid,"%s"," ");
            %            fprintf(fid,"%d",Pos(3));
            %            fprintf(fid,"%s"," ");
            fprintf(fid,"%s\n",Command);
            CommandCount=CommandCount+1;
            if mod(CommandCount,65536)==0&&CommandCount
                fclose(fid);
                FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
                NextFileId=NextFileId+1;
                fid=fopen(FileName,"w");
            end
        end
    end
end
%%����ˮ������
u=size(WaterList);
if u(1)~=1||u(2)~=1
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
        CommandCount=CommandCount+1;
        if mod(CommandCount,65536)==0&&CommandCount
            fclose(fid);
            FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
            NextFileId=NextFileId+1;
            fid=fopen(FileName,"w");
        end
        
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
        CommandCount=CommandCount+1;
        if mod(CommandCount,65536)==0&&CommandCount
            fclose(fid);
            FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
            NextFileId=NextFileId+1;
            fid=fopen(FileName,"w");
        end
        
        
    end
end
%%���ɱ���߽緽��
r=1;
for c=1:cCount
    Pos=NWPos+[c-1,Height(r,c),r-2];
    fprintf(fid,"%s","setblock ");
    fprintf(fid,"%d",Pos(1));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(2));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%d",Pos(3));
    fprintf(fid,"%s"," ");
    fprintf(fid,"%s\n",BlockList(12));
    CommandCount=CommandCount+1;
    if mod(CommandCount,65536)==0&&CommandCount
        fclose(fid);
        FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
        NextFileId=NextFileId+1;
        fid=fopen(FileName,"w");
    end
end

fclose(fid);
end