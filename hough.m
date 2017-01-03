function [ Iout ] = hough( I )
% Lineal Hough Transform

% Threshold para determinar si vota o no a la recta candidata.
epsilon=0.5;
% Rango para el ángulo.
thetascale=0.01;
% Rango para el módulo del vector.
roscale=1;

% s, sigma, threshold1, threshold2
I = canny(I,3,1,100,200);

% La lista de puntos
Plist=[];

% La imagen tiene que estar umbralizada.
for i=1:size(I,1)
    for j=1:size(I,2)
        if (I(i,j)>200)
            Plist=[Plist ; [i j]];
        else
            I(i,j) = 0;
        end
    end
end

D= max(size(I,1),size(I,2));

thetaRange=-pi/2:thetascale:pi/2;
roRange=-sqrt(2)*D:roscale:sqrt(2)*D;

% Defino el acumulador
A = zeros(size(thetaRange,2),size(roRange,2));

for iTheta=1:size(thetaRange,2)
    xx=cos(thetaRange(iTheta));
    yy=sin(thetaRange(iTheta));
        
    for iRo=1:size(roRange,2)

        for i=1:size(Plist,1)

            x=Plist(i,1);
            y=Plist(i,2);
            
            xp=x*xx;
            yp=y*yy;

            val=abs(xp+yp - roRange(iRo));
            
            %val=abs(roRange(iRo)^2 - xx^2 - yy^2);
            

            if ( val < epsilon )
                A(iTheta,iRo)=A(iTheta,iRo)+1;
            end
        end
        
    end
end

% Busco un rango óptimo para la discretización.
thresh = max(max(A));
[row, col] = find(A>=thresh);

while (~(size(row,1)>10 && size(row,1) < 30) && thresh>0)
    [row, col] = find(A>=thresh);
    thresh=thresh-1;
end

I = zeros(size(I,1),size(I,2));

% Graficar las rectas encontradas....
for i=1:size(row,1)
    theta=thetaRange(row(i));
    ro=roRange(col(i));

    I=drawparametricline(I, theta, ro);
end

Iout=I;

end

