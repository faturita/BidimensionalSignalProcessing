function [ frames,descriptors ] = edge_sift( I )
%  VL SIFT
edge_thresh = 10;

[frames, descriptors] = vl_sift(I,'edgethresh', edge_thresh);
%[frames, descriptors] = sift(I,'EdgeThreshold',edge_thresh);

while ( size(descriptors,2) == 0 ) 
    edge_thresh = edge_thresh+1;
    [frames, descriptors] = vl_sift(I,'edgethresh', edge_thresh);

    if (edge_thresh > 100)
        error('There is no way to obtain valid thresholds from the given image.');
    end
end

end

