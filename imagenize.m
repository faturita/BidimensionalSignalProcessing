function [ I ] = imagenize( I )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% I es siempre double.
Lmax = max(max(I));
Lmin = min(min(I));

if (~( 0 < Lmin && Lmin < 256  &&  0 < Lmax && Lmax < 256))
    I=((I - Lmin) / (Lmax - Lmin)) * 255.0;
end

%I=uint8(I);

end