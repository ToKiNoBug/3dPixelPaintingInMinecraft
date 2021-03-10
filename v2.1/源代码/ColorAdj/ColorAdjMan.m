function [Map,Fitness] = ColorAdjMan(CurrentColor,ColorList,MapList)
CurrentColor=reshape(CurrentColor(1:3),[1,3]);
Dis=sum(abs((ColorList-CurrentColor)),2);
[Fitness,index]=min(Dis);
Map=MapList(index);
Map=Map(1);
% Fitness=Fitness(index);
Fitness=1-Fitness(1);
end

