function getmousepos( hObject, varargin )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

pos=get(hObject,'CurrentPoint');
handles = varargin{2};

I = varargin{3};

y=pos(1);
x=pos(2);

width=size(I,2);
height=size(I,1);

%[x y]

[height width]    
    
x=height-x;

[x y]

%I(x,y)

if (size(I,3)==1)
    red=I(x,y);
    green=I(x,y);
    blue=I(x,y);
else
    red=I(x,y,1);
    green=I(x,y,2);
    blue=I(x,y,3);
end

%xWorldLimits = [0 640];
%yWorldLimits = [0 480];
%RA = imref2d(size(I),xWorldLimits,yWorldLimits);
%imshow(I,RA);


set(handles.Red,'string',num2str(red));
set(handles.Green,'string',num2str(green));
set(handles.Blue,'string',num2str(blue));

set(handles.X,'string',num2str(x));
set(handles.Y,'string',num2str(y));

if (size(I,3)==3)
    HSV = rgb2hsv(I);
    hue=HSV(x,y,1);
    saturation=HSV(x,y,2);
    value=HSV(x,y,3);
    set(handles.Hue,'string',num2str(hue));
    set(handles.Saturation,'string',num2str(saturation));
    set(handles.Value,'string',num2str(value));
else
    set(handles.Hue,'string',num2str(0));
    set(handles.Saturation,'string',num2str(0));
    set(handles.Value,'string',num2str(0));
end

R=str2num(get(handles.RegionRadio,'String'));

Region = I;

if (size(I,3)==1)
    
    Region = I(max(1,x-R):min(x+R,width),max(1,y-R):min(y+R,height));

    average = mean(mean(Region));
    set(handles.Pixels,'string',num2str(size(Region,1)*size(Region,2)));
    set(handles.Avg1,'string',num2str(average));
    set(handles.Avg2,'string',num2str(average));
    set(handles.Avg3,'string',num2str(average));

else
    Region = I(max(1,x-R):min(x+R,width),max(1,y-R):min(y+R,height));
    
    average1 = mean(mean(Region));
    average2 = mean(mean(Region));
    average3 = mean(mean(Region));
    set(handles.Pixels,'string',num2str(size(Region,1)*size(Region,2)));
    set(handles.Avg1,'string',num2str(average1));
    set(handles.Avg2,'string',num2str(average2));
    set(handles.Avg3,'string',num2str(average3));  
    
end

line(y, x, 'Color','r', 'LineStyle','none', ...
        'Marker','.', 'MarkerSize',1);
    
fig = get(hObject,'Parent'); 
%hfig = getParentFigure(hObject);
setappdata(fig,'Region',Region);
    
end

