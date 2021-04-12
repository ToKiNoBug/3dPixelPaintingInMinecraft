function [Stack] = StackPop(Stack)
if Stack.top>=1
Res=Stack.Content(Stack.top);
Stack.top=Stack.top-1;
end
end

