function g = intrans(f, method, varargin)
%INTRANS performs intensity (gray-level) transformations.
%   G = INTRANS(F, 'neg') computes the negative of input image F.
%   G = INTRANS(F, 'log', C, CLASS) computes C*log(1+F) and multiplies the
%   result by (positive) constant C.
%   G = INTRANS(F, 'gamma', GAM) performs a gamma transformation on the
%   input image using parameter GAM.
%   G = INTRANS(F, 'stretch', M, E) computes a contrast-stretching
%   transformation using the expression 1./(1 + (M./F).^E).
%   G = INTRANS(F, 'specified', TXFUN) performs the intensity transfrmation
%   s = TXFUN(r).

% Verify the correct number of inputs.
error(nargchk(2, 4, nargin))

if strcmp(method, 'log')
    g = logTransform(f, varargin{:});
    return;
end

if isfloat(f) && (max(f(:)) > 1 || min(f(:)) < 0)
    f = mat2gray(f);
end

[f, revertclass] = tofloat(f);

switch method
    case 'neg'
        g = imcomplement(f);
    case 'gamma'
        g = gammaTransform(f, varargin{:});
    case 'stretch'
        g = stretchTransform(f, varargin{:});
    case 'specified'
        g = specfiedTransform(f, varargin{:});
    otherwise
            error('Unknown enhancement method.')
end

g = revertclass(g);

