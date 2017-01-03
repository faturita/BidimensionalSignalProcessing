function [ I ] = drawparametricline( I, theta, ro)
%DrawParametricLine
%   Theta : Angle in radians.
%   Ro: modulo of position vector (normal to the line).
%
%   The line will get drawn into I.

%ro=50;x=100;y=100;

Xrange=1:size(I,1);
Yrange=1:size(I,2);

xx=cos(theta);
yy=sin(theta);

for x=Xrange
    for y=Yrange
        xp=x*xx;
        yp=y*yy;
        
        val=abs(xp+yp - ro);
        
        if ( val < 1 )
            I(x,y)=255;
        end
    end
end

end