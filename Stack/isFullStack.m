function [b] = isFullStack(S)
if(S.top>=S.maxL)
    b=true;
else
    b=false;
end
end

