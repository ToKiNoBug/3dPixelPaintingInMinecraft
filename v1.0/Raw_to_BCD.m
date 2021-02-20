function [Res] = Raw_to_BCD(Raw,Mode)
u=size(Raw);
if u ~= [1,16384]
    error("µØÍ¼Êý¾Ý³ß´ç´íÎó")
else
    for u=1:1:16384
        x=mod(u,128);
        if x==0 x=128;end
        z=ceil(u/128);
        Color(z,x)=Raw(u);
    end
    Depth=mod(Color,4);
    %Color=(Color-Depth)/4;
    if Mode=="Depth"
        Res=Depth;
    else
        if Mode=="Base"
            Res=(Color-Depth)/4;
            for i=1:1:128;
                for j=1:1:128;
                    if Res(i,j)<0
                        Res(i,j)=64+Res(i,j);
                    end
                end
            end
        else
        Res=Color;
        end
end

end

