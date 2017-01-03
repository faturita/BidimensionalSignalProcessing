I=imread('C:\Users\rramele\Google Drive\ATI.Image.Processing\Imagenes\Test.png');

I = I(:,:,1);



I=uint8(I);

figure;imshow(I);

threshold = 27;

SUSAN = zeros(size(I,1),size(I,2));

for i=1:size(I,1)
    for j=1:size(I,2)
        
        Patch = circularpatch(I,i-3:i+3,j-3:j+3);
        C = zeros(size(Patch,1),size(Patch,2));
        
        for ii=1:size(Patch,1)
            for jj=1:size(Patch,2)
                if (Patch(ii,jj)>0)
                    % Marca los valores del parche circular
                    val = abs( I(i,j) - Patch(ii,jj) );
                    
                    if ( val < threshold )
                        C(ii,jj) = 1;
                    end
                end
            end
        end
        
        SUSAN(i,j) =  sum( C(:) )/(37.0);
    end
end

for i=1:size(I,1)
    for j=1:size(I,2)
        if ( SUSAN(i,j) < 0.76 && SUSAN(i,j)>0.74 )
            SUSAN(i,j)
            SUSAN(i,j) = 255;
            
        else
            SUSAN(i,j) = 0;
        end
    end
end
figure;
imshow(SUSAN);
