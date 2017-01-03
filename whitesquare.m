function [ I ] = whitesquare( )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

I = zeros(200,200);

r=50;x=100;y=100;
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
I(ceil(x+xp),ceil(y+yp))=255;

end

