function [ I ] = drawparametriccircle( I, X,Y, ro)
% DrawParametricCircle
%
%   I  Where the circle will be drawn.
%   X,Y  Center position.
%   ro  Modulus of the position vector.

Xrange=1:size(I,1);
Yrange=1:size(I,2);

for x=Xrange
    for y=Yrange
       
        val=abs(ro^2 - (x-X)^2 - (y-Y)^2);
 
        if ( val < ro )
            I(x,y)=255;
        end
    end
end

end

