function [ I ] = greyscale(  )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
I = zeros(200,200);

for x=1:1:200
    for y=1:1:200
        I(x,y) = ((x+y)/400.0)*255;
    end
end

end

