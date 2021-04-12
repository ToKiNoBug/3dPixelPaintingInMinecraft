function [N,Counts] = write8ByteArrayEleReversely(N,Value)
% TypeId=12;
% DataType='long';

if N.isOpen
            Counts=fwrite(N.fid,fliplr(Value),'uint8','ieee-be');
    N.TotalBytes=N.TotalBytes+Counts;
end
end

