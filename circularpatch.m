function [ R ] = circularpatch( I,rangei,rangej )

R = zeropaddedimage( I, rangei, rangej);

i=4;
j=4;

R(i-3:i-2,1) = -1;
R(i+2:i+3,1) = -1;

R(i-3:i-3,2) = -1;
R(i+3:i+3,2) = -1;

R(i-3:i-3,6) = -1;
R(i+3:i+3,6) = -1;


R(i-3:i-2,7) = -1;
R(i+2:i+3,7) = -1;

end
