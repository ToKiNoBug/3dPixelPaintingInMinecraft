function [BlockId,BlockProperties] = DealingBlockStates(Id)
Id=char(Id);
if Id(strlength(Id))~=']'
    BlockId=string(Id);
    BlockProperties=[];
    return;
end
BlockProperties=string(char(zeros(sum(Id==',')+1,2)));
FindEnd=strlength(Id)-1;
FindStart=strfind(Id,'[')+1;
BlockId=string(Id(1:(FindStart(1)-2)));
write=1;
read=FindStart;
ProNameIndex=[FindStart,FindStart+1];
ProValIndex=[FindStart,FindStart+1];
Found=false;
while(read<=FindEnd)
   if Id(read-1)=='['||Id(read-1)==','
       ProNameIndex(1)=read;
   end
   if Id(read+1)=='='
       ProNameIndex(2)=read;
   end
   if Id(read-1)=='='
       ProValIndex(1)=read;
   end
   if Id(read+1)==']'||Id(read+1)==','
       ProValIndex(2)=read;
       Found=true;
   end
   if Found
       BlockProperties(write,1)=string(Id(ProNameIndex(1):ProNameIndex(2)));
       BlockProperties(write,2)=string(Id(ProValIndex(1):ProValIndex(2)));
       write=write+1;
       Found=false;
   end
    
    read=read+1;
end

end

