function  [x,err]=FixedPoint(f, x0, tol, Nmax )
%
% Fixed Point Method
%   Fixed point method for finding successively better approximations to
%   the solution to f(x)=x;
%
% Input:
%   f - input funtion
%   x0 - inicial aproximation
%   tol - tolerance
%   Nmax - maximum number of iterations
%
% Output:
%   x - aproximation to the solution
%   ex - error estimate


    if nargin <2
        error('Not enough input parameters');
    end
    
    if nargin == 2
        tol = 1e-4;
        Nmax = 1e1;
    elseif nargin == 3
        Nmax = 1e1;
    end
   
    
    x(1)=f(x0);
    err(1)=abs(x(1)-x0);
    k=2;
    while (err>= tol & k <= Nmax)
          x(k) =f( x(k-1));
          err(k) = abs(x(k)-x(k-1));
          k = k+1;
    end
     x=x(end);
     err=err(end);
end