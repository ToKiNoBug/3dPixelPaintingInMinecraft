function [N,Counts] = writeInt(N,Name,Value)
TypeId=3;
DataType='int32';

if N.isOpen
    if ~N.isInList
        Counts=fwrite(N.fid,TypeId,'uint8','ieee-be');
        Counts=Counts+fwrite(N.fid,int16(strlength(Name)),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,char(Name),'char','ieee-be');
        Counts=Counts+fwrite(N.fid,Value,DataType,'ieee-be');
    else
        if N.CurrentListTypeId==TypeId
            Counts=fwrite(N.fid,Value,DataType,'ieee-be');
        else
            error('当前List的内容类型不为Byte，不能写入Byte');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

