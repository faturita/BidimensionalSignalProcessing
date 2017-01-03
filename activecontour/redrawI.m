function I=redrawI( I,Lin,Lout )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

    for i=1:size(Lin,1)   
        I(Lin(i,1), Lin(i,2))=255;
    end
    
    
    for i=1:size(Lout,1) 
        I(Lout(i,1), Lout(i,2))=200;
    end
    
    %imshow(I);

end

