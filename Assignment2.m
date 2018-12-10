%% PDE CDT Matlab assignment 2
% Name: Aili Shao 

%% Solve ODE using Backward Euler and RK4 

% Solve: y'(t) = (1-y(t))* t + y(t) with y(0) = 1.
f=@(t,y) (1-y)*t+y;
dt=0.2; %time step
Tf=10; % final time
y0=1; %initial condition 
numsteps = ceil(Tf / dt)  % now adjust to have integer steps
dt = Tf / numsteps        % modified time step
y=y0;
h=zeros(3,1);
% The 'exact' solution from ode45 solver
[T,yexact]=ode45(@(t,y) (1-y)*t+y,[0 Tf],y0);
figure(1);clf;
h(1)=plot(T,yexact,'g');
hold on;
xlabel('t','FontSize',18,'FontName','Times');
ylabel('y','FontSize',18,'FontName','Times');
% Backward Euler
for n=1:numsteps
    t=dt*(n-1);
    % ynew=y+dt*f(tnew,ynew) by simple calculation, we have the following
    % explicit formula:
    ynew=(y+dt*(t+dt))/(1+dt*(t+dt)-dt);
    h(2)=plot(t+dt,ynew,'r.','MarkerSize', 20);
    hold on;
    pause
    y=ynew;
end
y

%Runge Kutta - 4th order solution

Y=y0;

 for n=1:numsteps
     t=(n-1)*dt;
     th=t+dt/2;
     k1=f(t,Y);
     k2=f(th,Y+dt*k1/2);
     k3=f(th,Y+dt*k2/2);
     k4=f(t+dt,Y+dt*k3);
     Ynew=Y+dt*(k1+2*k2+2*k3+k4)/6;
     h(3)=plot(t+dt,Ynew,'b.','MarkerSize', 20);
     pause;
     Y=Ynew;
 end
Y
legend(h,'ode45', 'Backward Euler','RK4')
hold off;

% RK4 is consistent with the solution obtained from ode45 solver

%% Plots for different initial conditions 

u0=linspace(-1,1,20);
yvec=[];
Yvec=[];
for i=1:length(u0);
    y0=u0(i);
    Y0=u0(i);
    y=y0;
    Y=y0;
for n=1:numsteps
    t=dt*(n-1);
    % ynew=y+dt*f(tnew,ynew) by simple calculation, we have the following
    % explicit formula:
    ynew=(y+dt*(t+dt))/(1+dt*(t+dt)-dt);
    y=ynew; 
end
yvec=[yvec ynew];
for n=1:numsteps
     t=(n-1)*dt;
     th=t+dt/2;
     k1=f(t,Y);
     k2=f(th,Y+dt*k1/2);
     k3=f(th,Y+dt*k2/2);
     k4=f(t+dt,Y+dt*k3);
     Ynew=Y+dt*(k1+2*k2+2*k3+k4)/6;
     Y=Ynew;
end
 Yvec=[Yvec Ynew];
end

figure(2);clf;
plot(u0, yvec, 'r-');
hold on;
plot(u0,Yvec,'b-');
xlabel 'initial condition'
ylabel 'solution at t=10'
legend('Backward Euler', 'RK4');
hold off;
err=norm(yvec-Yvec,inf)


% The plot shows that the solution at t=10 is independent of the choice of
% the initial condition 
