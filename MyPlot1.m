function MyPlot1(f,x)

% Note that if the input is just the functionalhandle (nargin==1), it gives ans for Q1.1
% If the inputs are (f,x), it gives ans for Q1.3

% 1000 grid points bewtween 0 to 2*pi for plotting
xx=linspace(0,2*pi,1000);

plot(xx,f(xx),'b');
hold on;
xlabel('x');
ylabel('exp(sin(x^2))')
title('Aili Shao, Magdalen College')

if nargin==2
    if x<0 | x>2*pi;
        
    disp( [num2str(x), ' is out of the range (0,2*pi)'])
    else
    disp([ 'f(',num2str(x) ') is ' , num2str(f(x))])  
end

end

