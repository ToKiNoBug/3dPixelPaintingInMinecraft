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

% Last Modified by GUIDE v2.5 23-Feb-2021 10:58:21

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
% image(rand(128,128,3));
axis off


% --- Executes just before Test0 is made visible.
function Test0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Test0 (see VARARGIN)
handles.FeedBack.String="Loading...";
[handles.RGB,handles.HSV,handles.Lab,handles.CMY,handles.XYZ,handles.Map]=GetColors();
handles.ColorMode='Lab';
handles.isSurvival=true;
handles.is16=true;
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
% Update handles structure
guidata(hObject, handles);



% UIWAIT makes Test0 wait for user response (see UIRESUME)
% uiwait(handles.Test);


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
    image(handles.RawPic);
    axis off
    
    handles.isImported=true;
    handles.isAdjusted=false;
    handles.isGenerated=false;
    handles.FeedBack.String="成功导入图片";
    
end
hObject.String="选择图片";
guidata(hObject, handles);

% --- Executes on button press in isBlockListSurvivalCheaper.
function isBlockListSurvivalCheaper_Callback(hObject, eventdata, handles)
% hObject    handle to isBlockListSurvivalCheaper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isBlockListCreative.Value=false;
handles.isBlockListSurvivalCheaper.Value=true;
handles.isBlockListSurvivalBetter.Value=false;
handles.isBlockListInstBreak.Value=false;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='Survival_Cheaper';
guidata(hObject, handles);


% Hint: get(hObject,'Value') returns toggle state of isBlockListSurvivalCheaper


% --- Executes on button press in isBlockListCreative.
function isBlockListCreative_Callback(hObject, eventdata, handles)
% hObject    handle to isBlockListCreative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isBlockListCreative
handles.isBlockListCreative.Value=true;
handles.isBlockListSurvivalCheaper.Value=false;
handles.isBlockListSurvivalBetter.Value=false;
handles.isBlockListInstBreak.Value=false;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='Creative';
guidata(hObject, handles);


% --- Executes on button press in isBlockListSurvivalBetter.
function isBlockListSurvivalBetter_Callback(hObject, eventdata, handles)
% hObject    handle to isBlockListSurvivalBetter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isBlockListCreative.Value=false;
handles.isBlockListSurvivalCheaper.Value=false;
handles.isBlockListSurvivalBetter.Value=true;
handles.isBlockListInstBreak.Value=false;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='Survival_Better';
% Hint: get(hObject,'Value') returns toggle state of isBlockListSurvivalBetter
guidata(hObject, handles);


% --- Executes on button press in isBlockListInstBreak.
function isBlockListInstBreak_Callback(hObject, eventdata, handles)
% hObject    handle to isBlockListInstBreak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isBlockListCreative.Value=false;
handles.isBlockListSurvivalCheaper.Value=false;
handles.isBlockListSurvivalBetter.Value=false;
handles.isBlockListInstBreak.Value=true;
handles.isBlockListCustom.Value=false;
handles.BlockListMode='InstBreak';
% Hint: get(hObject,'Value') returns toggle state of isBlockListInstBreak
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
function isBlockListCustom_Callback(hObject, eventdata, handles)
% hObject    handle to isBlockListCustom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.isBlockListCreative.Value=false;
% handles.isBlockListSurvivalCheaper.Value=false;
% handles.isBlockListSurvivalBetter.Value=false;
% handles.isBlockListInstBreak.Value=false;
handles.isBlockListCustom.Value=false;
% Hint: get(hObject,'Value') returns toggle state of isBlockListCustom
guidata(hObject, handles);

% --- Executes on button press in isColorSpaceHSV.
function isColorSpaceHSV_Callback(hObject, eventdata, handles)
% hObject    handle to isColorSpaceHSV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isColorSpaceRGB.Value=false;
handles.isColorSpaceHSV.Value=true;
handles.isColorSpaceLab.Value=false;
handles.isColorSpaceCMY.Value=false;
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
handles.isColorSpaceCMY.Value=false;
handles.isColorSpaceXYZ.Value=false;
handles.ColorMode='RGB';
% Hint: get(hObject,'Value') returns toggle state of isColorSpaceRGB
guidata(hObject, handles);

% --- Executes on button press in isColorSpaceCMY.
function isColorSpaceCMY_Callback(hObject, eventdata, handles)
% hObject    handle to isColorSpaceCMY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isColorSpaceRGB.Value=false;
handles.isColorSpaceHSV.Value=false;
handles.isColorSpaceLab.Value=false;
handles.isColorSpaceCMY.Value=true;
handles.isColorSpaceXYZ.Value=false;
handles.ColorMode='CMY';
% Hint: get(hObject,'Value') returns toggle state of isColorSpaceCMY
guidata(hObject, handles);

% --- Executes on button press in isColorSpaceXYZ.
function isColorSpaceXYZ_Callback(hObject, eventdata, handles)
% hObject    handle to isColorSpaceXYZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.isColorSpaceRGB.Value=false;
handles.isColorSpaceHSV.Value=false;
handles.isColorSpaceLab.Value=false;
handles.isColorSpaceCMY.Value=false;
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
handles.isColorSpaceCMY.Value=false;
handles.isColorSpaceXYZ.Value=false;
handles.ColorMode='Lab';
% Hint: get(hObject,'Value') returns toggle state of isColorSpaceLab
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Test_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Test (see GCBO)
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

handles.PicMap=EzPicAdj(handles.RawPic,handles.ColorMode,handles.isSurvival,handles.is16,handles.RGB,handles.HSV,handles.Map,handles.XYZ,handles.Lab,handles.CMY);

handles.AdjedPic=ShowPicMap(handles.PicMap,handles.RGB);
image(handles.AdjedPic);
axis off
unFits=mean(abs(handles.AdjedPic-handles.RawPic),'all');
handles.unFitness.String=['与原图的差异：',num2str(unFits*100),'%'];
handles.isAdjusted=true;
handles.isGenerated=false;
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
image(handles.RawPic);
hObject.String="显示原图";
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
image(handles.AdjedPic);
hObject.String="显示调整后图像";
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
    guidata(hObject, handles);
    return;
end
if ~handles.isSurvival
    handles.FeedBack.String="Creative模式的地图画使用了第四个阴影，不可能生成";
    hObject.String="生成立体地图画";
    handles.isGenerated=false;
    guidata(hObject, handles);
    return;
end
if(~handles.isAdjusted)
    handles.FeedBack.String="你还没有调整颜色";
    hObject.String="生成立体地图画";
    handles.isGenerated=false;
    guidata(hObject, handles);
    return;
end

if(size(handles.PicMap,1)~=128||size(handles.PicMap,2)~=128)
    handles.FeedBack.String="图片尺寸不是128×128，暂不支持";
    hObject.String="生成立体地图画";
    handles.isGenerated=false;
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
    guidata(hObject, handles);
    return;
end
handles.NWPos(1)=round(str2double(handles.NWX.String));
handles.NWPos(2)=round(str2double(handles.NWY.String));
handles.NWPos(3)=round(str2double(handles.NWZ.String));
if(handles.NWPos(2)<0)
    handles.FeedBack.String="你输入的Y坐标小于0，它最好不小于5";
    hObject.String="生成立体地图画";
    handles.NWY.String="y";
    handles.isGenerated=false;
    guidata(hObject, handles);
    return;
end
handles.FeedBack.String="生成中……请稍候";
handles.Base=floor(handles.PicMap)/4;
% disp(handles.Base(handles.Base>58));
Depth=mod(handles.PicMap,4);
% disp(handles.Depth);
[handles.Height,handles.WaterList]=MakeHeight(handles.Base,Depth);
% disp(handles.Height);
handles.isGenerated=true;
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
Count = MapExport(handles.Base,handles.Height,handles.WaterList,handles.NWPos,strcat(Path,File),handles.BlockListMode,0);
handles.FeedBack.String=strcat("导出成功：共",num2str(Count),"条命令");
hObject.String="导出mcfunction";

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over FeedBack.
function FeedBack_Callback(hObject, eventdata, handles)
% hObject    handle to FeedBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hObject.String="";

guidata(hObject, handles);
