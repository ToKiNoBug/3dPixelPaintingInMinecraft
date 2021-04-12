function [N] = GetNBTWriter(Path)
N=struct('fid',0,'FileName',Path,'isOpen',false,'TotalBytes',0,'isInList',false,'CurrentListTypeId',0,'CLStack',NewStack(64,NaN));
%栈中-1代表文件夹，其他值代表List，且指代List的类型
N.fid=fopen(N.FileName,'w');
Counts=fwrite(N.fid,uint8([10,0,0]),'uint8','ieee-be');
N.isOpen=true;
N.TotalBytes=N.TotalBytes+Counts;
end

