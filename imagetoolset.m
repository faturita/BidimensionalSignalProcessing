I = imread('C:\Users\rramele\Google Drive\ATI.Image.Processing\Imagenes\BINARIO.BMP');

f = imshow(I);
set(f,'WindowButtonDownFcn',@mytestcallback)

imwrite(I, 'binario.bmp');

size(I)


In = I(10:20,20:30);

imshow(In)


I = zeros(200,200);

for x=0:0.1:200
    if (x<=10)
        I(round(100-x),round((100 - sqrt( 10*10 - x*x ) ))) = 255;
        I(round(100+x),round((100 + sqrt( 10*10 - x*x ) ))) = 255;
        I(round(100+x),round((100 - sqrt( 10*10 - x*x ) ))) = 255;
        I(round(100-x),round((100 + sqrt( 10*10 - x*x ) ))) = 255;
    end
end

figure;
imshow(I);




I = zeros(200,200);

for x=0:0.1:200
    if (x<=10)
        I(round(100-x),round(100-10)) = 255;
        I(round(100-10),round(100-x)) = 255;
        I(round(100+x),round(100+10)) = 255;
        I(round(100+10),round(100+x)) = 255;
        I(round(100+x),round(100-10)) = 255;
        I(round(100+10),round(100-x)) = 255;
        I(round(100-x),round(100+10)) = 255;
        I(round(100-10),round(100+x)) = 255;
    end
end
figure;
imshow(I);



I = zeros(200,200);

for x=1:1:200
    for y=1:1:200
        I(x,y) = ((x+y)/400.0)*255;
    end
end
imtool(I,[0 255]);


A = zeros(200,200,3);

for x=1:0.1:200
    for y=1:0.1:200
        A(round(x),round(y),1) = double(((x+y)/400.0)*1.0);
        A(round(x),round(y),2) = double(((x)/400.0)*1.0);
        A(round(x),round(y),3) = double(((y)/400.0)*1.0);
    end
end
imtool(A,[0 1]);


HSV = rgb2hsv(A);
f=imtool(HSV);

%set(f,'WindowButtonDownFcn',@mytestcallback)

%set(f,'WindowsButtonDownFcn',{@mytestcallback,mydata})
%If you're working with uicontrol objects, then it's:
%set(myuicontrolhandle,'Callback',@mytestcallback)



