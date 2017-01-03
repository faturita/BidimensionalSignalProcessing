% SIFT

clear all;
close all;

Io = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\__192x192__arc_0.png');
%I = I(:,:,1);
%Io = Io(:,:,1);
%I= double(rgb2gray(I)/256);

descriptor=9;
colorin = [0.1*(mod(descriptor,2)), 0.1*(mod(descriptor,3)), 0.1*(mod(descriptor,5))];

%Io= double(rgb2gray(Io)/256);
Io = Io(:,:,1);
I = single(Io);

[frames, descriptors] = edge_sift( I );

% Generate descriptors images that were used.
%I = single(I);
%edge_thresh = 1;

%[frames, descriptors] = vl_sift(I,'EdgeThresh',10,'Verbose');

%fc = [50;200;50;-pi/2] ;
%[frames, descriptors] = vl_sift(I,'frames',fc);

% FC = [];
% 
% for i=1:9
%     recs = find(I(:,i*10)>0);
%     value = recs(round(size(recs,2)/2)+1);
%     fc = [i*10;value;10;-pi] ;
%     
%     FC = [FC fc];
% end
% 
% [frames, descriptors] = vl_sift(I,'frames',FC);

for i=1:size(frames,2)
    %h1 = vl_plotframe(frames(:,i));
    
    %set(h1,'color','k','linewidth',3);

end

%figure;
%hold on;
%imshow(I);

%h3 = vl_plotsiftdescriptor(descriptors(:,descriptor),frames(:,descriptor));
%set(h3,'color',colorin);

%hold off;

% Aca tengo la segunda imagen.
%Io2 = rot90(Io);
Io2 = imread('C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Imagenes\\__192x192__arc_1.png');

Io2 = Io2(:,:,1);
%Io2= double(rgb2gray(Io2)/256);
I2 = single(Io2);

[frames2, descriptors2] = edge_sift( I2 );

%figure;
%hold on
%imshow(I2);


%h3 = vl_plotsiftdescriptor(descriptors2(:,descriptor),frames2(:,descriptor));
%set(h3,'color',colorin);

%[matches, scores] = vl_ubcmatch(descriptors, descriptors2);
matches = vl_ubcmatch(descriptors, descriptors2);

numMatches = size(matches,2);

%h3 = vl_plotsiftdescriptor(descriptors2(:,matches(2,2)),frames2(:,matches(2,2)));
%set(h3,'color','r');


hold off;

im1 = Io;
im2 = Io2;

f1=frames;
f2=frames2;

d1=descriptors;
d2=descriptors2;


dh1 = max(size(im2,1)-size(im1,1),0) ;
dh2 = max(size(im1,1)-size(im2,1),0) ;

figure(1) ; clf ;
%subplot(2,1,1) ;
imagesc([padarray(im1,dh1,'post') padarray(im2,dh2,'post')]) ;
colormap(gray);
o = size(im1,2) ;
line([f1(1,matches(1,:));f2(1,matches(2,:))+o], ...
     [f1(2,matches(1,:));f2(2,matches(2,:))]) ;
title(sprintf('%d tentative matches', numMatches)) ;
axis image off ;

% subplot(2,1,2) ;
% imagesc([padarray(im1,dh1,'post') padarray(im2,dh2,'post')]) ;
% o = size(im1,2) ;
% line([f1(1,matches(1,ok));f2(1,matches(2,ok))+o], ...
%      [f1(2,matches(1,ok));f2(2,matches(2,ok))]) ;
% title(sprintf('%d (%.2f%%) inliner matches out of %d', ...
%               sum(ok), ...
%               100*sum(ok)/numMatches, ...
%               numMatches)) ;
% axis image off ;

drawnow ;
