function GR_ErrorPlot(tol)
F=[];err=[];
exact_ratio=(1+sqrt(5))/2;
F1=0;
F2=1;
F=[F1 F2];
ratio=inf;
err1=abs(ratio-exact_ratio);
err=[err err1];
while err(end)>tol;
Fnew=F(end)+F(end-1);
F=[F Fnew];
ratio=F(end)/F(end-1);
newerr=abs(ratio-exact_ratio);
err=[err newerr];
end
N=length(F);
%Use semilog plot to get better scale
semilogy(1:N-1, err, '-r');
xlabel('n')
ylabel('Approximation error')
end