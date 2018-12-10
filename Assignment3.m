%% PDE CDT Matlab assignment 3
% Name: Aili Shao 

%% Solve 1D Poisson problem on [0,1]:
% -d^u/dx^2=1, u(0)=0, u'(1)=3.
N=200; % Number of grid points
% Generate the mesh
x=linspace(0,1,N+1);
% Initialisation of the solution vector
u=zeros(1, N+1);
% Define RHS
b=ones(1,N)';
b(end)=1/2+3*N; % Impose the RHS inhomogeneous neumann bc
% Generate the finite difference matrix
A=(N)^2*toeplitz([2  -1 zeros(1,N-2)]);

% Note that we may use spdiags to generate sparse matrix to ensure
% computation efficiency 
% e = ones(1, N)';
% A = N^2* spdiags([-e 2*e -e], [-1 0 1], N, N);

% Modify the last row according to the rhs neumann bc
A(end,:)=N^2*[zeros(1,N-2)  -1  1];
%A(end,end)=N^2
% Solve the linear system using backslash
u(2:end)=A\b;  
u(1)=0; % impose the RHS homogeneous dirichlet bc
plot(x,u,'-.o')
hold on; 
% Compare with the true solution 
utrue =@(x) -x.^2/2+4*x;
ezplot(utrue,[0,1]);
legend('Numerical Solution', 'Exact Solution')
hold off;
%Compute the error
err=norm(utrue(x)-u,inf)


%% Solve 1D Helmhotz problem on [0,1]:
% -d^u/dx^2+U=1, u(0)=0, 2u(1)+u'(1)=3.
N=1000; % Number of grid points
% Generate the mesh
x=linspace(0,1,N+1);
% Initialisation of the solution vector
u=zeros(1, N+1);
% Define RHS
b=ones(1,N)';
b(end)=1+6*N; % Impose the RHS inhomogeneous robin bc
% Generate the finite difference matrix
A=(N)^2*toeplitz([2  -1 zeros(1,N-2)]);
% Modify the last row according to the rhs robin bc
%Note that the BC gives
% [u(N+1)-u(N-1)]/(2dx)+2u(N)=3 -->u(N+1)=6*dx-4*dx*u(N)+u(N-1)
% Substitute into our FD scheme [-u(N-1)+2u(N)-u(N+1)]/dx^2, we get new
% coefficients for u(N) and u(N-1)
A(end,:)=N^2*[zeros(1,N-2)  -2  2+4/N];
I=eye(N,N);
M=A+I;
% Solve the linear system using backslash
u(2:end)=M\b;  
u(1)=0; % impose the RHS homogeneous dirichlet bc
plot(x,u,'-.o')
hold on; 
% Compare with the true solution 
utrue =@(x) (1+exp(1))/(3*exp(2)-1)*exp(x)+...
    (exp(1)+3*exp(2))/ (1-3*exp(2))*exp(-x)+1;
ezplot(utrue,[0,1]);
legend('Numerical Solution', 'Exact Solution')
hold off;
%Compute the error
err=norm(utrue(x)-u,inf)