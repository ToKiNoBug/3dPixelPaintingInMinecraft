function [N] = GetNBTWriter(Path)
N=struct('fid',0,'FileName',Path,'isOpen',false,'TotalBytes',0,'isInList',false,'CurrentListTypeId',0,'CLStack',NewStack(64,NaN));
%ջ��-1�����ļ��У�����ֵ����List����ָ��List������
N.fid=fopen(N.FileName,'w');
Counts=fwrite(N.fid,uint8([10,0,0]),'uint8','ieee-be');
N.isOpen=true;
N.TotalBytes=N.TotalBytes+Counts;
end

