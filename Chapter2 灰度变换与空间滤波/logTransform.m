function g = logTransform(f, varargin)
[f, revertclass] = tofloat(f);
if numel(varargin) >= 2
    if strcmp(varargin{2}, 'uint8')
        revertclass = @im2uint8
    elseif strcmp(varargin{2}, 'uint16')
        revertclass = @im2uint16
    else
        error('Unsuported CLASS option for ''log'' method.')
    end
end
if numel(varargin) < 1
    %set default for C
    C = 1;
else
    C = varargin{1};
end
g = C * (log(1 + f));
g = revertclass(g);