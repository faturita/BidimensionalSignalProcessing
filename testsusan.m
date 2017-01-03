clear all;
close all;

I = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\Test.png');
I = I(:,:,1);

figure;
imshow(I);

percentage = 0.64;
%percentage = 0.40;
threshold = 1;
d = 0.01;

SUSAN = susan( I, percentage, threshold, d);

figure;
imshow(SUSAN);

error('dddd');



SUSAN = zeros(size(I,1),size(I,2));

%I( I == 0) = 1;

for i=1:size(I,1)
    for j=1:size(I,2)
        
        Patch = circularpatch(I,i-3:i+3,j-3:j+3);
        C = zeros(size(Patch,1),size(Patch,2));
        
        for ii=1:size(Patch,1)
            for jj=1:size(Patch,2)
                if (Patch(ii,jj)>=0)
                    % Marca los valores del parche circular
                    val = abs( I(i,j) - Patch(ii,jj) );
                    
                    if ( val < threshold )
                        C(ii,jj) = 1;
                    end
                end
            end
        end
        
        SUSAN(i,j) =  1-sum( C(:) )/(37.0);
    end
end

figure;
imshow(SUSAN);

for i=1:size(I,1)
    for j=1:size(I,2)
        %if ( (SUSAN(i,j) < (percentage + d)) && (SUSAN(i,j)>(percentage-d)) )
        if ( (percentage-d) < SUSAN(i,j) && SUSAN(i,j) < (percentage+d))
            SUSAN2(i,j) = 255;
            
        else
            SUSAN2(i,j) = 0;
        end
    end
end


figure;
imshow(SUSAN2);

