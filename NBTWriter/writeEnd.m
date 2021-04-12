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
            error('��ǰList���������Ͳ�ΪEnd������д��End');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

