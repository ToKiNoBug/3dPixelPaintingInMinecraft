function [N,Counts] = writeLongArrayEle(N,Value)
% TypeId=12;
% DataType='long';

if N.isOpen
            Counts=fwrite(N.fid,Value,'long','ieee-be');
    N.TotalBytes=N.TotalBytes+Counts;
end
end

