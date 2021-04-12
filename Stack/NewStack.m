function [Stack] = NewStack(maxL,item)
Stack=struct('maxL',maxL,'Content',repmat(item,1,maxL),'top',0);

end

