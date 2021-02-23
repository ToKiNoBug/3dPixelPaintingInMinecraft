for r=1:256
for g=1:256
for b=1:256
RawColor=[r,g,b]-1;
for i=1:174
Dis(i)=sum((RawColor-ColorS(i,:)).^2);
end
u=BaseS(Dis==min(Dis)');
AdjedMapColorS(r,g,b)=u(1);
end
end
disp(r)
end