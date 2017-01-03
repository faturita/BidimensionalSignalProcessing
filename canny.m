function [ Iout ] = canny( I, s, sigma, threshold1, threshold2 )
% Use s<0 if you do not want gaussian smoothing

if (s>0)
    % Gaussian Smoothing
    adjusted = median(1:s);

    for i=1:s
        for j=1:s
            Kernel(i,j) = (1.0/(2 * pi * sigma^2)) * exp(- (((i-adjusted)^2 + (j-adjusted)^2)/(sigma^2) ));
        end
    end


    for i=1:size(I,1)
        for j=1:size(I,2)
            Patch = zeropaddedimage(I,i-adjusted+1:i+adjusted-1,j-adjusted+1:j+adjusted-1);
            I(i,j) = dot(Kernel(:),Patch(:)) / sum(sum(abs(Kernel(:))));
        end
    end

    % La salida de dot es muy sucia.
    I = double(uint8(I));
end

% Detector de borde de Sobel (ver maskaras)
[AI, dIx, dIy] = sobel(I);

% Obtengo la matriz con los angulos de los gradientes.
psi=zeros(size(I,1),size(I,2));

for i=1:size(I,1)
    for j=1:size(I,2)
        psi(i,j) = (atan( dIx(i,j) / dIy(i,j) ))*(180/pi)+90;
        
        if ((0< psi(i,j) && psi(i,j) < 22.5) || (157.5 < psi(i,j) && psi(i,j) <= 180))
            psi(i,j) = 180;
        elseif (22.5< psi(i,j) && psi(i,j) < 67.5)
            psi(i,j) = 45;
        elseif (67.5<psi(i,j) && psi(i,j) < 112.5)
            psi(i,j) = 90;
        elseif (112.5< psi(i,j) && psi(i,j) < 157.5)
            psi(i,j) = 135;
        else
            % NaN values
            psi(i,j) = 0;
        end
        
    end
end

% Finalmente hago la supresión de los no máximos en la dirección del
% gradiente
for i=1:size(I,1)
    for j=1:size(I,2)
        
        if (AI(i,j)>0)
            Patch = zeropaddedimage(AI,i-1:i+1,j-1:j+1);

            if     ( psi(i,j) == 180 && (Patch(2,1)>= AI(i,j) || Patch(2,3)>=AI(i,j)) )
                AI(i,j)=0;
            elseif ( psi(i,j) == 45  && (Patch(3,1)>= AI(i,j) || Patch(1,3)>=AI(i,j)) )
                AI(i,j)=0;
            elseif ( psi(i,j) == 90  && (Patch(1,2)>= AI(i,j) || Patch(3,2)>=AI(i,j)) )
                AI(i,j)=0;
            elseif ( psi(i,j) == 135 && (Patch(1,1)>= AI(i,j) || Patch(3,3)>=AI(i,j)) )
                AI(i,j)=0;
            end
        end
            
    end
end


% Thresholds para la histeresis de la umbralización
t1=threshold1;
t2=threshold2;


for i=1:size(I,1)
    for j=1:size(I,2)        
        if (AI(i,j)>0)
            Patch = zeropaddedimage(AI,i-1:i+1,j-1:j+1);

            if ( AI(i,j) > t2 )
                AI(i,j) = 255;
            elseif ( AI(i,j) < t1 )
                AI(i,j) = 0;
            end

        end
            
    end
end

for i=1:size(I,1)
    for j=1:size(I,2)        
        if (AI(i,j)>0)
            Patch = zeropaddedimage(AI,i-1:i+1,j-1:j+1);

            if ( (t1 < AI(i,j)) && (AI(i,j) < t2) )
                % Si alguno de los cuatro vecinos, es borde, entonces este
                % es borde tambien cuando esta en el medio de la
                % histeresis.
                AI(i,j) = 0;
                for ii=1:size(Patch,1)
                    for jj=1:size(Patch,2)
                        if (( Patch(ii,jj) > t2) )
                            AI(i,j) = 255;
                        end
                    end
                end
            end
        end
    end
end

Iout=AI;

end

