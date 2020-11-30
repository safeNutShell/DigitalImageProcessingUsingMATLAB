function y = sinfun1(M)
% sinfun1 computes some sin value
% def...

x = 0:M-1;
for k = 1:numel(x)
    y(k) = sin(x(k) / (100*pi));
end
