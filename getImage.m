function [ I ] = getImage( hObject, handles )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


ImagePos = get(handles.ImagePos,'String');
I = getImagePos( ImagePos, hObject, handles);


end

