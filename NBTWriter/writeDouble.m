function [N,Counts] = writeDouble(N,Name,Value)
TypeId=6;
DataType='double';

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
            error('��ǰList���������Ͳ�ΪByte������д��Byte');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

