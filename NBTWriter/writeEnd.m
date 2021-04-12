function [N,Counts] = writeEnd(N)
TypeId=0;
DataType='uint8';

if N.isOpen
    if ~N.isInList

        Counts=fwrite(N.fid,0,DataType,'ieee-be');
    else
        if N.CurrentListTypeId==TypeId
            Counts=fwrite(N.fid,0,DataType,'ieee-be');
        else
            error('当前List的内容类型不为End，不能写入End');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

