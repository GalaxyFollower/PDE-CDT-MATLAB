function GoldenRatio(n)
% This function returns the approximate golden ratio F(n)/F(n-1)
F=[];
F1=0;
F2=1;
F=[F1 F2];
while length(F)< n
Fnew=F(end)+F(end-1);
F=[F Fnew];
end
ratio=F(end)/F(end-1)
end