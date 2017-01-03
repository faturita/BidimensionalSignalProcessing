function [ I ] = invertimage( I )
% Invert the given gray-scaled image.
I = double(I);

I = -I + ones(size(I,1),size(I,2) )*255;

I = uint8(I);

end

