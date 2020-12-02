function g = stretchTransform(f, varargin)
if isempty(varargin)
    % Use default
    m = mean2(f);
    E = 4.0;
elseif length(varargin) == 2
    m = varargin{1};
    E = varargin{2};
else
    error('Incorrecr number of imputs for the stretch method.')
end
g = 1./(1 + (m./f).^E);