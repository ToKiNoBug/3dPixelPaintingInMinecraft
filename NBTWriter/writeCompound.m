function [N,Counts]=writeCompound(N,Name)
if N.isOpen
    if ~N.isInList
        Counts=fwrite(N.fid,10,'uint8','ieee-be');
        Counts=Counts+fwrite(N.fid,strlength(Name),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,char(Name),'char','ieee-be');
    else
        if N.CurrentListTypeId==10
            %%这里什么都不需要写入
            Counts=0;
        else
            error('当前List的内容类型不为Compound，不能写入Compound');
        end
    end
    N.CLStack=StackPush(N.CLStack,-1);
    N.isInList=false;
    N.TotalBytes=N.TotalBytes+Counts;
end
end