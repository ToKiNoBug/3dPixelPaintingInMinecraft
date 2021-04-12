function [N,Counts] = writeByte(N,Name,Value)
if N.isOpen
    if ~N.isInList
        Counts=fwrite(N.fid,1,'uint8','ieee-be');
        Counts=Counts+fwrite(N.fid,int16(strlength(Name)),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,char(Name),'char','ieee-be');
        Counts=Counts+fwrite(N.fid,int8(Value),'int8','ieee-be');
    else
        if N.CurrentListTypeId==1
            Counts=fwrite(N.fid,int8(Value),'int8','ieee-be');
        else
            error('当前List的内容类型不为Byte，不能写入Byte');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

