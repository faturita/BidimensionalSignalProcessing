function [ I ] = whitecircle( )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
I = zeros(200,200);

%get(handles.Red,'String');

r=50;x=100;y=100;
ang=0:0.001:2*pi; 

for r=1:50
for a=ang
    xp=r*cos(a);
    yp=r*sin(a);
    I(ceil(x+xp),ceil(y+yp))=255;
end
end

end

