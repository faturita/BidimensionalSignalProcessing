function  showImagePos( showfigure, ImagePos,I,  hObject, handles )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
hfig = getParentFigure(hObject);

ImageId = sprintf( 'Image%s', ImagePos);

Scalling=get(get(handles.Scalling,'SelectedObject'),'Tag');

if (strcmp(Scalling,'Compression'))
    I = dynamicrangecompression(I);
elseif (strcmp(Scalling,'Lineal'))
    I = imagenize(I);
end

I = uint8(I);

if (get(handles.Locked,'Value') == 0)
    setappdata(hfig,ImageId,I);
end

if (showfigure)
    f=figure('name',ImagePos);
    set(f,'WindowButtonDownFcn',{@getmousepos,handles, I})
end
imshow(I,[0 255]);


end
