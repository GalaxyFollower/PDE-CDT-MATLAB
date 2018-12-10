function  [x,err]=Netwon(f,df, x0, tol, Nmax )
%
%   Newton Method
%   Newton method for finding successively better approximations to
%   the roots of f(x).
%
% Input:
%   f - input funtion
%   df- input derivative of f 
%   x0 - initial guess
%   tol - tolerance
%   Nmax - maximum number of iterations
%
% Output:
%   x - aproximation to the solution
%   err - error estimate

    if nargin <3
        error('Not enough input parameters');
        
    end
    
    if nargin == 3
        tol = 1e-4;
        Nmax = 1e1;
    elseif nargin == 4
        Nmax = 1e1;
    end
    
    x(1) = x0 - (f(x0)/df(x0));
    err(1) = abs(x(1)-x0);
    k = 2;
    while (err(k-1) >= tol) && (k <= Nmax)
        x(k) = x(k-1) - (f(x(k-1))/df(x(k-1)));
        err(k) = abs(x(k)-x(k-1));
        k = k+1;
    end
    x=x(end);
    err=err(end);
end

