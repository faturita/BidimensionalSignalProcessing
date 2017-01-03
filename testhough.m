clear all;
close all;

epsilon = 0.5;

I = zeros(200,200);
% I = drawparametricline(I,pi/2,80);
% 
% I = drawparametricline(I,pi/4,20);
% 
% I = drawparametricline(I,-pi/4,10);
% 
% I = drawparametricline(I,0,90);
% 
% I = drawparametricline(I, pi/6, 60);


I = drawparametriccircle(I, 100,100, 9);
figure;
imshow(I);

I = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\Circle.png');
I = I(:,:,1);

figure;
imshow(I);

I = houghcircle(I);
figure
imshow(I);

fdsfdsf

I = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\Imagen10.png');
I = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\Circle.png');
I = I(:,:,1);

figure;
imshow(I);


I = hough(I);

figure
imshow(I);


