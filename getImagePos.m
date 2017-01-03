function [ I ] = getImagePos( ImagePos, hObject, handles )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

hfig = getParentFigure(hObject);
ImageId = sprintf( 'Image%s', ImagePos);
I = getappdata(hfig,ImageId);

I = double(I);

end

