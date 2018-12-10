function  [x,err]=Bisection(f, x0, tol, Nmax, a,b )
%
%   Bisection Method
%   Bisection method for finding successively better approximations to
%   the roots of f(x).
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
    
    
   assert(a<b);
   assert(f(a)*f(b)<0)
   
    k=1;
    x(1)=x0;
    while (b-a >tol) && (k <= Nmax)
    k = k + 1;
    m = (a+b)/2;
    x(k) = m;
    err = abs(x(k) - x(k-1));
    if (f(m)*f(a) < 0)
        b = m;
    else
     a = m;
    end
    
    end
x=x(end);
    err=err(end);
end
