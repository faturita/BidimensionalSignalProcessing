function [ I ] = imreadraw( width, height, Filepath )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    fid = fopen( Filepath );
    
    disp(Filepath);
    I = fread(fid,[width height],'uint8');
    
    I=I';
    
    fclose(fid);
    
end

