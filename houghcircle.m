function [ Iout ] = houghcircle( I )

% Rango para el módulo del vector.
roscale=1;

I = canny(I,3,1,100,200);

%figure;
%imshow(I);

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

roRange=-sqrt(2)*D:roscale:sqrt(2)*D;
Xrange=1:size(I,1);
Yrange=1:size(I,2);

% Defino el acumulador
A = zeros(size(roRange,2),size(Xrange,2),size(Yrange,2));

for iRo=1:size(roRange,2)
        
    for X=Xrange
        for Y=Yrange

            for i=1:size(Plist,1)

                x=Plist(i,1);
                y=Plist(i,2);

                val=abs(roRange(iRo)^2 - (x-X)^2 - (y-Y)^2);


                if ( val < roRange(iRo) )
                    A(iRo,X,Y)=A(iRo,X,Y)+1;
                end
            end
        end
        
    end
end

% Busco un rango óptimo para la discretización.
thresh = max(max(max(A)));
[fil,row,col]=ind2sub(size(A), find(A>=thresh))

%while (~(size(row,1)>10 && size(row,1) < 30) && thresh>0)
%    [fil,row,col]=ind2sub(size(A), find(A>=thresh))
%    thresh=thresh-1;
%end

I = zeros(size(I,1),size(I,2));

% Graficar las rectas encontradas....
for i=1:size(row,1)
    ro=roRange(fil(i));
    X=Xrange(row(i));
    Y=Yrange(col(i));

    I=drawparametriccircle(I, X,Y, ro);
end

Iout=I;

end


