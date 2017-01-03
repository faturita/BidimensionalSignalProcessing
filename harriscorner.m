function [ Iout ] = harriscorner( I, threshold )
% HarrisCorner
%
%   Reimplementation of the Harris Corner Detector.
%
%   I             Grey Image
%   threshold     Image Threshold (0-255)
%

%threshold = 10;

%I = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\Test.png');
%I = I(:,:,1);

%figure;
%imshow(I);

% Detector de borde de Sobel (ver maskaras)
[AI, Ix, Iy] = sobel(I);

Ix2 = Ix .* Ix;
Iy2 = Iy .* Iy;
Ixy = Ix .* Iy;

Ix2 = gaussiansmoothing(Ix2, 3);
Iy2 = gaussiansmoothing(Iy2, 3);
Ixy = gaussiansmoothing(Ixy, 3);

k=0.04;

% Surge directamente del det M - k traza M
cim1(:,:) = ( Ix2 .* Iy2 - Ixy .* Ixy) - k * (Ix2 + Iy2) .^ 2;

% La salida de cim1 no es una imagen en los valores, hay que escalarla.
I=imagenize(cim1);


%figure;
%imshow(I);

mmax = max(max(I));

I(I>=(mmax-threshold))=255;
I(I<(mmax-threshold))=0;
    
%figure;
%imshow(I);

Iout = I;

end

