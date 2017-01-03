function AI = directional_mask( I,Kernel )

for r=1:4
    Kernel = imrotate(Kernel,45,'nearest','crop');

    for i=1:size(I,1)
        for j=1:size(I,2)
            Patch = zeropaddedimage(I,i-1:i+1,j-1:j+1);
            d(r).dI(i,j) = dot(Kernel(:),Patch(:));
        end
    end
end


for i=1:size(I,1)
    for j=1:size(I,2)
        AI(i,j) = max( [d(1).dI(i,j) d(2).dI(i,j) d(3).dI(i,j) d(4).dI(i,j)]);
    end
end
end

