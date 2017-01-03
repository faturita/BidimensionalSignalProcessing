clear all;

DIRECTORY = 'C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Videos\\movie1\\movie1\\';
FILENAMEMASK='PIC00%03d.jpg'
NUMBEROFFRAMES=268;

% Parámetros del pixel central.
X=159;
Y=179;

R=8;

Lin = [];
Lout = [];
FI=[];
    

% Dibujo el círculo con la región inicial.
r=R;x=X;y=Y;
ang=0:0.01:2*pi; 
for i=ang
    Lin = [Lin ;[ceil(x+r*cos(i)) ceil(y+r*sin(i))]];
end


r=R+1;x=X;y=Y;
ang=0:0.01:2*pi; 
for i=ang
    Lout = [Lout ;[ceil(x+r*cos(i)) ceil(y+r*sin(i))]];
end

% Reordenar los dos vectores de pixels.
Lout=unique(Lout,'rows','stable');
Lin=unique(Lin,'rows','stable');

% Cargo la imagen la convierto a ESCALA DE GRISES
I = imread( sprintf( '%s\\%s', DIRECTORY, sprintf(FILENAMEMASK,1) ));
I = I (:,:,1);

imshow(redrawI(I,Lin,Lout));

FI=ones(size(I,1),size(I,2))*3;
    
PixelIn=[];
PixelOut=[];
for x=1:size(I,1) 
    for y=1:size(I,2)
        P=[x; y];
        isInLout = find(Lout(find(Lout(:,1)==P(1)),2)==P(2) );
        isInLin  = find(Lin (find(Lin (:,1)==P(1)),2)==P(2) );
        if (isinterior(I,Lin,Lout, P))
            FI(x,y) = -3;
            PixelIn = [PixelIn I(x,y)];
        elseif (size(isInLout,1)>0)
            FI(x,y) = 1;
        elseif (size(isInLin,1)>0)
            FI(x,y) = -1;
        else
            PixelOut = [PixelOut I(x,y)];
        end
    end
end
    
    
imshow(redrawI(I,Lin,Lout));
    
Na = 5;
epsilon = 10;
Ng = 3;

baseAvg = mean(PixelIn);

mediai=mean(double(PixelIn));
sigmai = std(double(PixelIn));

mediao=mean(double(PixelOut));
sigmao = std(double(PixelOut));

  