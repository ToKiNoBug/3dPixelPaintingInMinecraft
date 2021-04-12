function [N,Counts] = writeString(N,Name,Value)
TypeId=8;
DataType='char';

if N.isOpen
    if ~N.isInList
        Counts=fwrite(N.fid,TypeId,'uint8','ieee-be');
        Counts=Counts+fwrite(N.fid,strlength(Name),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,char(Name),'char','ieee-be');
        Counts=Counts+fwrite(N.fid,strlength(Value),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,Value,DataType,'ieee-be');
    else
        if N.CurrentListTypeId==TypeId
            Counts=fwrite(N.fid,max(size(Value)),'int16','ieee-be');
            Counts=Counts+fwrite(N.fid,Value,DataType,'ieee-be');
        else
            error('当前List的内容类型不为String，不能写入String');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

