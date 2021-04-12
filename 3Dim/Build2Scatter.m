function [PosList,ColorList] = Build2Scatter(Build,AdjedPic)

BlockCount=sum(Build>1,'all');
PosList=zeros(BlockCount,3);
ColorList=PosList;
Size=size(Build);
write=1;
%PosList=[x,y,z]
%作图时交换yz，x不变

for y=1:Size(2)
    for z=1:Size(3)
        for x=1:Size(1)
            if Build(x,y,z)>1
                PosList(write,1)=x;
                PosList(write,2)=z;
                PosList(write,3)=y;
                r=z-1;c=x-1;
                if r>=1
                    ColorList(write,:)=reshape(AdjedPic(r,c,:),[1,3]);
                else
                    ColorList(write,:)=[112,112,112]/255;
                end
                write=write+1;
                
            end
            if write>BlockCount
                return;
            end
        end
    end
end

end

