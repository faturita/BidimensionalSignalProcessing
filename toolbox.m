function varargout = toolbox(varargin)
% TOOLBOX MATLAB code for toolbox.fig
%      TOOLBOX, by itself, creates a new TOOLBOX or raises the existing
%      singleton*.
%
%      H = TOOLBOX returns the handle to a new TOOLBOX or the handle to
%      the existing singleton*.
%
%      TOOLBOX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOOLBOX.M with the given input arguments.
%
%      TOOLBOX('Property','Value',...) creates a new TOOLBOX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before toolbox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to toolbox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help toolbox

% Last Modified by GUIDE v2.5 27-Feb-2015 10:59:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @toolbox_OpeningFcn, ...
                   'gui_OutputFcn',  @toolbox_OutputFcn, ...
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


% --- Executes just before toolbox is made visible.
function toolbox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to toolbox (see VARARGIN)

% Choose default command line output for toolbox
handles.output = hObject;

iptsetpref('ImshowBorder','tight');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes toolbox wait for user response (see UIRESUME)
% uiwait(handles.figure1);

guidata(handles.figure1, handles);

% --- Outputs from this function are returned to the command line.
function varargout = toolbox_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Filepath_Callback(hObject, eventdata, handles)
% hObject    handle to Filepath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Filepath as text
%        str2double(get(hObject,'String')) returns contents of Filepath as a double


% --- Executes during object creation, after setting all properties.
function Filepath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Filepath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Open.
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Filepath = get(handles.Filepath,'String');

DIRECTORY = 'C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\';
DIRECTORY = 'C:\\Users\\User\\Downloads\\adf\\';

Filepath = uigetfile(sprintf('%s\\*.*', DIRECTORY));
Filepath = sprintf('%s%s',DIRECTORY,Filepath);

if (get(handles.Raw,'Value') == 1)
    height = str2num(get(handles.height,'String'));
    width =  str2num(get(handles.height,'String'));
    
    I = imreadraw(width,height,Filepath);
else
    I = imread(Filepath);
end

if (size(I,3)>1)
    % Color image
    I = I(:,:,1);
end

showImage( I, hObject, handles);


% --- Executes on button press in Whitecircle.
function Whitecircle_Callback(hObject, eventdata, handles)
% hObject    handle to Whitecircle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

I = whitecircle;
showImage( I, hObject, handles);


% --- Executes on button press in Whitesquare.
function Whitesquare_Callback(hObject, eventdata, handles)
% hObject    handle to Whitesquare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = whitesquare();
showImage( I, hObject, handles);

% --- Executes on button press in Greyscale.
function Greyscale_Callback(hObject, eventdata, handles)
% hObject    handle to Greyscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = greyscale();
showImage( I, hObject, handles);

% --- Executes on button press in Colorful.
function Colorful_Callback(hObject, eventdata, handles)
% hObject    handle to Colorful (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = colorful();
showImage( I, hObject, handles);


function Scalar_Callback(hObject, eventdata, handles)
% hObject    handle to Scalar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Scalar as text
%        str2double(get(hObject,'String')) returns contents of Scalar as a double


% --- Executes during object creation, after setting all properties.
function Scalar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Scalar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ScaleButton.
function ScaleButton_Callback(hObject, eventdata, handles)
% hObject    handle to ScaleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Scalar = str2num(get(handles.Scalar,'String'));

I = getImage(hObject,handles);

I = I * Scalar;

% Compresion
% Ojo si es color.
I = dynamicrangecompression(I);

showImage( I, hObject, handles);    



function ImagePos_Callback(hObject, eventdata, handles)
% hObject    handle to ImagePos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImagePos as text
%        str2double(get(hObject,'String')) returns contents of ImagePos as a double


% --- Executes during object creation, after setting all properties.
function ImagePos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImagePos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Raw.
function Raw_Callback(hObject, eventdata, handles)
% hObject    handle to Raw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Raw



function height_Callback(hObject, eventdata, handles)
% hObject    handle to height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of height as text
%        str2double(get(hObject,'String')) returns contents of height as a double


% --- Executes during object creation, after setting all properties.
function height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function width_Callback(hObject, eventdata, handles)
% hObject    handle to width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of width as text
%        str2double(get(hObject,'String')) returns contents of width as a double


% --- Executes during object creation, after setting all properties.
function width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Add.
function Add_Callback(hObject, eventdata, handles)
% hObject    handle to Add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

I1 = getImagePos('1',hObject,handles);
I2 = getImagePos('2',hObject,handles);

I3 = I1 + I2;

showImagePos( 1,'3',I3, hObject, handles);


% --- Executes on button press in Difference.
function Difference_Callback(hObject, eventdata, handles)
% hObject    handle to Difference (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I1 = getImagePos('1',hObject,handles);
I2 = getImagePos('2',hObject,handles);

I3 = I1 - I2;

showImagePos( 1,'3',I3, hObject, handles);

% --- Executes on button press in Multiply.
function Multiply_Callback(hObject, eventdata, handles)
% hObject    handle to Multiply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I1 = getImagePos('1',hObject,handles);
I2 = getImagePos('2',hObject,handles);

I3 = I1 .* I2;

showImagePos( 1,'3',I3, hObject, handles);


% --- Executes on button press in Invert.
function Invert_Callback(hObject, eventdata, handles)
% hObject    handle to Invert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

I = double(I);

I = -I + ones(size(I,1),size(I,2) )*255;

I = uint8(I);

showImage( I, hObject, handles);    


% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);
Signal = I(:);
 
figure
hist( I(:),0:255);



function Threshold_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Threshold as text
%        str2double(get(hObject,'String')) returns contents of Threshold as a double


% --- Executes during object creation, after setting all properties.
function Threshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Apply.
function Apply_Callback(hObject, eventdata, handles)
% hObject    handle to Apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);
Threshold = str2num(get(handles.Threshold,'String'));

I(find( I > Threshold)) = 255;
I(find( I <= Threshold)) = 0;

showImage( I, hObject, handles);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);
filepath=get(handles.Filepathtosave,'String');

size(I)
imwrite(I, filepath);



function Filepathtosave_Callback(hObject, eventdata, handles)
% hObject    handle to Filepathtosave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Filepathtosave as text
%        str2double(get(hObject,'String')) returns contents of Filepathtosave as a double


% --- Executes during object creation, after setting all properties.
function Filepathtosave_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Filepathtosave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pixels_Callback(hObject, eventdata, handles)
% hObject    handle to Pixels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pixels as text
%        str2double(get(hObject,'String')) returns contents of Pixels as a double


% --- Executes during object creation, after setting all properties.
function Pixels_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pixels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Avg3_Callback(hObject, eventdata, handles)
% hObject    handle to Avg3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Avg3 as text
%        str2double(get(hObject,'String')) returns contents of Avg3 as a double


% --- Executes during object creation, after setting all properties.
function Avg3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Avg3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Avg2_Callback(hObject, eventdata, handles)
% hObject    handle to Avg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Avg2 as text
%        str2double(get(hObject,'String')) returns contents of Avg2 as a double


% --- Executes during object creation, after setting all properties.
function Avg2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Avg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Avg1_Callback(hObject, eventdata, handles)
% hObject    handle to Avg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Avg1 as text
%        str2double(get(hObject,'String')) returns contents of Avg1 as a double


% --- Executes during object creation, after setting all properties.
function Avg1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Avg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Red_Callback(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Red as text
%        str2double(get(hObject,'String')) returns contents of Red as a double


% --- Executes during object creation, after setting all properties.
function Red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Green_Callback(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Green as text
%        str2double(get(hObject,'String')) returns contents of Green as a double


% --- Executes during object creation, after setting all properties.
function Green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Blue_Callback(hObject, eventdata, handles)
% hObject    handle to Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Blue as text
%        str2double(get(hObject,'String')) returns contents of Blue as a double


% --- Executes during object creation, after setting all properties.
function Blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Hue_Callback(hObject, eventdata, handles)
% hObject    handle to Hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hue as text
%        str2double(get(hObject,'String')) returns contents of Hue as a double


% --- Executes during object creation, after setting all properties.
function Hue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Saturation_Callback(hObject, eventdata, handles)
% hObject    handle to Saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Saturation as text
%        str2double(get(hObject,'String')) returns contents of Saturation as a double


% --- Executes during object creation, after setting all properties.
function Saturation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Saturation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Value_Callback(hObject, eventdata, handles)
% hObject    handle to Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Value as text
%        str2double(get(hObject,'String')) returns contents of Value as a double


% --- Executes during object creation, after setting all properties.
function Value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X_Callback(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X as text
%        str2double(get(hObject,'String')) returns contents of X as a double


% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Callback(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y as text
%        str2double(get(hObject,'String')) returns contents of Y as a double


% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RegionRadio_Callback(hObject, eventdata, handles)
% hObject    handle to RegionRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RegionRadio as text
%        str2double(get(hObject,'String')) returns contents of RegionRadio as a double


% --- Executes during object creation, after setting all properties.
function RegionRadio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RegionRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

texture= str2num(get(handles.Texture,'String'));
I = greybox(texture);
showImage( I, hObject, handles);


% --- Executes on button press in gaussian.
function gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

x1 = rand(size(I,1)*size(I,2),1);
x2 = rand(size(I,1)*size(I,2),1);

sigma= str2num(get(handles.Sigma,'String'));
mu=str2num(get(handles.Mu,'String'));

v=1;
for i=1:size(I,1)
    for j=1:size(I,2)
        z = ( sqrt(-2*log(x1(v))) * cos(2*pi*x2(v))) * sigma + mu;
        I(i,j) = I(i,j) + z;
        v=v+1;
    end
end


showImage( I, hObject, handles);

% --- Executes on button press in rayleigh.
function rayleigh_Callback(hObject, eventdata, handles)
% hObject    handle to rayleigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

x1 = rand(size(I,1)*size(I,2),1);

psi = str2num(get(handles.Psi,'String'));

v=1;
for i=1:size(I,1)
    for j=1:size(I,2)
        z = psi * sqrt( -2 * log(1-x1(v)));
        I(i,j) = I(i,j) * z;
        v=v+1;
    end
end


showImage( I, hObject, handles);

% --- Executes on button press in exponential.
function exponential_Callback(hObject, eventdata, handles)
% hObject    handle to exponential (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

x1 = rand(size(I,1)*size(I,2),1);

lambda = str2num(get(handles.Lambda,'String'));

v=1;
for i=1:size(I,1)
    for j=1:size(I,2)
        z = -(1/lambda) * log(x1(v));
        I(i,j) = I(i,j) * z;
        v=v+1;
    end
end

showImage( I, hObject, handles);


% --- Executes on button press in saltandpepper.
function saltandpepper_Callback(hObject, eventdata, handles)
% hObject    handle to saltandpepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

d = str2num(get(handles.NoiseDensity,'String'));

p0=0.1;

p1=0.9;

for i=1:size(I,1)
    for j=1:size(I,2)
        if ( rand < d )
            if ( rand <= p0)
                I(i,j) = 0;
            elseif (rand >= p1)
                I(i,j) = 255;
            end
        end
    end
end

showImage( I, hObject, handles);



function NoiseDensity_Callback(hObject, eventdata, handles)
% hObject    handle to NoiseDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NoiseDensity as text
%        str2double(get(hObject,'String')) returns contents of NoiseDensity as a double


% --- Executes during object creation, after setting all properties.
function NoiseDensity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NoiseDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in histogrameq.
function histogrameq_Callback(hObject, eventdata, handles)
% hObject    handle to histogrameq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

Pj=hist( I(:),0:255);

for k=0:255
    T(k+1) = sum( Pj(1:k+1) ) / (size(I,2)*size(I,1));
end
    
for i=1:size(I,1)
    for j=1:size(I,2)
        I(i,j) = uint8((( T(I(i,j)+1) - min(T) )*255.0)/ (1-min(T))) ;
    end
end

showImage( I, hObject, handles);

% --- Executes during object creation, after setting all properties.
function pushbutton14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function Psi_Callback(hObject, eventdata, handles)
% hObject    handle to Psi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Psi as text
%        str2double(get(hObject,'String')) returns contents of Psi as a double


% --- Executes during object creation, after setting all properties.
function Psi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Psi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lambda_Callback(hObject, eventdata, handles)
% hObject    handle to Lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lambda as text
%        str2double(get(hObject,'String')) returns contents of Lambda as a double


% --- Executes during object creation, after setting all properties.
function Lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mu_Callback(hObject, eventdata, handles)
% hObject    handle to Mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mu as text
%        str2double(get(hObject,'String')) returns contents of Mu as a double


% --- Executes during object creation, after setting all properties.
function Mu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sigma_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sigma as text
%        str2double(get(hObject,'String')) returns contents of Sigma as a double


% --- Executes during object creation, after setting all properties.
function Sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in contrast.
function contrast_Callback(hObject, eventdata, handles)
% hObject    handle to contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

ContrastRange1 = str2num(get(handles.ContrastRange1,'String'));
ContrastRange2 = str2num(get(handles.ContrastRange2,'String'));

for i=1:size(I,1)
    for j=1:size(I,2)
        if ( I(i,j) < ContrastRange1 )
            I(i,j) = I(i,j)*1/2;
        elseif (I(i,j) > ContrastRange2 )
            I(i,j) = I(i,j)*2;
        end
    end
end

showImage( I, hObject, handles);



function ContrastRange1_Callback(hObject, eventdata, handles)
% hObject    handle to ContrastRange1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ContrastRange1 as text
%        str2double(get(hObject,'String')) returns contents of ContrastRange1 as a double


% --- Executes during object creation, after setting all properties.
function ContrastRange1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ContrastRange1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ContrastRange2_Callback(hObject, eventdata, handles)
% hObject    handle to ContrastRange2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ContrastRange2 as text
%        str2double(get(hObject,'String')) returns contents of ContrastRange2 as a double


% --- Executes during object creation, after setting all properties.
function ContrastRange2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ContrastRange2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Texture_Callback(hObject, eventdata, handles)
% hObject    handle to Texture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Texture as text
%        str2double(get(hObject,'String')) returns contents of Texture as a double


% --- Executes during object creation, after setting all properties.
function Texture_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Texture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mask_Callback(hObject, eventdata, handles)
% hObject    handle to Mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mask as text
%        str2double(get(hObject,'String')) returns contents of Mask as a double


% --- Executes during object creation, after setting all properties.
function Mask_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gaussiansmoothing.
function gaussiansmoothing_Callback(hObject, eventdata, handles)
% hObject    handle to gaussiansmoothing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s = str2num(get(handles.Mask,'String'));

sigma=s/3;

adjusted = median(1:s);

for i=1:s
    for j=1:s
        Kernel(i,j) = (1.0/(2 * pi * sigma^2)) * exp(- (((i-adjusted)^2 + (j-adjusted)^2)/(sigma^2) ));
    end
end


for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-adjusted+1:i+adjusted-1,j-adjusted+1:j+adjusted-1);
        I(i,j) = dot(Kernel(:),Patch(:)) / sum(sum(abs(Kernel(:))));
    end
end

showImage( I, hObject, handles);

% --- Executes on button press in meansmoothing.
function meansmoothing_Callback(hObject, eventdata, handles)
% hObject    handle to meansmoothing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s = str2num(get(handles.Mask,'String'));

adjusted = median(1:s);

for i=1:size(I,1)
    for j=1:size(I,2)
        K = zeropaddedimage(I,i-adjusted+1:i+adjusted-1,j-adjusted+1:j+adjusted-1);
        I(i,j) = mean(mean(K));
    end
end

showImage( I, hObject, handles);

% --- Executes on button press in mediansmoothing.
function mediansmoothing_Callback(hObject, eventdata, handles)
% hObject    handle to mediansmoothing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s = str2num(get(handles.Mask,'String'));

adjusted = median(1:s);


for i=1:size(I,1)
    for j=1:size(I,2)
        K = zeropaddedimage(I,i-adjusted+1:i+adjusted-1,j-adjusted+1:j+adjusted-1);
        I(i,j) = median(K(:));
    end
end

showImage( I, hObject, handles);

% --- Executes on button press in highpasssmoothing.
function highpasssmoothing_Callback(hObject, eventdata, handles)
% hObject    handle to highpasssmoothing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s = str2num(get(handles.Mask,'String'));

adjusted = median(1:s);

Kernel = [-1 -1 -1; -1 (s^2-1) -1; -1 -1 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        I(i,j) = dot(Kernel(:),Patch(:)) / sum(abs(Kernel(:)));
    end
end

showImage( I, hObject, handles);


% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [1 1 1; 0 0 0; -1 -1 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIy(i,j) = dot(Kernel(:),Patch(:));
    end
end

Kernel = [1 0 -1; 1 0 -1; 1 0 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIx(i,j) = dot(Kernel(:),Patch(:));
    end
end


for i=1:size(I,1)
    for j=1:size(I,2)
        AI(i,j) = sqrt( dIx(i,j)^2 + dIy(i,j)^2 );
    end
end

showImage( AI, hObject, handles);


% --- Executes on button press in roberts.
function roberts_Callback(hObject, eventdata, handles)
% hObject    handle to roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=2;

Kernel = [1 0;  0 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i:i+1,j:j+1);
        dIx(i,j) = dot(Kernel(:),Patch(:));
    end
end


Kernel = [0 1;  -1 0];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i:i+1,j:j+1);
        dIy(i,j) = dot(Kernel(:),Patch(:));
    end
end


for i=1:size(I,1)
    for j=1:size(I,2)
        AI(i,j) = sqrt( dIx(i,j)^2 + dIy(i,j)^2 );
    end
end

showImage( AI, hObject, handles);


% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [1 0 -1; 2 0 -2; 1 0 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIx(i,j) = dot(Kernel(:),Patch(:));
    end
end


Kernel = [1 2 1; 0 0 0; -1 -2 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIy(i,j) = dot(Kernel(:),Patch(:));
    end
end


for i=1:size(I,1)
    for j=1:size(I,2)
        AI(i,j) = sqrt( dIx(i,j)^2 + dIy(i,j)^2 );
    end
end

showImage( AI, hObject, handles);


% --- Executes on button press in Locked.
function Locked_Callback(hObject, eventdata, handles)
% hObject    handle to Locked (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Locked


% --- Executes on button press in directional.
function directional_Callback(hObject, eventdata, handles)
% hObject    handle to directional (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [1 1 1; 1 -2 1; -1 -1 -1];

AI = directional_mask( I, Kernel );

showImage( AI, hObject, handles);

% --- Executes on button press in kirsch.
function kirsch_Callback(hObject, eventdata, handles)
% hObject    handle to kirsch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [5 5 5; -3 0 -3; -3 -3 -3];

AI = directional_mask( I, Kernel );

showImage( AI, hObject, handles);

% --- Executes on button press in directionalprewitt.
function directionalprewitt_Callback(hObject, eventdata, handles)
% hObject    handle to directionalprewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [1 1 1; 0 0 0; -1 -1 -1];

AI = directional_mask( I, Kernel );

showImage( AI, hObject, handles);

% --- Executes on button press in directionalsobel.
function directionalsobel_Callback(hObject, eventdata, handles)
% hObject    handle to directionalsobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [1 2 1; 0 0 0; -1 -2 -1];

AI = directional_mask( I, Kernel );

showImage( AI, hObject, handles);


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [0 -1 0; -1 4 -1; 0 -1 0];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        AI(i,j) = dot(Kernel(:),Patch(:));
    end
end


showImage( AI, hObject, handles);


% --- Executes on button press in laplacianroots.
function laplacianroots_Callback(hObject, eventdata, handles)
% hObject    handle to laplacianroots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [0 -1 0; -1 4 -1; 0 -1 0];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        LI(i,j) = dot(Kernel(:),Patch(:));
    end
end

slope=30;

for i=1:size(LI,1)
    for j=1:size(LI,2)
        Patch = zeropaddedimage(LI,i:i+2,j:j+2);
        if (Patch(1,1)*Patch(1,1+1)<0) && abs(Patch(1,1)-Patch(1,1+1))>slope
            LI2(i,j)=255;
        elseif (Patch(1,1)*Patch(1+1,1)<0) && abs(Patch(1,1)-Patch(1+1,1))>slope
            LI2(i,j)=255;
        elseif (Patch(1,1)*Patch(1,1+2)<0 && abs(Patch(1,1+1))<=0) && abs(Patch(1,1)-Patch(1,1+2))>slope
            LI2(i,j)=255;
        elseif (Patch(1,1)*Patch(1+2,1)<0 && abs(Patch(1+1,1))<=0) && abs(Patch(1,1)-Patch(1+2,1))>slope
            LI2(i,j)=255;
        end
    end
end


showImage( LI2, hObject, handles);


% --- Executes on button press in isotropic.
function isotropic_Callback(hObject, eventdata, handles)
% hObject    handle to isotropic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in anisotropic.
function anisotropic_Callback(hObject, eventdata, handles)
% hObject    handle to anisotropic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in log.
function log_Callback(hObject, eventdata, handles)
% hObject    handle to log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s = str2num(get(handles.Mask,'String'));

sigma=s/3;

adjusted = median(1:s);

for i=1:s
    for j=1:s
        Kernel(i,j) = (-1.0/(sqrt(2 * pi) * sigma^3)) *(2 - ((i-adjusted)^2+(j-adjusted)^2)/sigma^2 ) *  exp(-((i-adjusted)^2+(j-adjusted)^2)/(2*sigma^2) );
    end
end



Kernel = fspecial('log', s, sigma) 


for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-adjusted+1:i+adjusted-1,j-adjusted+1:j+adjusted-1);
        LI(i,j) = dot(Kernel(:),Patch(:))/sum(sum(abs(Kernel(:))));
    end
end

slope=10;

for i=1:size(LI,1)
    for j=1:size(LI,2)
        Patch = zeropaddedimage(LI,i:i+2,j:j+2);
        if (Patch(1,1)*Patch(1,1+1)<0) && abs(Patch(1,1)-Patch(1,1+1))>slope
            LI2(i,j)=255;
        elseif (Patch(1,1)*Patch(1+1,1)<0) && abs(Patch(1,1)-Patch(1+1,1))>slope
            LI2(i,j)=255;
        elseif (Patch(1,1)*Patch(1,1+2)<0 && abs(Patch(1,1+1))<=0) && abs(Patch(1,1)-Patch(1,1+2))>slope
            LI2(i,j)=255;
        elseif (Patch(1,1)*Patch(1+2,1)<0 && abs(Patch(1+1,1))<=0) && abs(Patch(1,1)-Patch(1+2,1))>slope
            LI2(i,j)=255;
        end
    end
end

showImage( LI2, hObject, handles);


% --- Executes on button press in levelsetactivecontour.
function levelsetactivecontour_Callback(hObject, eventdata, handles)
% hObject    handle to levelsetactivecontour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DIRECTORY = 'C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Videos\\movie1\\movie1\\';

f=figure;

X=str2num(get(handles.X,'string'));
Y=str2num(get(handles.Y,'string'));

%X=159;
%Y=179;

R=8;

Lin = [];
Lout = [];
    

r=R;x=X;y=Y;
ang=0:0.01:2*pi; 
for i=ang
    Lin = [Lin ;[ceil(x+r*cos(i)) ceil(y+r*sin(i))]];
end


r=R+1;x=X;y=Y;
ang=0:0.01:2*pi; 
for i=ang
    Lout = [Lout ;[ceil(x+r*cos(i)) ceil(y+r*sin(i))]];
end

Lout=unique(Lout,'rows','stable');
Lin=unique(Lin,'rows','stable');

I = imread( sprintf( '%s\\%s', DIRECTORY, sprintf('PIC00%03d.jpg',1) ));
I = I (:,:,3);

FI=ones(size(I,1),size(I,2))*3;
    
    avg=[];
    avgo=[];
    for x=1:size(I,1) 
        for y=1:size(I,2)
            P=[x; y];
            isInLout = find(Lout(find(Lout(:,1)==P(1)),2)==P(2) );
            isInLin  = find(Lin (find(Lin (:,1)==P(1)),2)==P(2) );
            if (isinterior(I,Lin,Lout, P))
                %I(x, y)=0;
                FI(x,y) = -3;
                avg = [avg I(x,y)];
            elseif (size(isInLout,1)>0)
                FI(x,y) = 1;
            elseif (size(isInLin,1)>0)
                FI(x,y) = -1;
            else
                avgo = [avgo I(x,y)];
            end
        end
    end
    
    
  
    %imshow(redrawI(I,Lin,Lout));
    %hist(avg);
    
Na = 5;
epsilon = 10;

baseAvg = mean(avg);

mediai=mean(double(avg));
sigmai = std(double(avg));

mediao=mean(double(avgo));
sigmao = std(double(avgo));

for l=1:269   
    I = imread( sprintf( '%s\\%s', DIRECTORY, sprintf('PIC00%03d.jpg',l) ));
    I = I (:,:,3);

    for i=1:Na    
        Lout2=[];
        for j=1:size(Lout,1)
            P=Lout(j,:);
            Pvi=(1.0/(sqrt(2 * pi) * sigmai^2)) * exp(-(double(I(P(1),P(2))) - mediai)^2/(2*sigmai^2) );
            Pvo=(1.0/(sqrt(2 * pi) * sigmao^2)) * exp(-(double(I(P(1),P(2))) - mediao)^2/(2*sigmao^2) );

            Fd = log(Pvo/Pvi);

            %Fd = abs( double(I(P(1),P(2))) - baseAvg ) - epsilon;
            if (Fd<0)
                Lin=[Lin; P];
                FI(P(1),P(2)) = -1;

                N4=calculateN4(I,P);

                for jj=1:size(N4,1)
                    Y=N4(jj,:);
                    if (FI(Y(1),Y(2))==3)
                        Lout2=[Lout2; Y];
                        FI(Y(1),Y(2)) = 1;
                    end
                end
            else
                %Do nothing
                Lout2 = [Lout2; P];
            end
        end
        Lout=Lout2;
        % --------------

        Lin2=[];
        for j=1:size(Lin,1)
            P=Lin(j,:);
            if ( ~(shouldBeInLin(I,FI,Lin,Lout,P)))
                FI(P(1),P(2)) = -3;
            else
                Lin2 = [Lin2; P];
            end
        end
        Lin=Lin2;
        % --------
        Lin2=[];
        for j=1:size(Lin,1)
            P=Lin(j,:);
            Pvi=(1.0/(sqrt(2 * pi) * sigmai^2)) * exp(-(double(I(P(1),P(2))) - mediai)^2/(2*sigmai^2) );
            Pvo=(1.0/(sqrt(2 * pi) * sigmao^2)) * exp(-(double(I(P(1),P(2))) - mediao)^2/(2*sigmao^2) );

            Fd = log(Pvo/Pvi);
            %Fd = abs( double(I(P(1),P(2))) - baseAvg ) - epsilon;
            if (Fd>0)
                Lout=[Lout; P];
                FI(P(1),P(2)) = 1;

                N4=calculateN4(I,P);

                for jj=1:size(N4,1)
                    Y=N4(jj,:);
                    if (FI(Y(1),Y(2))==-3)
                        Lin2=[Lin2; Y];
                        FI(Y(1),Y(2)) = -1;
                    end
                end
            else
                %Do nothing
                Lin2 = [Lin2; P];
            end
        end
        Lin=Lin2;
        % --------------
        Lout2=[];
        for j=1:size(Lout,1)
            P=Lout(j,:);
            if ( ~(shouldBeInLout(I,FI,Lin,Lout,P)))
                FI(P(1),P(2)) = 3;
            else
                Lout2 = [Lout2; P];
            end
        end
        Lout=Lout2;
        %-------
        %Lout=unique(Lout,'rows','stable');
        %Lin=unique(Lin,'rows','stable');
    end
    
    
    I2=redrawI(I,Lin,Lout);
    
    set(f,'WindowButtonDownFcn',{@getmousepos,handles, redrawI(I2,Lin,Lout)})
    showImageOnFig(I2, hObject, handles);
    
    pause(0.001);
end

% --- Executes on button press in playmovie.
function playmovie_Callback(hObject, eventdata, handles)
% hObject    handle to playmovie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DIRECTORY = 'C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Videos\\movie1\\movie1\\';

f=figure;

for i=1:269
    filename = sprintf('PIC00%03d.jpg',i);
    
    File = sprintf( '%s%s', DIRECTORY,filename);

    I = imread(File);

    I = I (:,:,1);
    
    set(f,'WindowButtonDownFcn',{@getmousepos,handles, I})
    showImageOnFig(I, hObject, handles);
    
    pause(0.001);
end


% --- Executes on button press in chooseregion.
function chooseregion_Callback(hObject, eventdata, handles)
% hObject    handle to chooseregion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DIRECTORY = 'C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Videos\\movie1\\movie1\\';

f=figure;

X=str2num(get(handles.X,'string'));
Y=str2num(get(handles.Y,'string'));

R=10;

for j=1:1
    filename = sprintf('PIC00%03d.jpg',j);
    
    File = sprintf( '%s%s', DIRECTORY,filename);

    I = imread(File);

    I = I (:,:,1);

    Lin = [];
    Lout = [];
   
    r=R;x=X;y=Y;
    ang=0:0.01:2*pi; 
    for j=ang
        Lin = [Lin ;[ceil(x+r*cos(j)) ceil(y+r*sin(j))]];
    end
    
    
    r=R+1;x=X;y=Y;
    ang=0:0.01:2*pi; 
    for j=ang
        Lout = [Lout ;[ceil(x+r*cos(j)) ceil(y+r*sin(j))]];
    end
    
    Lout=unique(Lout,'rows','stable');
    Lin=unique(Lin,'rows','stable');
    
    for j=1:size(Lin,1)
    
        I(Lin(j,1), Lin(j,2))=255;
    end
    
    
    for j=1:size(Lout,1)
    
        I(Lout(j,1), Lout(j,2))=200;
    end

    set(f,'WindowButtonDownFcn',{@getmousepos,handles, I})
    showImageOnFig(I, hObject, handles);
    
    pause(0.001);
end


% --- Executes on button press in nomaxsuppress.
function nomaxsuppress_Callback(hObject, eventdata, handles)
% hObject    handle to nomaxsuppress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

s=3;

Kernel = [1 0 -1; 2 0 -2; 1 0 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIx(i,j) = dot(Kernel(:),Patch(:));
    end
end


Kernel = [1 2 1; 0 0 0; -1 -2 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIy(i,j) = dot(Kernel(:),Patch(:));
    end
end

psi=zeros(size(I,1),size(I,2));

for i=1:size(I,1)
    for j=1:size(I,2)
        if (dIx(i,j) == 0)
            psi(i,j)= 0;
        else
            psi(i,j) = abs(atan( dIy(i,j) / dIx(i,j) ))*(180/pi);
        end
        
        if ((0< psi(i,j) && psi(i,j) < 22.5) || (157.5 < psi(i,j) && psi(i,j) < 180))
            psi(i,j) = 0;
        elseif (22.5< psi(i,j) && psi(i,j) < 67.5)
            psi(i,j) = 45;
        elseif (67.5<psi(i,j) && psi(i,j) < 112.5)
            psi(i,j) = 90;
        elseif (112.5< psi(i,j) && psi(i,j) < 157.5)
            psi(i.j) = 135;
        end
        
    end
end

AI=zeros(size(I,1),size(I,2));

% Finalmente hago la supresión de los no máximos en la dirección del
% gradiente
for i=1:size(I,1)
    for j=1:size(I,2)
        %AI(i,j) = sqrt( dIx(i,j)^2 + dIy(i,j)^2 );
        AI(i,j) = abs(dIx(i,j)) + abs(dIy(i,j));
        
        if (AI(i,j)>0)
            Patch = zeropaddedimage(AI,i-1:i+1,j-1:j+1);

            if ( psi(i,j) == 0       && (Patch(2,1)> AI(i,j) || Patch(2,3)>AI(i,j)) )
                AI(i,j)=0;
            elseif ( psi(i,j) == 45  && (Patch(3,1)> AI(i,j) || Patch(1,3)>AI(i,j)) )
                AI(i,j)=0;
            elseif ( psi(i,j) == 90  && (Patch(1,2)> AI(i,j) || Patch(3,2)>AI(i,j)) )
                AI(i,j)=0;
            elseif ( psi(i,j) == 135 && (Patch(1,1)> AI(i,j) || Patch(3,3)>AI(i,j)) )
                AI(i,j)=0;
            end
        end
            
    end
end

showImage( AI, hObject, handles);


% --- Executes on button press in hysteresisthresholding.
function hysteresisthresholding_Callback(hObject, eventdata, handles)
% hObject    handle to hysteresisthresholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

% Detector de borde de Sobel (ver maskaras)
s=3;

Kernel = [1 0 -1; 2 0 -2; 1 0 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIx(i,j) = dot(Kernel(:),Patch(:));
    end
end


Kernel = [1 2 1; 0 0 0; -1 -2 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIy(i,j) = dot(Kernel(:),Patch(:));
    end
end

% Obtengo la imagen de bordes con Sobel.
AI=zeros(size(I,1),size(I,2));

for i=1:size(I,1)
    for j=1:size(I,2)
        AI(i,j) = abs(dIx(i,j)) + abs(dIy(i,j));
    end
end



% Thresholds para la histeresis de la umbralización
t1=100;
t2=200;

AI2=AI;
for i=1:size(I,1)
    for j=1:size(I,2)        
        if (AI(i,j)>0)
            Patch = zeropaddedimage(AI,i-1:i+1,j-1:j+1);

            if ( AI(i,j) > t2 )
                AI2(i,j) = 255;
            elseif ( AI(i,j) < t1 )
                AI2(i,j) = 0;
            else
                % Si alguno de los cuatro vecinos, es borde, entonces este
                % es borde tambien cuando esta en el medio de la
                % histeresis.
                AI2(i,j) = 0;
                for ii=1:size(Patch,1)
                    for jj=1:size(Patch,2)
                        if ( Patch(ii,jj) > t2 )
                            AI2(i,j) = 255;
                        end
                    end
                end
            end
        end
            
    end
end

showImage( AI2, hObject, handles);


% --- Executes on button press in canny.
function canny_Callback(hObject, eventdata, handles)
% hObject    handle to canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

% Queda pendiente aplicarle diferentes filtros y el and.

s = str2num(get(handles.Mask,'String'));

threshold1 = str2num(get(handles.Threshold1,'String'));
threshold2 = str2num(get(handles.Threshold2,'String'));

sigma=s/3;

AI = canny(I,s,sigma, threshold1, threshold2);

showImage( AI, hObject, handles);


% --- Executes on button press in susan.
function susan_Callback(hObject, eventdata, handles)
% hObject    handle to susan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

percentage = str2double(get(handles.percentagesusan,'String'));
threshold = str2double(get(handles.thresholdsusan,'String'));
d = str2double(get(handles.percentagerangesusan,'String'));

PercentageMatch=get(get(handles.PercentageMatch,'SelectedObject'),'Tag');

if (strcmp(PercentageMatch,'Border'))
    percentage = 0.40;
elseif (strcmp(PercentageMatch,'Corner'))
    percentage = 0.64;
end

[SUSAN ] = susan( I, percentage, threshold, d );

showImage( SUSAN, hObject, handles);



function thresholdsusan_Callback(hObject, eventdata, handles)
% hObject    handle to thresholdsusan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of thresholdsusan as text
%        str2double(get(hObject,'String')) returns contents of thresholdsusan as a double


% --- Executes during object creation, after setting all properties.
function thresholdsusan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thresholdsusan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentagerangesusan_Callback(hObject, eventdata, handles)
% hObject    handle to percentagerangesusan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentagerangesusan as text
%        str2double(get(hObject,'String')) returns contents of percentagerangesusan as a double


% --- Executes during object creation, after setting all properties.
function percentagerangesusan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentagerangesusan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentagesusan_Callback(hObject, eventdata, handles)
% hObject    handle to percentagesusan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentagesusan as text
%        str2double(get(hObject,'String')) returns contents of percentagesusan as a double


% --- Executes during object creation, after setting all properties.
function percentagesusan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentagesusan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in hough.
function hough_Callback(hObject, eventdata, handles)
% hObject    handle to hough (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

% Line Hough
HOUGH=hough(I);

showImage( HOUGH, hObject, handles);


% --- Executes on button press in clean.
function clean_Callback(hObject, eventdata, handles)
% hObject    handle to clean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

I=zeros(200,200);

showImage( I, hObject, handles);



function Threshold1_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Threshold1 as text
%        str2double(get(hObject,'String')) returns contents of Threshold1 as a double


% --- Executes during object creation, after setting all properties.
function Threshold1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Threshold1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Threshold2_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Threshold2 as text
%        str2double(get(hObject,'String')) returns contents of Threshold2 as a double


% --- Executes during object creation, after setting all properties.
function Threshold2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Threshold2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Corner.
function Corner_Callback(hObject, eventdata, handles)
% hObject    handle to Corner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Corner


% --- Executes on button press in Border.
function Border_Callback(hObject, eventdata, handles)
% hObject    handle to Border (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Border


% --- Executes on button press in circularhough.
function circularhough_Callback(hObject, eventdata, handles)
% hObject    handle to circularhough (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

% Line Hough
HOUGH=houghcircle(I);

showImage( HOUGH, hObject, handles);


% --- Executes on button press in harriscorner.
function harriscorner_Callback(hObject, eventdata, handles)
% hObject    handle to harriscorner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

threshold = str2double(get(handles.harriscornerthreshold,'String'));
%threshold = 10;

%I = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\Test.png');
%I = I(:,:,1);

HARRIS = harriscorner(I, threshold);

showImage( HARRIS, hObject, handles);



function harriscornerthreshold_Callback(hObject, eventdata, handles)
% hObject    handle to harriscornerthreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of harriscornerthreshold as text
%        str2double(get(hObject,'String')) returns contents of harriscornerthreshold as a double


% --- Executes during object creation, after setting all properties.
function harriscornerthreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to harriscornerthreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in siftcompare.
function siftcompare_Callback(hObject, eventdata, handles)
% hObject    handle to siftcompare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

I1 = getImagePos('1',hObject,handles);
I2 = getImagePos('2',hObject,handles);

%I = Io(:,:,1);

[f1, d1] = vl_sift( single(I1) );
[f2, d2] = vl_sift( single(I2) );

matches = vl_ubcmatch(d1, d2);
numMatches = size(matches,2);

limitmatches = str2double(get(handles.limitmatches,'String'));

if (numMatches > limitmatches)
    matches = matches(:,1:limitmatches);
    numMatches = limitmatches;
end

im1 = I1;
im2 = I2;

dh1 = max(size(im2,1)-size(im1,1),0) ;
dh2 = max(size(im1,1)-size(im2,1),0) ;

figure(1) ; clf ;
imagesc([padarray(im1,dh1,'post') padarray(im2,dh2,'post')]) ;
colormap(gray);
o = size(im1,2) ;

if (numMatches>0)
    line([f1(1,matches(1,:));f2(1,matches(2,:))+o], ...
         [f1(2,matches(1,:));f2(2,matches(2,:))]) ;
end

 title(sprintf('%d tentative matches', numMatches)) ;
axis image off ;

drawnow ;


% --- Executes on button press in sift.
function sift_Callback(hObject, eventdata, handles)
% hObject    handle to sift (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Io = getImage(hObject,handles);

%Io = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\__192x192__arc_0.png');
%I = I(:,:,1);
Io = Io(:,:,1);
%I= double(rgb2gray(I)/256);

%Io= double(rgb2gray(Io)/256);
%Io = Io(:,:,1);
%I = single(Io);

[frames, descriptors] = vl_sift( single(Io) );

figure;
imshow(Io, [0 255]);

%h3 = vl_plotsiftdescriptor(descriptors(:,:),frames(:,:));
h3 = vl_plotframe(frames(:,:));

%set(h3,'color',colorin);


% --- Executes on button press in rotateright.
function rotateright_Callback(hObject, eventdata, handles)
% hObject    handle to rotateright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getImage(hObject,handles);

I = rot90(I);

showImagePos( 1,'2',I, hObject, handles);



function limitmatches_Callback(hObject, eventdata, handles)
% hObject    handle to limitmatches (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of limitmatches as text
%        str2double(get(hObject,'String')) returns contents of limitmatches as a double


% --- Executes during object creation, after setting all properties.
function limitmatches_CreateFcn(hObject, eventdata, handles)
% hObject    handle to limitmatches (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
