function [N,Counts]=endCompound(N)
% if StackCurrent(N.CLStack)~=-1
%     error('����д��Ĳ���Compound������д��Compound������');
% end
Counts=fwrite(N.fid,0,'uint8','ieee-be');
N.TotalBytes=N.TotalBytes+Counts;
N.CLStack=StackPop(N.CLStack);


if StackCurrent(N.CLStack)==-1||isEmptyStack(N.CLStack)
    N.isInList=false;
    N.CurrentListTypeId=10;
    
else
    N.isInList=true;
    N.CurrentListTypeId=StackCurrent(N.CLStack);
end


%         function [Counts,N]=EndList(N,isOuterList)
%                         Counts=fwrite(N.fid,0,'uint8','ieee-be');
%                         N.TotalBytes=N.TotalBytes+Counts;
%             Counts=0;
%             N.isInList=isOuterList;
%         end
end

