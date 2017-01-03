function [ I ] = colorful( input_args )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
I = zeros(200,200,3);

for x=1:0.1:200
    for y=1:0.1:200
        I(round(x),round(y),1) = double(((x+y)/400.0)*1.0);
        I(round(x),round(y),2) = double(((x)/400.0)*1.0);
        I(round(x),round(y),3) = double(((y)/400.0)*1.0);
    end
end

end

