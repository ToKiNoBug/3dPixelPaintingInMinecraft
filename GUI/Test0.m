function varargout = Test0(varargin)
% TEST0 MATLAB code for Test0.fig
%      TEST0, by itself, creates a new TEST0 or raises the existing
%      singleton*.
%
%      H = TEST0 returns the handle to a new TEST0 or the handle to
%      the existing singleton*.
%
%      TEST0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST0.M with the given input arguments.
%
%      TEST0('Property','Value',...) creates a new TEST0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Test0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Test0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Test0

% Last Modified by GUIDE v2.5 03-Apr-2021 21:04:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Test0_OpeningFcn, ...
    'gui_OutputFcn',  @Test0_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before Test0 is made visible.
function Test0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Test0 (see VARARGIN)
handles.FeedBack.String="Loading...";
axis off
[handles.RGB,handles.HSV,handles.Lab,handles.CMY,handles.XYZ,handles.Map]=GetColors();
handles.ColorMode='Lab';
handles.isSurvival=true;
handles.is16=true;
handles.isFlat=false;
handles.RawPic=zeros(128,128,3);
handles.MapPic=uint8(zeros(128,128));
% Choose default command line output for Test0
handles.output = hObject;
handles.FeedBack.String="";
handles.NWPos=[-64,5,-64];
handles.isImported=false;
handles.isAdjusted=false;
handles.isGenerated=false;
handles.BlockListMode='Survival_Better';
handles.PlotedIm=image(handles.Imager,ones(128,128,3));
handles.Imager.Visible=false;
handles.MIndexCustom=true(58,1);
handles.CBL=struct('BlockList',repmat("",1,59),'BaseList',1:59);
handles.CBL.NeedGlass=false(1,59);
handles.ChangedByUser=false;
handles.ApplyCheck=true;
handles.hasBuild=false;
% Update handles structure
guidata(hObject, handles);



% UIWAIT makes Test0 wait for user response (see UIRESUME)
% uiwait(handles.SlopeFig);


% --- Outputs from this function are returned to the command line.
function varargout = Test0_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in ImportPic.
function ImportPic_Callback(hObject, eventdata, handles)
% hObject    handle to ImportPic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hObject.String="Loading...";
[File,Path]=uigetfile({'*.png';'*.jpg'},'打开图片');
if(ischar(File))
    RawPic=imread(strcat(Path,File));
    handles.RawPic=double(RawPic)/255;
    handles.PlotedIm=image(handles.Imager,handles.RawPic);
    handles.Imager.Visible=false;
    
    handles.isImported=true;
    handles.isAdjusted=false;
    handles.isGenerated=false;
    handles.hasBuild=false;
    handles.FeedBack.String="成功导入图片";
    
end
hObject.String="选择图片";
guidata(hObject, handles);

% --- Executes on button press in isBlockListSurvivalCheaper.
function isBlockListSurvivalCheaper_Callback(hObject, eventdata, handles)
handles.isBlockListCreative.Value=false;
handles.isBlockListSurvivalCheaper.Value=true;
handles.isBlockListSurvivalBetter.Value=false;
handles.isBlockListInstBreak.Value=false;
handles.isBlockListGlowing.Value=false;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='Survival_Cheaper';
handles.ChangedByUser=true;
guidata(hObject, handles);
	handles.is01Grass.Value=true;
    handles.is02BirchPlanks.Value=true;
    handles.is04RedstoneBlock.Value=true;
    handles.is05Ice.Value=true;
    handles.is06IronPlate.Value=true;
    handles.is07BirchLeaves.Value=true;
    handles.is08Concrete.Value=true;
    handles.is10CoarseDirt.Value=true;
    handles.is11Cobblestone.Value=true;
    handles.is13OakPlanks.Value=true;
    handles.is14Target.Value=true;
    handles.is15Concrete.Value=true;
    handles.is16Concrete.Value=true;
    handles.is17Concrete.Value=true;
    handles.is18Concrete.Value=true;
    handles.is19Concrete.Value=true;
    handles.is20Concrete.Value=true;
    handles.is21Concrete.Value=true;
    handles.is22Concrete.Value=true;
    handles.is23Concrete.Value=true;
    handles.is24Concrete.Value=true;
    handles.is25Concrete.Value=true;
    handles.is26Concrete.Value=true;
    handles.is27Concrete.Value=true;
    handles.is28Concrete.Value=true;
    handles.is29Concrete.Value=true;
    handles.is30GoldPlate.Value=true;
    handles.is31PrismarineBricks.Value=true;
    handles.is34SprucePlanks.Value=true;
    handles.is35Netherrack.Value=true;
    handles.is53CrimsonPlanks.Value=true;
    handles.is54CrimsonHyphae.Value=true;
    handles.is56WarpedPlanks.Value=true;
    handles.is57WarpedHyphae.Value=true;
handles.ChangedByUser=false;
guidata(hObject, handles);


% Hint: get(hObject,'Value') returns toggle state of isBlockListSurvivalCheaper


% --- Executes on button press in isBlockListCreative.
function isBlockListCreative_Callback(hObject, eventdata, handles)
handles.isBlockListCreative.Value=true;
handles.isBlockListSurvivalCheaper.Value=false;
handles.isBlockListSurvivalBetter.Value=false;
handles.isBlockListInstBreak.Value=false;
handles.isBlockListGlowing.Value=false;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='Creative';
handles.ChangedByUser=true;
guidata(hObject, handles);
    handles.is01Grass.Value=true;
    handles.is02SandStone.Value=true;
    handles.is04RedstoneBlock.Value=true;
    handles.is05Ice.Value=true;
    handles.is06IronBlock.Value=true;
    handles.is07BirchLeaves.Value=true;
    handles.is08SnowBlock.Value=true;
    handles.is10CoarseDirt.Value=true;
    handles.is11Cobblestone.Value=true;
    handles.is13OakPlanks.Value=true;
    handles.is14PolishedDiorite.Value=true;
    handles.is15Concrete.Value=true;
    handles.is16Concrete.Value=true;
    handles.is17Concrete.Value=true;
    handles.is18Concrete.Value=true;
    handles.is19Concrete.Value=true;
    handles.is20Concrete.Value=true;
    handles.is21Concrete.Value=true;
    handles.is22Concrete.Value=true;
    handles.is23Concrete.Value=true;
    handles.is24Concrete.Value=true;
    handles.is25Concrete.Value=true;
    handles.is26Concrete.Value=true;
    handles.is27Concrete.Value=true;
    handles.is28Concrete.Value=true;
    handles.is29Concrete.Value=true;
    handles.is30GoldBlock.Value=true;
    handles.is31DiamondBlock.Value=true;
    handles.is34Podzol.Value=true;
    handles.is35Netherrack.Value=true;
    handles.is53CrimsonPlanks.Value=true;
    handles.is54CrimsonHyphae.Value=true;
    handles.is56WarpedPlanks.Value=true;
    handles.is57WarpedHyphae.Value=true;
handles.ChangedByUser=false;
guidata(hObject, handles);


% --- Executes on button press in isBlockListSurvivalBetter.
function isBlockListSurvivalBetter_Callback(hObject, eventdata, handles)
handles.isBlockListCreative.Value=false;
handles.isBlockListSurvivalCheaper.Value=false;
handles.isBlockListSurvivalBetter.Value=true;
handles.isBlockListInstBreak.Value=false;
handles.isBlockListGlowing.Value=false;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='Survival_Better';
handles.ChangedByUser=true;
guidata(hObject, handles);
    handles.is01SlimeBlock.Value=true;
    handles.is02BirchPlanks.Value=true;
    handles.is04RedstoneBlock.Value=true;
    handles.is05PackedIce.Value=true;
    handles.is06IronBlock.Value=true;
    handles.is07BirchLeaves.Value=true;
    handles.is08Concrete.Value=true;
    handles.is10JunglePlanks.Value=true;
    handles.is11SmoothStone.Value=true;
    handles.is13OakPlanks.Value=true;
    handles.is14Quartz.Value=true;
    handles.is15Concrete.Value=true;
    handles.is16Concrete.Value=true;
    handles.is17Concrete.Value=true;
    handles.is18Concrete.Value=true;
    handles.is19Concrete.Value=true;
    handles.is20Concrete.Value=true;
    handles.is21Concrete.Value=true;
    handles.is22Concrete.Value=true;
    handles.is23Concrete.Value=true;
    handles.is24Concrete.Value=true;
    handles.is25Concrete.Value=true;
    handles.is26Concrete.Value=true;
    handles.is27Concrete.Value=true;
    handles.is28Concrete.Value=true;
    handles.is29Concrete.Value=true;
    handles.is30GoldBlock.Value=true;
    handles.is31PrismarineBricks.Value=true;
    handles.is34SprucePlanks.Value=true;
    handles.is35Netherbricks.Value=true;
    handles.is53CrimsonPlanks.Value=true;
    handles.is54StrippedCrimsonHyphae.Value=true;
    handles.is56WarpedPlanks.Value=true;
    handles.is57StrippedWarpedHyphae.Value=true;
handles.ChangedByUser=false;
guidata(hObject, handles);


% --- Executes on button press in isBlockListInstBreak.
function isBlockListInstBreak_Callback(hObject, eventdata, handles)
handles.isBlockListCreative.Value=false;
handles.isBlockListSurvivalCheaper.Value=false;
handles.isBlockListSurvivalBetter.Value=false;
handles.isBlockListInstBreak.Value=true;
handles.isBlockListGlowing.Value=false;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='InstBreak';
handles.ChangedByUser=true;
guidata(hObject, handles);
	handles.is01SlimeBlock.Value=true;
    handles.is02SandStone.Value=true;
    handles.is04Tnt.Value=true;
    handles.is05Ice.Value=true;
    handles.is06IronPlate.Value=true;
    handles.is07BirchLeaves.Value=true;
    handles.is08StainedGlass.Value=true;
    handles.is10CoarseDirt.Value=true;
    handles.is11Stone.Value=true;
    handles.is13NoteBlock.Value=true;
    handles.is14Target.Value=true;
    handles.is15StainedGlass.Value=true;
    handles.is16StainedGlass.Value=true;
    handles.is17StainedGlass.Value=true;
    handles.is18StainedGlass.Value=true;
    handles.is19StainedGlass.Value=true;
    handles.is20StainedGlass.Value=true;
    handles.is21StainedGlass.Value=true;
    handles.is22StainedGlass.Value=true;
    handles.is23StainedGlass.Value=true;
    handles.is24StainedGlass.Value=true;
    handles.is25StainedGlass.Value=true;
    handles.is26StainedGlass.Value=true;
    handles.is27StainedGlass.Value=true;
    handles.is28StainedGlass.Value=true;
    handles.is29StainedGlass.Value=true;
    handles.is30GoldPlate.Value=true;
    handles.is31PrismarineBricks.Value=true;
    handles.is34Podzol.Value=true;
    handles.is35Netherrack.Value=true;
    handles.is53CrimsonPlanks.Value=true;
    handles.is54CrimsonHyphae.Value=true;
    handles.is56WarpedPlanks.Value=true;
    handles.is57WarpedHyphae.Value=true;
handles.ChangedByUser=false;
guidata(hObject, handles);

function isBlockListGlowing_Callback(hObject, eventdata, handles)
handles.isBlockListCreative.Value=false;
handles.isBlockListSurvivalCheaper.Value=false;
handles.isBlockListSurvivalBetter.Value=false;
handles.isBlockListInstBreak.Value=false;
handles.isBlockListGlowing.Value=true;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='Glowing';
handles.ChangedByUser=true;
guidata(hObject, handles);
	handles.is01SlimeBlock.Value=true;
    handles.is02Glowstone.Value=true;
    handles.is04RedstoneBlock.Value=true;
    handles.is05PackedIce.Value=true;
    handles.is06Lantern.Value=true;
    handles.is07BirchLeaves.Value=true;
    handles.is08Concrete.Value=true;
    handles.is10JunglePlanks.Value=true;
    handles.is11SmoothStone.Value=true;
    handles.is13OakPlanks.Value=true;
    handles.is14SeaLantern.Value=true;
    handles.is15Concrete.Value=true;
    handles.is16Concrete.Value=true;
    handles.is17Concrete.Value=true;
    handles.is18Concrete.Value=true;
    handles.is19Concrete.Value=true;
    handles.is20Concrete.Value=true;
    handles.is21Concrete.Value=true;
    handles.is22Concrete.Value=true;
    handles.is23Concrete.Value=true;
    handles.is24Concrete.Value=true;
    handles.is25Concrete.Value=true;
    handles.is26Concrete.Value=true;
    handles.is27Concrete.Value=true;
    handles.is28Shroomlight.Value=true;
    handles.is29Concrete.Value=true;
    handles.is30GoldBlock.Value=true;
    handles.is31PrismarineBricks.Value=true;
    handles.is34CampFire.Value=true;
    handles.is35MagmaBlock.Value=true;
    handles.is53CrimsonPlanks.Value=true;
    handles.is54StrippedCrimsonHyphae.Value=true;
    handles.is56WarpedPlanks.Value=true;
    handles.is57StrippedWarpedHyphae.Value=true;
handles.ChangedByUser=false;
guidata(hObject, handles);

function isBlockListCustom_Callback(hObject, eventdata, handles)
handles.isBlockListCreative.Value=false;
handles.isBlockListSurvivalCheaper.Value=false;
handles.isBlockListSurvivalBetter.Value=false;
handles.isBlockListInstBreak.Value=false;
handles.isBlockListGlowing.Value=false;
handles.isBlockListCustom.Value=true;
handles.BlockListMode='Custom';
handles.ApplyCheck=true;
guidata(hObject, handles);


% --- Executes on button press in isMapSurvival.
function isMapSurvival_Callback(hObject, eventdata, handles)
% hObject    handle to isMapSurvival (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isMapSurvival
handles.isMapCreative.Value=false;
hObject.Value=true;
handles.isSurvival=true;
guidata(hObject, handles);

% --- Executes on button press in isMapCreative.
function isMapCreative_Callback(hObject, eventdata, handles)
% hObject    handle to isMapCreative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isMapCreative
handles.isMapSurvival.Value=false;
hObject.Value=true;
handles.isSurvival=false;
guidata(hObject, handles);

% --- Executes on button press in isGameVersion15.
function isGameVersion15_Callback(hObject, eventdata, handles)
% hObject    handle to isGameVersion15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isGameVersion16.Value=false;
hObject.Value=true;
handles.is16=false;
% Hint: get(hObject,'Value') returns toggle state of isGameVersion15
guidata(hObject, handles);

% --- Executes on button press in isGameVersion16.
function isGameVersion16_Callback(hObject, eventdata, handles)
% hObject    handle to isGameVersion16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isGameVersion15.Value=false;
hObject.Value=true;
handles.is16=true;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of isGameVersion16


% --- Executes on button press in isBlockListCustom.


% --- Executes on button press in isColorSpaceHSV.
function isColorSpaceHSV_Callback(hObject, eventdata, handles)
% hObject    handle to isColorSpaceHSV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isColorSpaceRGB.Value=false;
handles.isColorSpaceHSV.Value=true;
handles.isColorSpaceLab.Value=false;
handles.isColorSpaceXYZ.Value=false;
handles.ColorMode='HSV';
% Hint: get(hObject,'Value') returns toggle state of isColorSpaceHSV
guidata(hObject, handles);

% --- Executes on button press in isColorSpaceRGB.
function isColorSpaceRGB_Callback(hObject, eventdata, handles)
% hObject    handle to isColorSpaceRGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isColorSpaceRGB.Value=true;
handles.isColorSpaceHSV.Value=false;
handles.isColorSpaceLab.Value=false;
handles.isColorSpaceXYZ.Value=false;
handles.ColorMode='RGB';
% Hint: get(hObject,'Value') returns toggle state of isColorSpaceRGB
guidata(hObject, handles);


% --- Executes on button press in isColorSpaceXYZ.
function isColorSpaceXYZ_Callback(hObject, eventdata, handles)
% hObject    handle to isColorSpaceXYZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isColorSpaceRGB.Value=false;
handles.isColorSpaceHSV.Value=false;
handles.isColorSpaceLab.Value=false;
handles.isColorSpaceXYZ.Value=true;
handles.ColorMode='XYZ';
% Hint: get(hObject,'Value') returns toggle state of isColorSpaceXYZ
guidata(hObject, handles);

% --- Executes on button press in isColorSpaceLab.
function isColorSpaceLab_Callback(hObject, eventdata, handles)
% hObject    handle to isColorSpaceLab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isColorSpaceRGB.Value=false;
handles.isColorSpaceHSV.Value=false;
handles.isColorSpaceLab.Value=true;
handles.isColorSpaceXYZ.Value=false;
handles.ColorMode='Lab';
% Hint: get(hObject,'Value') returns toggle state of isColorSpaceLab
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function SlopeFig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SlopeFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% set(handles.Logo,'CDATA',imread('Title.png'));
% handles.Logo.CData=imread('Title.png');



% --- Executes on button press in AdjCol.
function AdjCol_Callback(hObject, eventdata, handles)

hObject.String="Loading...";
if(~handles.isImported)
    handles.FeedBack.String="你还没有导入图片";
    hObject.String="调整颜色";
    %     handles.isGenerated=false;
    guidata(hObject, handles);
    return;
end
% is16=handles.isGameVersion16.Value;

handles.PicMap=EzPicAdj(handles.RawPic,handles.ColorMode,handles.isSurvival,handles.is16,handles.isFlat,handles.MIndexCustom,handles.RGB,handles.HSV,handles.Map,handles.XYZ,handles.Lab);

handles.AdjedPic=ShowPicMap(handles.PicMap,handles.RGB);
handles.PlotedIm=image(handles.Imager,handles.AdjedPic);
handles.Imager.Visible=false;
unFits=mean(abs(handles.AdjedPic-handles.RawPic),'all');
handles.unFitness.String=['与原图的差异：',num2str(unFits*100),'%'];
handles.isAdjusted=true;
handles.isGenerated=false;
handles.hasBuild=false;
handles.FeedBack.String="成功为图片调整颜色";
hObject.String="调整颜色";
% disp(handles.PicMap);
guidata(hObject, handles);


% --- Executes on button press in ShowRaw.
function ShowRaw_Callback(hObject, eventdata, handles)
% hObject    handle to ShowRaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(~handles.isImported)
    handles.FeedBack.String="你还没有导入图片";
    hObject.String="显示原图";
    %     handles.isGenerated=false;
    guidata(hObject, handles);
    return;
end
hObject.String="Loading...";
handles.PlotedIm=image(handles.Imager,handles.RawPic);
hObject.String="显示原图";
handles.Imager.Visible=false;
guidata(hObject, handles);


% --- Executes on button press in ShowAdjed.
function ShowAdjed_Callback(hObject, eventdata, handles)
% hObject    handle to ShowAdjed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(~handles.isImported||~handles.isAdjusted)
    handles.FeedBack.String="你还没有导入/调整图片";
    hObject.String="显示调整后图像";
    %     handles.isGenerated=false;
    guidata(hObject, handles);
    return;
end
hObject.String="Loading...";
handles.PlotedIm=image(handles.Imager,handles.AdjedPic);
hObject.String="显示调整后图像";
handles.Imager.Visible=false;
guidata(hObject, handles);



function NWX_Callback(hObject, eventdata, handles)
% hObject    handle to NWX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NWX as text
%        str2double(get(hObject,'String')) returns contents of NWX as a double


% --- Executes during object creation, after setting all properties.
function NWX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NWX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NWY_Callback(hObject, eventdata, handles)
% hObject    handle to NWY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NWY as text
%        str2double(get(hObject,'String')) returns contents of NWY as a double


% --- Executes during object creation, after setting all properties.
function NWY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NWY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NWZ_Callback(hObject, eventdata, handles)
% hObject    handle to NWZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NWZ as text
%        str2double(get(hObject,'String')) returns contents of NWZ as a double


% --- Executes during object creation, after setting all properties.
function NWZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NWZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Generate.
function Generate_Callback(hObject, eventdata, handles)
% hObject    handle to Generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hObject.String="Loading...";
if(~handles.isImported)
    handles.FeedBack.String="你还没有导入图片";
    hObject.String="生成立体地图画";
    handles.isGenerated=false;
    handles.hasBuild=false;
    guidata(hObject, handles);
    return;
end
if ~handles.isSurvival
    handles.FeedBack.String="Creative模式的地图画使用了第四个阴影，不可能生成";
    hObject.String="生成立体地图画";
    handles.isGenerated=false;
    handles.hasBuild=false;
    guidata(hObject, handles);
    return;
end
if(~handles.isAdjusted)
    handles.FeedBack.String="你还没有调整颜色";
    hObject.String="生成立体地图画";
    handles.isGenerated=false;
    handles.hasBuild=false;
    guidata(hObject, handles);
    return;
end

if mod(size(handles.PicMap,1),128)~=0||mod(size(handles.PicMap,2),128)~=0
    handles.FeedBack.String="图片长宽尺寸不是128的整数倍，暂不支持";
    hObject.String="生成立体地图画";
    handles.isGenerated=false;
    handles.hasBuild=false;
    guidata(hObject, handles);
    return;
end


if(isempty(str2num(handles.NWX.String))||isempty(str2num(handles.NWY.String))||isempty(str2num(handles.NWZ.String)))
    handles.FeedBack.String="你输入的坐标不可用，建议为-64,5,-64";
    hObject.String="生成立体地图画";
    handles.NWX.String="x";
    handles.NWY.String="y";
    handles.NWZ.String="z";
    handles.isGenerated=false;
    handles.hasBuild=false;
    guidata(hObject, handles);
    return;
end
handles.NWPos(1)=round(str2double(handles.NWX.String));
handles.NWPos(2)=round(str2double(handles.NWY.String));
handles.NWPos(3)=round(str2double(handles.NWZ.String));
if(handles.NWPos(2)<0)
    handles.FeedBack.String="你输入的Y坐标小于0，它最好不小于5";
    hObject.String="生成立体地图画";
    handles.NWY.String="5";
    handles.isGenerated=false;
    handles.hasBuild=false;
    guidata(hObject, handles);
    return;
end
handles.FeedBack.String="生成中……请稍候";
handles.Base=floor(handles.PicMap*0.25);
% disp(handles.Base(handles.Base>58));
Depth=round(mod(handles.PicMap,4));
% disp(handles.Depth);
[handles.Height,handles.WaterList]=MakeHeight(handles.Base,Depth);

if handles.isFlat
    handles.Height=round(handles.Height*0);
    handles.WaterList(3:4,:)=round(handles.WaterList(3:4,:)*0);
end

% disp(handles.Height);
handles.isGenerated=true;
handles.hasBuild=false;
hObject.String="生成立体地图画";
handles.FeedBack.String=strcat("成功生成了立体地图画，总高度",num2str(1+max(handles.Height,[],'all')-min(handles.Height,[],'all')));
guidata(hObject, handles);


% --- Executes on button press in Export.
function Export_Callback(hObject, eventdata, handles)
% hObject    handle to Export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hObject.String="Loading...";
if(~handles.isGenerated)
    handles.FeedBack.String="你还没有生成立体地图画";
    hObject.String="导出mcfunction";
    guidata(hObject, handles);
    return;
end
[File,Path]=uiputfile('*.mcfunction');
if(~File)
    hObject.String="导出mcfunction";
    return;
end
[BlockList,NeedGlass]=ApplyBlockList(handles.BlockListMode,handles.CBL);
if strcmp(handles.BlockListMode,"Custom")
    NeedGlass=handles.CBL.NeedGlass;
end
Count = NewMapExport(handles.Base,handles.Height,handles.WaterList,handles.NWPos,strcat(Path,File),BlockList,NeedGlass);
handles.FeedBack.String=strcat("导出成功：共",num2str(Count),"条命令");
hObject.String="导出mcfunction";
guidata(hObject, handles);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over FeedBack.
function FeedBack_Callback(hObject, eventdata, handles)
% hObject    handle to FeedBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hObject.String="";

guidata(hObject, handles);


% --- Executes on button press in isMapFlat.
function isMapFlat_Callback(hObject, eventdata, handles)
% hObject    handle to isMapFlat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isFlat=hObject.Value;
% disp(handles.isFlat)
% Update handles structure
guidata(hObject, handles);
% hObject.Value=handles.isFlat;
% Hint: get(hObject,'Value') returns toggle state of isMapFlat


% --------------------------------------------------------------------
function BlockListMenu_Callback(hObject, eventdata, handles)
M=false;
handles.MapType.Visible=M;handles.ImportPic.Visible=M;handles.BlockListType.Visible=M;
handles.GameVersion.Visible=M;handles.ColorSpace.Visible=M;handles.AdjCol.Visible=M;
handles.unFitness.Visible=M;handles.ShowAdjed.Visible=M;handles.LabelNWPos.Visible=M;
handles.NWX.Visible=M;handles.NWY.Visible=M;handles.NWZ.Visible=M;
handles.Generate.Visible=M;handles.Export.Visible=M;handles.FeedBack.Visible=M;
handles.PlotedIm.Visible=M;handles.Author.Visible=M;handles.Logo.Visible=M;
handles.LabelNWPOS.Visible=M;handles.ShowRaw.Visible=M;handles.Imager.Visible=false;

M=true;
handles.BlockListFrame.Visible=M;

M=false;
handles.MakeLiteFrame.Visible=M;
%axis(handles.Previewer,[0,128,0,128,0,128]);


% --------------------------------------------------------------------


% --------------------------------------------------------------------
function MainMenu_Callback(hObject, eventdata, handles)
% hObject    handle to MainMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
M=true;
handles.MapType.Visible=M;handles.ImportPic.Visible=M;handles.BlockListType.Visible=M;
handles.GameVersion.Visible=M;handles.ColorSpace.Visible=M;handles.AdjCol.Visible=M;
handles.unFitness.Visible=M;handles.ShowAdjed.Visible=M;handles.LabelNWPos.Visible=M;
handles.NWX.Visible=M;handles.NWY.Visible=M;handles.NWZ.Visible=M;
handles.Generate.Visible=M;handles.Export.Visible=M;handles.FeedBack.Visible=M;
handles.PlotedIm.Visible=M;handles.Author.Visible=M;handles.Logo.Visible=M;
handles.LabelNWPOS.Visible=M;handles.ShowRaw.Visible=M;handles.Imager.Visible=false;

M=false;
handles.BlockListFrame.Visible=M;

M=false;
handles.MakeLiteFrame.Visible=M;
%axis(handles.Previewer,[0,128,0,128,0,128]);






% --------------------------------------------------------------------
function BuildMenu_Callback(hObject, eventdata, handles)
M=false;
handles.MapType.Visible=M;handles.ImportPic.Visible=M;handles.BlockListType.Visible=M;
handles.GameVersion.Visible=M;handles.ColorSpace.Visible=M;handles.AdjCol.Visible=M;
handles.unFitness.Visible=M;handles.ShowAdjed.Visible=M;handles.LabelNWPos.Visible=M;
handles.NWX.Visible=M;handles.NWY.Visible=M;handles.NWZ.Visible=M;
handles.Generate.Visible=M;handles.Export.Visible=M;handles.FeedBack.Visible=M;
handles.PlotedIm.Visible=M;handles.Author.Visible=M;handles.Logo.Visible=M;
handles.LabelNWPOS.Visible=M;handles.ShowRaw.Visible=M;handles.Imager.Visible=false;

M=true;
handles.BlockListFrame.Visible=M;

M=true;
%disp(handles.MakeLiteFrame.Title);
handles.MakeLiteFrame.Visible=M;
axis(handles.Previewer,[0,128,0,128,0,128]);



% --- Executes on button press in Enable00.
function Enable00_Callback(hObject, eventdata, handles)
% hObject    handle to Enable00 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hObject.Value=true;
% Hint: get(hObject,'Value') returns toggle state of Enable00


% --- Executes during object creation, after setting all properties.
function Base00_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Base00 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on slider movement.
function Slider_Callback(hObject, eventdata, handles)
Offset=2+[0:22.5:1328]-hObject.Value;
handles.Base00.Position(1)=Offset(1);
handles.Base01.Position(1)=Offset(2);
handles.Base02.Position(1)=Offset(3);
handles.Base03.Position(1)=Offset(4);
handles.Base04.Position(1)=Offset(5);
handles.Base05.Position(1)=Offset(6);
handles.Base06.Position(1)=Offset(7);
handles.Base07.Position(1)=Offset(8);
handles.Base08.Position(1)=Offset(9);
handles.Base09.Position(1)=Offset(10);
handles.Base10.Position(1)=Offset(11);
handles.Base11.Position(1)=Offset(12);
handles.Base12.Position(1)=Offset(13);
handles.Base13.Position(1)=Offset(14);
handles.Base14.Position(1)=Offset(15);
handles.Base15.Position(1)=Offset(16);
handles.Base16.Position(1)=Offset(17);
handles.Base17.Position(1)=Offset(18);
handles.Base18.Position(1)=Offset(19);
handles.Base19.Position(1)=Offset(20);
handles.Base20.Position(1)=Offset(21);
handles.Base21.Position(1)=Offset(22);
handles.Base22.Position(1)=Offset(23);
handles.Base23.Position(1)=Offset(24);
handles.Base24.Position(1)=Offset(25);
handles.Base25.Position(1)=Offset(26);
handles.Base26.Position(1)=Offset(27);
handles.Base27.Position(1)=Offset(28);
handles.Base28.Position(1)=Offset(29);
handles.Base29.Position(1)=Offset(30);
handles.Base30.Position(1)=Offset(31);
handles.Base31.Position(1)=Offset(32);
handles.Base32.Position(1)=Offset(33);
handles.Base33.Position(1)=Offset(34);
handles.Base34.Position(1)=Offset(35);
handles.Base35.Position(1)=Offset(36);
handles.Base36.Position(1)=Offset(37);
handles.Base37.Position(1)=Offset(38);
handles.Base38.Position(1)=Offset(39);
handles.Base39.Position(1)=Offset(40);
handles.Base40.Position(1)=Offset(41);
handles.Base41.Position(1)=Offset(42);
handles.Base42.Position(1)=Offset(43);
handles.Base43.Position(1)=Offset(44);
handles.Base44.Position(1)=Offset(45);
handles.Base45.Position(1)=Offset(46);
handles.Base46.Position(1)=Offset(47);
handles.Base47.Position(1)=Offset(48);
handles.Base48.Position(1)=Offset(49);
handles.Base49.Position(1)=Offset(50);
handles.Base50.Position(1)=Offset(51);
handles.Base51.Position(1)=Offset(52);
handles.Base52.Position(1)=Offset(53);
handles.Base53.Position(1)=Offset(54);
handles.Base54.Position(1)=Offset(55);
handles.Base55.Position(1)=Offset(56);
handles.Base56.Position(1)=Offset(57);
handles.Base57.Position(1)=Offset(58);
handles.Base58.Position(1)=Offset(59);

function Slider_ButtonDownFcn(hObject, eventdata, handles)
Offset=2+[0:22.5:1328]-hObject.Value;
handles.Base00.Position(1)=Offset(1);
handles.Base01.Position(1)=Offset(2);
handles.Base02.Position(1)=Offset(3);
handles.Base03.Position(1)=Offset(4);
handles.Base04.Position(1)=Offset(5);
handles.Base05.Position(1)=Offset(6);
handles.Base06.Position(1)=Offset(7);
handles.Base07.Position(1)=Offset(8);
handles.Base08.Position(1)=Offset(9);
handles.Base09.Position(1)=Offset(10);
handles.Base10.Position(1)=Offset(11);
handles.Base11.Position(1)=Offset(12);
handles.Base12.Position(1)=Offset(13);
handles.Base13.Position(1)=Offset(14);
handles.Base14.Position(1)=Offset(15);
handles.Base15.Position(1)=Offset(16);
handles.Base16.Position(1)=Offset(17);
handles.Base17.Position(1)=Offset(18);
handles.Base18.Position(1)=Offset(19);
handles.Base19.Position(1)=Offset(20);
handles.Base20.Position(1)=Offset(21);
handles.Base21.Position(1)=Offset(22);
handles.Base22.Position(1)=Offset(23);
handles.Base23.Position(1)=Offset(24);
handles.Base24.Position(1)=Offset(25);
handles.Base25.Position(1)=Offset(26);
handles.Base26.Position(1)=Offset(27);
handles.Base27.Position(1)=Offset(28);
handles.Base28.Position(1)=Offset(29);
handles.Base29.Position(1)=Offset(30);
handles.Base30.Position(1)=Offset(31);
handles.Base31.Position(1)=Offset(32);
handles.Base32.Position(1)=Offset(33);
handles.Base33.Position(1)=Offset(34);
handles.Base34.Position(1)=Offset(35);
handles.Base35.Position(1)=Offset(36);
handles.Base36.Position(1)=Offset(37);
handles.Base37.Position(1)=Offset(38);
handles.Base38.Position(1)=Offset(39);
handles.Base39.Position(1)=Offset(40);
handles.Base40.Position(1)=Offset(41);
handles.Base41.Position(1)=Offset(42);
handles.Base42.Position(1)=Offset(43);
handles.Base43.Position(1)=Offset(44);
handles.Base44.Position(1)=Offset(45);
handles.Base45.Position(1)=Offset(46);
handles.Base46.Position(1)=Offset(47);
handles.Base47.Position(1)=Offset(48);
handles.Base48.Position(1)=Offset(49);
handles.Base49.Position(1)=Offset(50);
handles.Base50.Position(1)=Offset(51);
handles.Base51.Position(1)=Offset(52);
handles.Base52.Position(1)=Offset(53);
handles.Base53.Position(1)=Offset(54);
handles.Base54.Position(1)=Offset(55);
handles.Base55.Position(1)=Offset(56);
handles.Base56.Position(1)=Offset(57);
handles.Base57.Position(1)=Offset(58);
handles.Base58.Position(1)=Offset(59);
% hObject    handle to Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Enable01.
function Enable01_Callback(hObject, eventdata, handles)
% hObject    handle to Enable01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.MIndexCustom(1)=hObject.Value;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Enable01


% --- Executes on button press in is01Grass.
function is01Grass_Callback(hObject, eventdata, handles)
% hObject    handle to is01Grass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.CBL.BlockList(2)="grass[snowy=false]";
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of is01Grass


% --- Executes on button press in is01Slime.
function is01Slime_Callback(hObject, eventdata, handles)
% hObject    handle to is01Slime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.CBL.BlockList(2)="slime_block";
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of is01Slime


% --- Executes on button press in Enable02.
function Enable02_Callback(hObject, eventdata, handles)
% hObject    handle to Enable02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.MIndexCustom(2)=hObject.Value;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Enable02
% --- Executes on button press in is02SandStone.

function is02SandStone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(3)="smooth_sandstone";
guidata(hObject, handles);

function is02BirchPlanks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(3)="birch_planks";
guidata(hObject, handles);

function is02Glowstone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(3)="glowstone";
guidata(hObject, handles);

function is02Endstone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(3)="endstone";
guidata(hObject, handles);

function is02EndstoneBricks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(3)="endstone_bricks";
guidata(hObject, handles);

% --- Executes on button press in Enable03.
function Enable03_Callback(hObject, eventdata, handles)
handles.MIndexCustom(3)=hObject.Value;
guidata(hObject, handles);
% hObject    handle to Enable03 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Enable03


% --- Executes on button press in Enable04.
function Enable04_Callback(hObject, eventdata, handles)
handles.MIndexCustom(4)=hObject.Value;
guidata(hObject, handles);
% hObject    handle to Enable04 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Enable04


% --- Executes on button press in is04RedstoneBlock.
function is04RedstoneBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(5)="redstone_block";
guidata(hObject, handles);


% --- Executes on button press in is04Tnt.
function is04Tnt_Callback(hObject, eventdata, handles)
% hObject    handle to is04Tnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.CBL.BlockList(5)="tnt[unstable=false]";
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of is04Tnt


% --- Executes on button press in Enable05.
function Enable05_Callback(hObject, eventdata, handles)
handles.MIndexCustom(5)=hObject.Value;
guidata(hObject, handles);
% hObject    handle to Enable05 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Enable05


% --- Executes on button press in is05Ice.
function is05Ice_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(6)="ice";
guidata(hObject, handles);
% hObject    handle to is05Ice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of is05Ice


% --- Executes on button press in is05PackedIce.
function is05PackedIce_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(6)="packed_ice";
guidata(hObject, handles);


% --- Executes on button press in is05BlueIce.
function is05BlueIce_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(6)="blue_ice";
guidata(hObject, handles);


% --- Executes on button press in Enable06.
function Enable06_Callback(hObject, eventdata, handles)
handles.MIndexCustom(6)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is06IronBlock.
function is06IronBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(7)="iron_block";
guidata(hObject, handles);


% --- Executes on button press in is06Brewing.
function is06Brewing_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(7)="brewing_stand[has_bottle_0=false,has_bottle_1=false,has_bottle_2=false]";
guidata(hObject, handles);


% --- Executes on button press in is06IronPlate.
function is06IronPlate_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(7)="heavy_weighted_pressure_plate[power=0]";
handles.CBL.NeedGlass(7)=0;
guidata(hObject, handles);


% --- Executes on button press in is06IronTrapDoor.
function is06IronTrapDoor_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(7)="iron_trapdoor[facing=north,half=top,open=false,powered=false,waterlogged=false]";
guidata(hObject, handles);


% --- Executes on button press in is06Lantern.
function is06Lantern_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(7)="lantern[hanging=false]";
handles.CBL.NeedGlass(7)=true;
guidata(hObject, handles);


% --- Executes on button press in is06GrindStone.
function is06GrindStone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(7)="grindstone[face=floor,facing=north]";
guidata(hObject, handles);

% --- Executes on button press in Enable07.
function Enable07_Callback(hObject, eventdata, handles)
handles.MIndexCustom(7)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is07OakLeaves.
function is07OakLeaves_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(8)="oak_leaves[distance=7,persistent=true]";
guidata(hObject, handles);


% --- Executes on button press in is07SpruceLeaves.
function is07SpruceLeaves_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(8)="spruce_leaves[distance=7,persistent=true]";
guidata(hObject, handles);


% --- Executes on button press in is07BirchLeaves.
function is07BirchLeaves_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(8)="birch_leaves[distance=7,persistent=true]";
guidata(hObject, handles);


% --- Executes on button press in is07JungleLeaves.
function is07JungleLeaves_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(8)="jungle_leaves[distance=7,persistent=true]";
guidata(hObject, handles);


% --- Executes on button press in is07AcaciaLeaves.
function is07AcaciaLeaves_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(8)="acacia_leaves[distance=7,persistent=true]";
guidata(hObject, handles);


% --- Executes on button press in is07DarkOakLeaves.
function is07DarkOakLeaves_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(8)="dark_oak_leaves[distance=7,persistent=true]";
guidata(hObject, handles);


% --- Executes on button press in Enable08.
function Enable08_Callback(hObject, eventdata, handles)
handles.MIndexCustom(8)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is08SnowBlock.
function is08SnowBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(9)="snow_block";
guidata(hObject, handles);


% --- Executes on button press in is08Wool.
function is08Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(9)="white_wool";
guidata(hObject, handles);


% --- Executes on button press in is08Concrete.
function is08Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(9)="white_concrete";
guidata(hObject, handles);


% --- Executes on button press in is08StainedGlass.
function is08StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(9)="white_stained_glass";
guidata(hObject, handles);


% --- Executes on button press in Enable09.
function Enable09_Callback(hObject, eventdata, handles)
handles.MIndexCustom(9)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in Enable10.
function Enable10_Callback(hObject, eventdata, handles)
handles.MIndexCustom(10)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is10CoarseDirt.
function is10CoarseDirt_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(11)="coarse_dirt";
guidata(hObject, handles);


% --- Executes on button press in is10PolishedGranite.
function is10PolishedGranite_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(11)="polished_granite";
guidata(hObject, handles);


% --- Executes on button press in is10JunglePlanks.
function is10JunglePlanks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(11)="jungle_planks";
guidata(hObject, handles);


% --- Executes on button press in is10BrownMushroomBlock.
function is10BrownMushroomBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(11)="brown_mushroom_block[east=true,west=true,north=true,south=true,up=true,down=true]";
guidata(hObject, handles);


% --- Executes on button press in Enable11.
function Enable11_Callback(hObject, eventdata, handles)
handles.MIndexCustom(11)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is11Cobblestone.
function is11Cobblestone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(12)="cobblestone";
guidata(hObject, handles);


% --- Executes on button press in is11Stone.
function is11Stone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(12)="stone";
guidata(hObject, handles);


% --- Executes on button press in is11SmoothStone.
function is11SmoothStone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(12)="smooth_stone";
guidata(hObject, handles);


% --- Executes on button press in is11StoneBricks.
function is11StoneBricks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(12)="stone_bricks";
guidata(hObject, handles);


% --- Executes on button press in Enable12.
function Enable12_Callback(hObject, eventdata, handles)
handles.MIndexCustom(12)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in Enable13.
function Enable13_Callback(hObject, eventdata, handles)
handles.MIndexCustom(13)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is13OakPlanks.
function is13OakPlanks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(14)="oak_planks";
guidata(hObject, handles);


% --- Executes on button press in is13NoteBlock.
function is13NoteBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(14)="note_block[instrument=harp,note=0,powered=false]";
guidata(hObject, handles);


% --- Executes on button press in Enable14.
function Enable14_Callback(hObject, eventdata, handles)
handles.MIndexCustom(14)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is14PolishedDiorite.
function is14PolishedDiorite_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(15)="polished_diorite";
guidata(hObject, handles);


% --- Executes on button press in is14Quartz.
function is14Quartz_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(15)="quartz_block";
guidata(hObject, handles);


% --- Executes on button press in is14SeaLantern.
function is14SeaLantern_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(15)="sea_lantern";
guidata(hObject, handles);

function is14Target_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(15)="target[power=0]";
guidata(hObject, handles);

% --- Executes on button press in Enable15.
function Enable15_Callback(hObject, eventdata, handles)
handles.MIndexCustom(15)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is15AcaciaPlanks.
function is15AcaciaPlanks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="acacia_planks";
guidata(hObject, handles);


% --- Executes on button press in is15Wool.
function is15Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="orange_wool";
guidata(hObject, handles);


% --- Executes on button press in is15StainedGlass.
function is15StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="orange_stained_glass";
guidata(hObject, handles);


% --- Executes on button press in is15Concrete.
function is15Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="orange_concrete";
guidata(hObject, handles);


% --- Executes on button press in is15Pumpkin.
function is15Pumpkin_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="pumpkin";
guidata(hObject, handles);


% --- Executes on button press in is16Terracotta.
function is16Terracotta_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="terracotta";
guidata(hObject, handles);


% --- Executes on button press in is15RedSandStone.
function is15RedSandStone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="smooth_red_sandstone";
guidata(hObject, handles);


% --- Executes on button press in is15Honey.
function is15Honey_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="honey_block";
guidata(hObject, handles);


% --- Executes on button press in is15HoneyComb.
function is15HoneyComb_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(16)="honeycomb";
guidata(hObject, handles);


% --- Executes on button press in Enable16.
function Enable16_Callback(hObject, eventdata, handles)
handles.MIndexCustom(16)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is16Concrete.
function is16Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(17)="magneta_concrete";
guidata(hObject, handles);


% --- Executes on button press in is16StainedGlass.
function is16StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(17)="magneta_stained_glass";
guidata(hObject, handles);


% --- Executes on button press in is16Wool.
function is16Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(17)="magneta_wool";
guidata(hObject, handles);


% --- Executes on button press in is16PurpurBlock.
function is16PurpurBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(17)="purpur_block";
guidata(hObject, handles);

function Enable17_Callback(hObject, eventdata, handles)
handles.MIndexCustom(17)=hObject.Value;
guidata(hObject, handles);


% --- Executes on button press in is16Concrete.
function is17Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(18)="light_blue_concrete";
guidata(hObject, handles);


function is17StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(18)="light_blue_stained_glass";
guidata(hObject, handles);


function is17Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(18)="light_blue_wool";
guidata(hObject, handles);


function Enable18_Callback(hObject, eventdata, handles)
handles.MIndexCustom(18)=hObject.Value;
guidata(hObject, handles);


function is18Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(19)="yellow_concrete";
guidata(hObject, handles);


function is18StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(19)="yellow_stained_glass";
guidata(hObject, handles);


function is18Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(19)="yellow_wool";
guidata(hObject, handles);

function is18HayBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(19)="hay_block[aixs=y]";
guidata(hObject, handles);

function Enable19_Callback(hObject, eventdata, handles)
handles.MIndexCustom(19)=hObject.Value;
guidata(hObject, handles);


function is19Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(20)="lime_concrete";
guidata(hObject, handles);


function is19StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(20)="lime_stained_glass";
guidata(hObject, handles);


function is19Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(20)="lime_wool";
guidata(hObject, handles);


function Enable20_Callback(hObject, eventdata, handles)
handles.MIndexCustom(20)=hObject.Value;
guidata(hObject, handles);


function is20Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(21)="pink_concrete";
guidata(hObject, handles);


function is20StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(21)="pink_stained_glass";
guidata(hObject, handles);


function is20Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(21)="pink_wool";
guidata(hObject, handles);


function Enable21_Callback(hObject, eventdata, handles)
handles.MIndexCustom(21)=hObject.Value;
guidata(hObject, handles);


function is21Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(22)="gray_concrete";
guidata(hObject, handles);


function is21StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(22)="gray_stained_glass";
guidata(hObject, handles);


function is21Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(22)="gray_wool";
guidata(hObject, handles);

%
function Enable22_Callback(hObject, eventdata, handles)
handles.MIndexCustom(22)=hObject.Value;
guidata(hObject, handles);


function is22Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(23)="light_gray_concrete";
guidata(hObject, handles);


function is22StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(23)="light_gray_stained_glass";
guidata(hObject, handles);


function is22Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(23)="light_gray_wool";
guidata(hObject, handles);

%
function Enable23_Callback(hObject, eventdata, handles)
handles.MIndexCustom(23)=hObject.Value;
guidata(hObject, handles);


function is23Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(24)="cyan_concrete";
guidata(hObject, handles);


function is23StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(24)="cyan_stained_glass";
guidata(hObject, handles);


function is23Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(24)="cyan_wool";
guidata(hObject, handles);



function is23Prismarine_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(24)="prismarine";
guidata(hObject, handles);


function Enable24_Callback(hObject, eventdata, handles)
handles.MIndexCustom(24)=hObject.Value;
guidata(hObject, handles);


function is24Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(25)="purple_concrete";
guidata(hObject, handles);


function is24StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(25)="purple_stained_glass";
guidata(hObject, handles);


function is24Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(25)="purple_wool";
guidata(hObject, handles);

%
function Enable25_Callback(hObject, eventdata, handles)
handles.MIndexCustom(25)=hObject.Value;
guidata(hObject, handles);


function is25Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(26)="blue_concrete";
guidata(hObject, handles);


function is25StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(26)="blue_stained_glass";
guidata(hObject, handles);


function is25Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(26)="blue_wool";
guidata(hObject, handles);

%
function Enable26_Callback(hObject, eventdata, handles)
handles.MIndexCustom(26)=hObject.Value;
guidata(hObject, handles);


function is26Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(27)="brown_concrete";
guidata(hObject, handles);


function is26StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(27)="brown_stained_glass";
guidata(hObject, handles);


function is26Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(27)="brown_wool";
guidata(hObject, handles);


function is26DarkOakPlanks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(27)="dark_oak_planks";
guidata(hObject, handles);


function is26SoulSand_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(27)="soul_sand";
guidata(hObject, handles);


function is26SoulSoil_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(27)="soul_soil";
guidata(hObject, handles);

%
function Enable27_Callback(hObject, eventdata, handles)
handles.MIndexCustom(27)=hObject.Value;
guidata(hObject, handles);


function is27Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(28)="green_concrete";
guidata(hObject, handles);


function is27StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(28)="green_stained_glass";
guidata(hObject, handles);


function is27Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(28)="green_wool";
guidata(hObject, handles);


function is27DriedKelpBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(28)="dried_kelp_block";
guidata(hObject, handles);

%
function Enable28_Callback(hObject, eventdata, handles)
handles.MIndexCustom(28)=hObject.Value;
guidata(hObject, handles);


function is28Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(29)="red_concrete";
guidata(hObject, handles);


function is28StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(29)="red_stained_glass";
guidata(hObject, handles);


function is28Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(29)="red_wool";
guidata(hObject, handles);


function is28Bricks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(29)="bricks";
guidata(hObject, handles);


function is28RedMushroomBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(29)="red_mushroom_block[east=true,west=true,north=true,south=true,up=true,down=true]";
guidata(hObject, handles);


function is28NetherWartBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(29)="nether_wart_block";
guidata(hObject, handles);


function is28Shroomlight_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(29)="shroomlight";
guidata(hObject, handles);

%
function Enable29_Callback(hObject, eventdata, handles)
handles.MIndexCustom(29)=hObject.Value;
guidata(hObject, handles);


function is29Concrete_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(30)="black_concrete";
guidata(hObject, handles);


function is29StainedGlass_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(30)="black_stained_glass";
guidata(hObject, handles);


function is29Wool_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(30)="black_wool";
guidata(hObject, handles);


function is29Obsidian_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(30)="obsidian";
guidata(hObject, handles);


function is29CoalBlack_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(30)="coal_block";
guidata(hObject, handles);


function is29PolishedBasalt_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(30)="polished_basalt[axis=y]";
guidata(hObject, handles);


function is29PolishedBlackStone_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(30)="polished_blackstone";
guidata(hObject, handles);

%
function Enable30_Callback(hObject, eventdata, handles)
handles.MIndexCustom(30)=hObject.Value;
guidata(hObject, handles);


function is30GoldBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(31)="gold_block";
guidata(hObject, handles);


function is30GoldPlate_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(31)="light_weighted_pressure_plate[power=0]";
handles.CBL.NeedGlass(31)=0;
guidata(hObject, handles);

%
function Enable31_Callback(hObject, eventdata, handles)
handles.MIndexCustom(31)=hObject.Value;
guidata(hObject, handles);


function is31DiamondBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(32)="diamond_block";
guidata(hObject, handles);


function is31PrismarineBricks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(32)="prismarine_bricks";
guidata(hObject, handles);


function is31DarkPrismarine_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(32)="dark_prismarine";
guidata(hObject, handles);

%
function Enable32_Callback(hObject, eventdata, handles)
handles.MIndexCustom(32)=hObject.Value;
guidata(hObject, handles);


function is32LapisBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(33)="lapis_block";
guidata(hObject, handles);

%
function Enable33_Callback(hObject, eventdata, handles)
handles.MIndexCustom(33)=hObject.Value;
guidata(hObject, handles);


function is33EmeraldBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(34)="emerald_block";
guidata(hObject, handles);

%
function Enable34_Callback(hObject, eventdata, handles)
handles.MIndexCustom(34)=hObject.Value;
guidata(hObject, handles);


function is34Podzol_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(35)="podzol[snowy=false]";
guidata(hObject, handles);


function is34SprucePlanks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(35)="spruce_planks";
guidata(hObject, handles);


function is34CampFire_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(35)="campfire[facing=north,lit=true,signal_fire=false,waterlogged=false]";
guidata(hObject, handles);

%
function Enable35_Callback(hObject, eventdata, handles)
handles.MIndexCustom(35)=hObject.Value;
guidata(hObject, handles);


function is35Netherrack_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(36)="netherrack";
guidata(hObject, handles);


function is35NetherBricks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(36)="nether_bricks";
guidata(hObject, handles);


function is35MagmaBlock_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(36)="magma_block";
guidata(hObject, handles);

%
function Enable36_Callback(hObject, eventdata, handles)
handles.MIndexCustom(36)=hObject.Value;
guidata(hObject, handles);

%
function Enable37_Callback(hObject, eventdata, handles)
handles.MIndexCustom(37)=hObject.Value;
guidata(hObject, handles);

%
function Enable38_Callback(hObject, eventdata, handles)
handles.MIndexCustom(38)=hObject.Value;
guidata(hObject, handles);

%
function Enable39_Callback(hObject, eventdata, handles)
handles.MIndexCustom(39)=hObject.Value;
guidata(hObject, handles);

%
function Enable40_Callback(hObject, eventdata, handles)
handles.MIndexCustom(40)=hObject.Value;
guidata(hObject, handles);

%
function Enable41_Callback(hObject, eventdata, handles)
handles.MIndexCustom(41)=hObject.Value;
guidata(hObject, handles);

%
function Enable42_Callback(hObject, eventdata, handles)
handles.MIndexCustom(42)=hObject.Value;
guidata(hObject, handles);

%
function Enable43_Callback(hObject, eventdata, handles)
handles.MIndexCustom(43)=hObject.Value;
guidata(hObject, handles);

%
function Enable44_Callback(hObject, eventdata, handles)
handles.MIndexCustom(44)=hObject.Value;
guidata(hObject, handles);

%
function Enable45_Callback(hObject, eventdata, handles)
handles.MIndexCustom(45)=hObject.Value;
guidata(hObject, handles);

%
function Enable46_Callback(hObject, eventdata, handles)
handles.MIndexCustom(46)=hObject.Value;
guidata(hObject, handles);

%
function Enable47_Callback(hObject, eventdata, handles)
handles.MIndexCustom(47)=hObject.Value;
guidata(hObject, handles);

%
function Enable48_Callback(hObject, eventdata, handles)
handles.MIndexCustom(48)=hObject.Value;
guidata(hObject, handles);

%
function Enable49_Callback(hObject, eventdata, handles)
handles.MIndexCustom(49)=hObject.Value;
guidata(hObject, handles);

%
function Enable50_Callback(hObject, eventdata, handles)
handles.MIndexCustom(50)=hObject.Value;
guidata(hObject, handles);

%
function Enable51_Callback(hObject, eventdata, handles)
handles.MIndexCustom(51)=hObject.Value;
guidata(hObject, handles);

%
function Enable52_Callback(hObject, eventdata, handles)
handles.MIndexCustom(52)=hObject.Value;
guidata(hObject, handles);

%
function Enable53_Callback(hObject, eventdata, handles)
handles.MIndexCustom(53)=hObject.Value;
guidata(hObject, handles);


function is53CrimsonPlanks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(54)="crimson_planks";
guidata(hObject, handles);


function is53CrimsonStem_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(54)="stripped_crimson_stem[axis=y]";
guidata(hObject, handles);

%
function Enable54_Callback(hObject, eventdata, handles)
handles.MIndexCustom(54)=hObject.Value;
guidata(hObject, handles);


function is54CrimsonHyphae_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(55)="crimson_hyphae[axis=y]";
guidata(hObject, handles);


function is54StrippedCrimsonHyphae_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(55)="stripped_crimson_hyphae[axis=y]";
guidata(hObject, handles);

%
function Enable55_Callback(hObject, eventdata, handles)
handles.MIndexCustom(55)=hObject.Value;
guidata(hObject, handles);

%
function Enable56_Callback(hObject, eventdata, handles)
handles.MIndexCustom(56)=hObject.Value;
guidata(hObject, handles);


function is56WarpedPlanks_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(57)="warped_planks";
guidata(hObject, handles);


function is56WarpedStem_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(57)="stripped_warped_stem[axis=y]";
guidata(hObject, handles);

%
function Enable57_Callback(hObject, eventdata, handles)
handles.MIndexCustom(57)=hObject.Value;
guidata(hObject, handles);


function is57WarpedHyphae_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(58)="warped_hyphae[axis=y]";
guidata(hObject, handles);


function is57WarpedCrimsonHyphae_Callback(hObject, eventdata, handles)
handles.CBL.BlockList(58)="stripped_warped_hyphae[axis=y]";
guidata(hObject, handles);

%
function Enable58_Callback(hObject, eventdata, handles)
handles.MIndexCustom(58)=hObject.Value;
guidata(hObject, handles);


function CheckConflict_Callback(hObject,eventdata,handles)
if ~handles.ApplyCheck
    return;
end
%disp(handles.BlockListMode)
if ~ handles.ChangedByUser %如果是用户选择方块模式触发的，就不调用改变方块列表选项的回调函数
    f=@isBlockListCustom_Callback;  %获得pb1的函数句柄
    f(handles.isBlockListCustom,eventdata,handles);  %执行pb1的程序
end
% handles.isBlockListCreative.Value=false;
% handles.isBlockListSurvivalCheaper.Value=false;
% handles.isBlockListSurvivalBetter.Value=false;
% handles.isBlockListInstBreak.Value=false;
% handles.isBlockListGlowing.Value=false;
% handles.isBlockListCustom.Value=true;
% handles.BlockListMode='Custom';
% guidata(hObject, handles);

%检测光照和冰的冲突
Conflict=[1,0,0];
%首先，重置为不冲突的状态
handles.is05Ice.ForegroundColor=0.*Conflict;
handles.is02Glowstone.ForegroundColor=0.*Conflict;
handles.is06Lantern.ForegroundColor=0.*Conflict;
handles.is14SeaLantern.ForegroundColor=0.*Conflict;
handles.is28Shroomlight.ForegroundColor=0.*Conflict;
handles.is34CampFire.ForegroundColor=0.*Conflict;


if handles.MIndexCustom(5)&&handles.is05Ice.Value
    handles.is02Glowstone.ForegroundColor=(handles.MIndexCustom(2)&&handles.is02Glowstone.Value).*Conflict;
    handles.is06Lantern.ForegroundColor=(handles.MIndexCustom(6)&&handles.is06Lantern.Value).*Conflict;
    handles.is14SeaLantern.ForegroundColor=(handles.MIndexCustom(14)&&handles.is14SeaLantern.Value).*Conflict;
    handles.is28Shroomlight.ForegroundColor=(handles.MIndexCustom(28)&&handles.is28Shroomlight.Value).*Conflict;
    handles.is34CampFire.ForegroundColor=(handles.MIndexCustom(34)&&handles.is34CampFire.Value).*Conflict;
    handles.is35MagmaBlock.ForegroundColor=(handles.MIndexCustom(35)&&handles.is35MagmaBlock.Value).*Conflict;
    if (handles.MIndexCustom(2)&&handles.is02Glowstone.Value)||(handles.MIndexCustom(6)&&handles.is06Lantern.Value)||(handles.MIndexCustom(14)&&handles.is14SeaLantern.Value)||(handles.MIndexCustom(28)&&handles.is28Shroomlight.Value)||(handles.MIndexCustom(34)&&handles.is34CampFire.Value)||(handles.MIndexCustom(35)&&handles.is35MagmaBlock.Value)
        handles.is05Ice.ForegroundColor=Conflict;
    end
    
end



function LiteName_Callback(hObject, eventdata, handles)
% hObject    handle to LiteName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LiteName as text
%        str2double(get(hObject,'String')) returns contents of LiteName as a double


% --- Executes during object creation, after setting all properties.
function LiteName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LiteName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LiteAuthor_Callback(hObject, eventdata, handles)
% hObject    handle to LiteAuthor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LiteAuthor as text
%        str2double(get(hObject,'String')) returns contents of LiteAuthor as a double


% --- Executes during object creation, after setting all properties.
function LiteAuthor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LiteAuthor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LiteRegionName_Callback(hObject, eventdata, handles)
% hObject    handle to LiteRegionName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LiteRegionName as text
%        str2double(get(hObject,'String')) returns contents of LiteRegionName as a double


% --- Executes during object creation, after setting all properties.
function LiteRegionName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LiteRegionName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in doBuild.
function doBuild_Callback(hObject, eventdata, handles)
hObject.String="Loading";
if ~handles.isGenerated
    handles.Displayer2.String="你还没有生成三维地图画";
    handles.hasBuild=false;
    hObject.String="构建三维结构";
    handles.ShowSize.String="投影尺寸";
    handles.ShowBlockCount.String="方块数量";
    guidata(hObject,handles);
    return;
end
[handles.Build,handles.BlockCount,Size] = Build3D(handles.Base,handles.Height,handles.WaterList,handles.CBL.NeedGlass);

handles.ShowSize.String=strcat("投影尺寸:x=",num2str(Size(1)),",y=",num2str(Size(2)),",z=",num2str(Size(3)));
handles.ShowBlockCount.String=strcat("方块数量:",num2str(handles.BlockCount));
handles.Displayer2.String="成功构建三维结构";
handles.hasBuild=true;
hObject.String="构建三维结构";
guidata(hObject,handles);



% --- Executes on button press in ShowPreview.
function ShowPreview_Callback(hObject, eventdata, handles)
hObject.String="Loading";
if ~handles.hasBuild
    handles.Displayer2.String="你还没有构建三维结构";
    hObject.String="预览三维结构";
    return;
end
[PosList,ColorList] = Build2Scatter(handles.Build,handles.AdjedPic);
scatter3(handles.Previewer,PosList(:,1),PosList(:,2),PosList(:,3),10,ColorList,'.');
hObject.String="预览三维结构";



% --- Executes on button press in SaveAsLitematic.
function SaveAsLitematic_Callback(hObject, eventdata, handles)
%FileData including Author Name RegionName
hObject.String="Loading";
if ~handles.hasBuild
    handles.Displayer2.String="你还没有构建三维结构";
    hObject.String="保存为投影";
    return;
end
[File,Path]=uiputfile('*.litematic');
if(~File)
    hObject.String="保存为投影";
    return;
end
FileData=struct('Name',handles.LiteName.String,'Author',handles.LiteAuthor.String,'RegionName',handles.LiteRegionName.String);

BlockList=ApplyBlockList(handles.BlockListMode,handles.CBL);
%disp(BlockList)
Bytes = WriteLite(strcat(Path,File),FileData,BlockList,handles.Build);

handles.Displayer2.String=strcat("成功输出投影，共",num2str(Bytes),"个字节");
hObject.String="保存为投影";




% --- Executes on button press in Displayer2.
function Displayer2_Callback(hObject, eventdata, handles)
hObject.String="";
