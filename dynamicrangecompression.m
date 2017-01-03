function [ I ] = dynamicrangecompression( I )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

c = 255 / log( max(max(I)) + 1 );

I = c * log( I + ones(size(I,1),size(I,2) ));

I = uint8(I);

end

