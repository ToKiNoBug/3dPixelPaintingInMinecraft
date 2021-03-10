function Map = ColorAdjEuc(CurrentColor,ColorList,MapList)
CurrentColor=reshape(CurrentColor(1:3),[1,3]);
Dis=sum((ColorList-CurrentColor).*(ColorList-CurrentColor),2);
[unFitness,index]=min(Dis);
Map=MapList(index);
Map=Map(1);
% unFitness=unFitness(index);
% unFitness=unFitness(1);
end

