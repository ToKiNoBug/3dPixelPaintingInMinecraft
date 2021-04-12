function [N,Counts]=writeList(N,Name,ListLength,ContentTypeId)
if N.isOpen
    if ~N.isInList
        Counts=fwrite(N.fid,9,'uint8','ieee-be');
        Counts=Counts+fwrite(N.fid,strlength(Name),'int16','ieee-be');
        Counts=Counts+fwrite(N.fid,char(Name),'char','ieee-be');
        Counts=Counts+fwrite(N.fid,ContentTypeId,'uint8','ieee-be');
        Counts=Counts+fwrite(N.fid,ListLength,'int32','ieee-be');
        
    else
        if N.CurrentListTypeId==9
            Counts=fwrite(N.fid,ContentTypeId,'uint8','ieee-be');
            Counts=Counts+fwrite(N.fid,ListLength,'int32','ieee-be');
        else
            error('当前List的内容类型不为List，不能写入List');
        end
    end
    N.CLStack=StackPush(N.CLStack,ContentTypeId);
    N.isInList=true;
    N.CurrentListTypeId=ContentTypeId;
    N.TotalBytes=N.TotalBytes+Counts;
end
end