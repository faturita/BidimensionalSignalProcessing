function  showImageOnFig( I,  hObject, handles )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

ImagePos = get(handles.ImagePos,'String');

showImagePos(0, ImagePos,I, hObject, handles);

end