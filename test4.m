% Metodo de Harris

clear all;
close all;

threshold = 10;

I = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\Test.png');
I = I(:,:,1);

figure;
imshow(I);

I = harriscorner(I, threshold);
    
figure;
imshow(I);

