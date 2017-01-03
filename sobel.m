function [ I, dIx, dIy ] = sobel( I )
% Sobel EDGE Detector
%  1 0 -1
%  2 0 -2
%  1 0 -1
%


% Detector de borde de Sobel (ver maskaras)
Kernel = [1 0 -1; 2 0 -2; 1 0 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIx(i,j) = dot(Kernel(:),Patch(:));
    end
end


Kernel = [1 2 1; 0 0 0; -1 -2 -1];

for i=1:size(I,1)
    for j=1:size(I,2)
        Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
        dIy(i,j) = dot(Kernel(:),Patch(:));
    end
end


% Obtengo la imagen de bordes con Sobel.
for i=1:size(I,1)
    for j=1:size(I,2)
        I(i,j) = abs(dIx(i,j)) + abs(dIy(i,j));
    end
end

end

