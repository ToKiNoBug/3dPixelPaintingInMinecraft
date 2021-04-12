function [N,Counts] = writeFloat(N,Name,Value)
if N.isOpen
    if ~N.isInList
        Counts=fwrite(N.fid,5,'uint8','ieee-be');%
        Counts=Counts+fwrite(N.fid,int16(strlength(Name)),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,char(Name),'char','ieee-be');
        Counts=Counts+fwrite(N.fid,Value,'float','ieee-be');%
    else
        if N.CurrentListTypeId==5%
            Counts=fwrite(N.fid,Value,'float','ieee-be');%
        else
            error('��ǰList���������Ͳ�ΪByte������д��Byte');
        end
    end
    N.TotalBytes=N.TotalBytes+Counts;
end
end

