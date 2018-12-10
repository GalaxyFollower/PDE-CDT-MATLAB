function GoldenRatio2(tol)
% This returns the Golden Ratio estimated with error <tol
F=[];
F1=0;
F2=1;
F=[F1 F2];
exact_ratio=(1+sqrt(5))/2;
ratio=inf;
while abs(ratio-exact_ratio)>tol;
Fnew=F(end)+F(end-1);
F=[F Fnew];
ratio=F(end)/F(end-1);
end
ratio
N=length(F)
end