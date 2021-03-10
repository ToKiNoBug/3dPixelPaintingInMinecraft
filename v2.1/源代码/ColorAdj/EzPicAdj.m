function [PicMap] = EzPicAdj(Pic,ColorMode,isSurvival,is16,isFlat,RGB,HSV,Map,XYZ,Lab,CMY)
MIndex15=repmat([true(51,1);false(7,1)],4,1);
CIndex15=repmat(MIndex15,1,3);
MIndexS=[true(174,1);false(58,1)];
CIndexS=repmat(MIndexS,1,3);
MIndexF=[false(58,1);true(58,1);false(116,1)];
MIndexF(128)=true;
MIndexF(70)=false;
CIndexF=repmat(MIndexF,1,3);

MIndex=true(232,1);
CIndex=true(232,3);

if isSurvival
    MIndex=MIndex&MIndexS;
    CIndex=CIndex&CIndexS;
end

if ~is16
    MIndex=MIndex&MIndex15;
    CIndex=CIndex&CIndex15;
end

if isFlat
    MIndex=MIndex&MIndexF;
    CIndex=CIndex&CIndexF;
end

% L=sum(MIndex);
Map(~MIndex)=nan;
RGB(~CIndex)=nan;
HSV(~CIndex)=nan;
Lab(~CIndex)=nan;
CMY(~CIndex)=nan;
XYZ(~CIndex)=nan;

% Map=reshape(Map(MIndex),[L,1]);
% RGB=reshape(RGB(CIndex),[L,3]);
% HSV=reshape(HSV(CIndex),[L,3]);
% Lab=reshape(Lab(CIndex),[L,3]);
% CMY=reshape(CMY(CIndex),[L,3]);
% XYZ=reshape(XYZ(CIndex),[L,3]);

if(strcmp(ColorMode,'RGB'))
    PicMap=PicAdjEuc(Pic,RGB,Map);
    %     ShowPicMap(PicMap,RGB);
    return;
end
if(strcmp(ColorMode,'HSV'))
    PicMap=PicAdjEuc(rgb2hsv(Pic),HSV,Map);
    %     ShowPicMap(PicMap,RGB);
    return;
end
if(strcmp(ColorMode,'XYZ'))
    PicMap=PicAdjEuc(rgb2xyz(Pic),XYZ,Map);
    %     ShowPicMap(PicMap,RGB);
    return;
end
if(strcmp(ColorMode,'Lab'))
    PicMap=PicAdjEuc(rgb2lab(Pic),Lab,Map);
    %     ShowPicMap(PicMap,RGB);
    return;
end
if(strcmp(ColorMode,'CMY'))
    PicMap=PicAdjEuc(rgb2cmy(Pic),CMY,Map);
    %     ShowPicMap(PicMap,RGB);
    return;
end

end

