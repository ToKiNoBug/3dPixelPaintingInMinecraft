function Bytes = WriteLite(Path,FileData,BlockList,Build)
N=GetNBTWriter(Path);
%Path is unzipped File path,also final file path
%=strcat(Path,'.gz');
%FileData including Author Name RegionName
BlockTypes=size(BlockList,2);

LiteSize=size(Build);
N=writeCompound(N,'Metadata');
    N=writeCompound(N,'EnclosingSize');
        N=writeInt(N,'x',LiteSize(1));
        N=writeInt(N,'y',LiteSize(2));
        N=writeInt(N,'z',LiteSize(3));
    N=endCompound(N);
    N=writeString(N,'Author',FileData.Author);
    N=writeString(N,'Description','由TokiNoBug的立体地图画生成器Slope导出');
    N=writeString(N,'Name',FileData.Name);
    N=writeInt(N,'RegionCount',1);
    N=writeLong(N,'TimeCreated',114514);
    N=writeLong(N,'TimeModified',1919810);
    N=writeInt(N,'TotalBlocks',sum(Build>0,'all'));
    N=writeInt(N,'TotalVolume',LiteSize(1)*LiteSize(2)*LiteSize(3));

N=endCompound(N);

N.isInList=false;

N=writeCompound(N,'Regions');
    N=writeCompound(N,FileData.RegionName);
        N=writeCompound(N,'Position');
            N=writeInt(N,'x',0);
            N=writeInt(N,'y',0);
            N=writeInt(N,'z',0);
        N=endCompound(N);
        N=writeCompound(N,'Size');
            N=writeInt(N,'x',LiteSize(1));
            N=writeInt(N,'y',LiteSize(2));
            N=writeInt(N,'z',LiteSize(3));
        N=endCompound(N);

        N=writeList(N,'BlockStatePalette',1+BlockTypes+129,10);
            N=writeCompound(N,'');
                N=writeString(N,'Name','minecraft:air');
            N=endCompound(N);
%             N=writeCompound(N,'');
%                 N=writeString(N,'Name','minecraft:glass');
%             N=endCompound(N);
            %写入其他方块列表
            
            for i=1:BlockTypes
                [BlockId,BlockProperties] = DealingBlockStates(BlockList(i));
                
                N=writeCompound(N,'');
                    N=writeString(N,'Name',char(strcat('minecraft:',BlockId)));
                    if(~isempty(BlockProperties))
                        N=writeCompound(N,'Properties');
                       pros=size(BlockProperties,1);
                       for j=1:pros
                           N=writeString(N,BlockProperties(j,1),BlockProperties(j,2));
                       end
                       N=endCompound(N);
                    end
                N=endCompound(N);                
            end

            N=WriteInTrash(N,129);

        N=endList(N);
        
        N=writeList(N,'Entities',0,10);
        N=endList(N);
        N=writeList(N,'PendingBlockTicks',0,10);
        N=endList(N);
        N=writeList(N,'PendingFluidTiccks',0,10);
        N=endList(N);
        N=writeList(N,'TileEntities',0,10);
        N=endList(N);

        N=writeLongArrayHead(N,'BlockStates',ceil((LiteSize(1)*LiteSize(2)*LiteSize(3))/8));
            writeIn=1;
            writePool=uint8(zeros(1,8));
            for y=1:LiteSize(2)
               for z=1:LiteSize(3)
                   for x=1:LiteSize(1)
                       writePool(writeIn)=Build(x,y,z);
                       if(writeIn>=8)
                           N=write8ByteArrayEleReversely(N,writePool);
                           writeIn=0;
                       end
                       writeIn=writeIn+1;
                   end
               end
            end
        if writeIn>1
            N=write8ByteArrayEleReversely(N,writePool);
        end
        N=endList(N);
        %N=write8ByteArrayEleReversely(N,i:(i+7));
        
%         N=writeByteArrayEle(N,0);
        %写入方块状态的long array
    N=endCompound(N);
N=endCompound(N);
N=writeInt(N,'MinecraftDataVersion',2584);
N=writeInt(N,'Version',5);

N=closeNBTWriter(N);

gzip(Path);
zippedPath=gzip(Path);
zippedPath=zippedPath{1};
delete(Path);
%disp(strcat("Path=",Path));
%disp(strcat("zippedPath=",zippedPath));
movefile(zippedPath,Path,'f');

Bytes=N.TotalBytes;
end
