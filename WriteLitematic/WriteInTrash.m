function [N] = WriteInTrash(N,Count)
% Count=int16(Count);
if Count>1296
    error('不能写入超过1296种垃圾状态');
end
Types=["none","side","up"];

%redstone_wire

for east=1:3
    for west=1:3
        for north=1:3
            for south=1:3
                for power=0:15
                    N=writeCompound(N,'');
                        N=writeCompound(N,'Properties');
                            N=writeString(N,'east',char(Types(east)));
                            N=writeString(N,'north',char(Types(north)));
                            N=writeString(N,'south',char(Types(south)));
                            N=writeString(N,'west',char(Types(west)));
                            N=writeString(N,'power',char(num2str(power)));
                        N=endCompound(N);
                        N=writeString(N,'Name','minecraft:redstone_wire');
                        
                    N=endCompound(N);
                    Count=Count-1;
                    if abs(Count)<=0.1
                        return;
                    end
                end
            end
        end
    end
end

end

