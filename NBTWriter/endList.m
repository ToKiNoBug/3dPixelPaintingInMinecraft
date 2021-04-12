function [N]=endList(N)
% if StackCurrent(N.CLStack)==-1
%     error('现在写入的不是List，不能结束List');
% end

N.CLStack=StackPop(N.CLStack);

if StackCurrent(N.CLStack)~=-1
    N.isInList=true;
    N.CurrentListTypeId=StackCurrent(N.CLStack);
else
    N.isInList=false;
    N.CurrentListTypeId=0;
end

end

