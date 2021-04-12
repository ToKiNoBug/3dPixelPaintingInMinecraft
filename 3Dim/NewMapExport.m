function [CommandCount] = NewMapExport(Base,Height,WaterList,NWPos,FileName,BlockList,NeedGlass)
CommandCount=0;
rCount=size(Base,1);
cCount=size(Base,2);
FileName=char(FileName);
PathWithoutSuffix=FileName(1:(strlength(FileName)-11));

NextFileId=1;

%%先整理出需要做压力板特殊处理的基色种类
%%PBL:压力板基色列表Pressure base list
% PBL=zeros(1,58);

fid=fopen(FileName,'w');
fprintf(fid,"%s\n","#此函数由TokiNoBug的阶梯地图画生成器生成");
%先生成水的封装
%%fprintf(fid,"")

Base=Base+1;

u=size(WaterList);
if u(1)~=1||u(2)~=1
    u=u(2);
    for w=1:u
        r=WaterList(1,w);
        c=WaterList(2,w);
        Pos=NWPos+[c-1,0,r-1];
        %%生成水柱兜底玻璃块和盖子玻璃块
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
        %%生成水柱北侧挡板玻璃柱
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        Pos=Pos+[0,0,-1];
        fprintf(fid,"%s","fill ");
        %%输入柱底部方块的坐标
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%输入柱顶部方块的坐标
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
        %%生成水柱南侧挡板玻璃柱
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        Pos=Pos+[0,0,+1];
        fprintf(fid,"%s","fill ");
        %%输入柱底部方块的坐标
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%输入柱顶部方块的坐标
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
        %%生成水柱西侧挡板玻璃柱
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        Pos=Pos+[-1,0,0];
        fprintf(fid,"%s","fill ");
        %%输入柱底部方块的坐标
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%输入柱顶部方块的坐标
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
        %%生成水柱东侧挡板玻璃柱
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        Pos=Pos+[1,0,0];
        fprintf(fid,"%s","fill ");
        %%输入柱底部方块的坐标
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%输入柱顶部方块的坐标
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

%%开始生成地图内的方块
for c=1:cCount
    for r=1:rCount
        %        t=r+1;
        Pos=NWPos+[c-1,Height(r+1,c),r-1];

        
        if Base(r,c)~=13
            if NeedGlass(Base(r,c))
                Command=strcat("setblock ",num2str(Pos(1))," ",num2str(Pos(2)-1)," ",num2str(Pos(3))," ",BlockList(1));
                fprintf(fid,"%s\n",Command);
                CommandCount=CommandCount+1;
                if mod(CommandCount,65536)==0&&CommandCount
                    fclose(fid);
                    FileName=strcat(PathWithoutSuffix,'_',num2str(NextFileId),'.mcfunction');
                    NextFileId=NextFileId+1;
                    fid=fopen(FileName,"w");
                end
            end
            
            
            Command=strcat("setblock ",num2str(Pos(1))," ",num2str(Pos(2))," ",num2str(Pos(3))," ",BlockList(Base(r,c)));
            
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
%%生成水柱本身
u=size(WaterList);
if u(1)~=1||u(2)~=1
    u=u(2);
    for w=1:1:u
        %%生成水柱
        Pos=NWPos+[WaterList(2,w)-1,WaterList(4,w),WaterList(1,w)-1];
        fprintf(fid,"%s","fill ");
        %%输入水柱底部方块的坐标
        fprintf(fid,"%d",Pos(1));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(2));
        fprintf(fid,"%s"," ");
        fprintf(fid,"%d",Pos(3));
        fprintf(fid,"%s"," ");
        %%输入水柱顶部方块的坐标
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
%%生成北侧边界方块
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