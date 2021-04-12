function [CommandCount] = NewMapExport(Base,Height,WaterList,NWPos,FileName,BlockList,NeedGlass)
CommandCount=0;
rCount=size(Base,1);
cCount=size(Base,2);
FileName=char(FileName);
PathWithoutSuffix=FileName(1:(strlength(FileName)-11));

NextFileId=1;

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