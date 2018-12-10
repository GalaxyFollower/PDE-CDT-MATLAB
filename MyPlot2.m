function MyPlot2(a,b, f, N)
% To make sure that the order of a, b does not matter,
% we use the interval [min(a,b) max(a,b)] for our plot

% N is the number of points bewtween min(a,b) and max(a,b)
xx=linspace(min(a,b),max(a,b),N);
plot(xx,f(xx),'b');
hold on;
xlabel('x');
ylabel('exp(sin(x^2))')
title('Aili Shao, Magdalen College')   
end

