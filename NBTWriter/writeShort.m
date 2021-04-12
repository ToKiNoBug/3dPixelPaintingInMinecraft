function [N,Counts] = writeShort(N,Name,Value)
if N.isOpen
    if ~N.isInList
        Counts=fwrite(N.fid,2,'uint8','ieee-be');
        Counts=Counts+fwrite(N.fid,int16(strlength(Name)),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,char(Name),'char','ieee-be');
        Counts=Counts+fwrite(N.fid,Value,'int16','ieee-be');
    else
        if N.CurrentListTypeId==2
            Counts=fwrite(N.fid,Value,'int16','ieee-be');
        else
            error('��ǰList���������Ͳ�ΪByte������д��Byte');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

