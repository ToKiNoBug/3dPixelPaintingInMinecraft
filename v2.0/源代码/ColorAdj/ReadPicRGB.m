function [Pic] = ReadPicRGB(Path)
Pic=imread(Path);
Pic=double(Pic)/255;
end

