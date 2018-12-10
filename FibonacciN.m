function FibonacciN(n)
% This function return the first N Fibonacci numbers
F=[];
F1=0;
F2=1;
F=[F1 F2];
while length(F)< n
Fnew=F(end)+F(end-1);
F=[F Fnew];
end
F
end