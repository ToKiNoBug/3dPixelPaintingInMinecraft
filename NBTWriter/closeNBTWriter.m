function [N] = closeNBTWriter(N)
% if ~N.isOpen
%     error('�ļ��ѹر�/δ�򿪣������ٴιر�');
% end
if isEmptyStack(N.CLStack)
N.TotalBytes=N.TotalBytes+fwrite(N.fid,0,'uint8','ieee-be');
N.fid=fclose(N.fid);
N.isOpen=false;
% else
%     error('����ûд����ļ����������ܽ����ĵ�');
end
end

