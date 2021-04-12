function [Res] = StackCurrent(S)
if ~isEmptyStack(S)
Res=S.Content(S.top);
else
    Res=NaN;
end
end

