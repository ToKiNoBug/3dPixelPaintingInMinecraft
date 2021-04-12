function [N,Counts] = writeLongArrayHead(N,Name,Size)
TypeId=12;
% DataType='long';

if N.isOpen
    if ~N.isInList
        Counts=fwrite(N.fid,TypeId,'uint8','ieee-be');
        Counts=Counts+fwrite(N.fid,strlength(Name),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,Name,'char','ieee-be');
        Counts=Counts+fwrite(N.fid,Size,'int32','ieee-be');
        
    else
        if N.CurrentListTypeId==TypeId
            Counts=fwrite(N.fid,Size,'int32','ieee-be');
        else
            error('当前List的内容类型不为LongArray，不能写入LongArray');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

