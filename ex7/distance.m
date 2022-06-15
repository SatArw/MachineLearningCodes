function dist = distance(x1,x2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

dist=0;
for i = 1:size(x1,2)
    dist = dist + (x1(1,i)-x2(1,i))^2;
end

dist = dist^(0.5);

end