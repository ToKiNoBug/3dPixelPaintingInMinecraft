function [N] = closeNBTWriter(N)
% if ~N.isOpen
%     error('文件已关闭/未打开，不能再次关闭');
% end
if isEmptyStack(N.CLStack)
N.TotalBytes=N.TotalBytes+fwrite(N.fid,0,'uint8','ieee-be');
N.fid=fclose(N.fid);
N.isOpen=false;
% else
%     error('还有没写完的文件夹树，不能结束文档');
end
end

