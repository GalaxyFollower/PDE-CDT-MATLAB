function Fibonacci(n)
% This function returns the nth Fibonacci number
F=[];
F1=0;
F2=1;

F=[F1 F2];
while length(F)< n
Fnew=F(end)+F(end-1);
F=[F Fnew];
end
x=F(end)
end

