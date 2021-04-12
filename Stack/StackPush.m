function [Stack] = StackPush(Stack,item)
if Stack.top-1<=Stack.maxL
Stack.top=Stack.top+1;
Stack.Content(Stack.top)=item;
end
end

