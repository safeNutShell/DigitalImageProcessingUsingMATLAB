function g = specfiedTransform(f, txfun)
txfun = txfun(:);% force it to be a cloumn vector
if any(txfun) > 1 || any(txfun) <= 0
    error('All elements of txfun be in the range [0 1].')
end
T = txfun;
X = linspace(0, 1, numel(T))';
g = interp1(X, T, f);