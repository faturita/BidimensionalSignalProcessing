function val = calculateN4(I,P)
[height,width] = size(I);

Up=[P(1) P(2)+1];
Down=[P(1)+1 P(2)];
Left=[P(1)-1 P(2)];
Right=[P(1) P(2)-1];


if (Up(1) < 1)
    Up(1) =1;
end
if (Up(1) > height)
    Up(1) = height;
end

if (Up(2) < 1)
    Up(2) =1;
end
if (Up(2) > width)
    Up(2) = width;
end
%----
    
if (Down(1) < 1)
    Down(1) =1;
end
if (Down(1) > height)
    Down(1) = height;
end

if (Down(2) < 1)
    Down(2) =1;
end
if (Down(2) > width)
    Down(2) = width;
end
%----
if (Left(1) < 1)
    Left(1) =1;
end
if (Left(1) > height)
    Left(1) = height;
end

if (Left(2) < 1)
    Left(2) =1;
end
if (Left(2) > width)
    Left(2) = width;
end
%----

if (Right(1) < 1)
    Right(1) =1;
end
if (Right(1) > height)
    Right(1) = height;
end

if (Right(2) < 1)
    Right(2) =1;
end
if (Right(2) > width)
    Right(2) = width;
end

val = [Up ;Down ;Left ;Right];

end

