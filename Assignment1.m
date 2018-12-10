%% PDE CDT Matlab assignment 1
% Name: Aili Shao 
%% Plotting 

%Q1.1 & Q1.2
f=@(x) exp(sin(x.^2));
figure(1);clf;
MyPlot1(f)
%Q1.3
figure(2);clf;
MyPlot1(f,-.2);
MyPlot1(f,.292829);

%Q1.4 
figure(3);clf;
MyPlot2(10,13,f,1000)

%Q1.5
figure(4);clf;
g=@(x) exp(cos(x.^2));
h=@(x) log(x);
figure(4);clf;
MyPlot2(pi,3*pi,f,50);
hold on;
MyPlot2(pi,3*pi,g,50);
hold on;
MyPlot2(pi,3*pi,h,50);
%% Iterative Schemes:
% Q2.4
g1=@(x) 1/13 * (14-x.^3);
[x,err]=FixedPoint(g1, 0, 1e-4, 100)
g2=@(x) exp(-x);
[x,err]=FixedPoint(g2, 1, 1e-4, 100)
g3=@(x) x.^3+3*x.^2-3;
[x,err]=FixedPoint(g3, 0.5, 1e-4, 100)
% If the initial point for g3 is 0.5, it does not converge.
% But it converges for x0=-0.5
[x,err]=FixedPoint(g3, -0.5, 1e-4, 100)

% Q2.5 
f1=@(x) cos(x);
df1=@(x) -sin(x);
[x,err]=Netwon(f1,df1, 1/2, 1e-4, 100 )
[x,err]=Bisection(f1, 1/2, 1e-4, 100, -.5,3 )
f2=@(x) x*cos(x);
df2=@(x) cos(x) - x*sin(x);
[x,err]=Netwon(f2,df2, 1/2, 1e-4, 100 )
[x,err]=Bisection(f2, 1/2, 1e-4, 100, -1,1 )
f3=@(x) sin(x)*sinh(x);
df3=@(x)cos(x)*sinh(x) + cosh(x)*sin(x);
[x,err]=Netwon(f3,df3, 1/2, 1e-4, 100 )
% [x,err]=Bisection(f3, 1/2, 1e-4, 100, -1,1 )
% Bisection method fails in this case as f3(-1)>0, and f3(1)>0.
f4=@(x) x-sin(x);
df4=@(x) 1-cos(x);
[x,err]=Netwon(f4,df4, 1/2, 1e-4, 100 )
[x,err]=Bisection(f4, 1/2, 1e-4, 100, -1,1 )
%% Fibonacci 
% Q3.1
Fibonacci(10)
%Q3.2
FibonacciN(10)
%Q3.3
GoldenRatio(100)
%Q3.4  % There is no 'n' for input
format long
GoldenRatio2(1e-7)
%Q3.5
figure;clf;
GR_ErrorPlot(1e-7)




