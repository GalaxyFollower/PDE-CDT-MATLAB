%% PDE CDT Matlab assignment 4
% Name: Aili Shao 

%% Solve  the 2D Helmholtz problem on  [0,1]*[0,1]
% Generate the mesh
N=50; % Number of grid points in each direction
dx=1/N; dy=dx; % grid size
x1d=0:dx:1;  % grid points in x direction
y1d=0:dy:1;  % grid points in y direction
[xx,yy]=meshgrid(x1d,y1d); 
x=xx(:);y=yy(:);


% The exact solution is 
uexact=@(x,y) cos(pi*x).*cos(pi*y); %(note I change the laplace to be -laplace)
% Build the laplacian operator with homogeneous neumann bc

% Build the 1D operator first
      Ix = speye(N+1,N+1);
      e = ones(N+1,1);
      D1xx = spdiags([e  -2*e  e], [-1 0 1], N+1, N+1);
      D1xx(1,2) = 2; % homogeneous neumann bc
      D1xx(N+1,N) = 2;
      D1xx = D1xx/dx^2;
      
      Iy = speye(N+1,N+1);
      e = ones(N+1,1);
      D1yy = spdiags([e  -2*e  e], [-1 0 1], N+1, N+1);
      D1yy(1,2) = 2; % homogeneous neumann bc using central difference
      D1yy(N+1,N) = 2;
      D1yy = D1yy/dy^2;
      
% Generate the 2D laplacian using Kron with Iy, Ix
      Dxx = kron(Iy, D1xx);
      Dyy = kron(D1yy, Ix);
      L = Dxx + Dyy;
      
% Build the rhs
f=@(x,y)(1+2*pi^2)*cos(pi.*x).*cos(pi.*y)
rhs=f(x,y);
M= -L+eye(size(L)); %% I guess you probably forget a minus sign here? 
u=M\rhs;
err=norm(uexact(x,y)-u,inf)
u=reshape(u,size(xx));
figure(1);clf;
surf(xx,yy,u)
 
% We can use forward and backward difference quotients to approximate the
% neumann boundary condition to achieve a symmetric operator matrix



%% Use forward and backward difference quotients to approximate the bc
% Generate the mesh
N=50;
dx=1/N; dy=dx;
x1d=0:dx:1;
y1d=0:dy:1;

[xx,yy]=meshgrid(x1d,y1d);
x=xx(:);y=yy(:);


% The exact solution is 
uexact=@(x,y) cos(pi*x).*cos(pi*y);

% Build the laplacian operator with homoegeneous neumann bc

% Build the 1D operator first
      Ix = speye(N+1,N+1);
      e = ones(N+1,1);
      D1xx = spdiags([e  -2*e  e], [-1 0 1], N+1, N+1);
      D1xx(1,1) = -1;  %homogeneous neumann bc using forward/backward difference
      D1xx(N+1,N+1) = -1; %
      D1xx = D1xx/dx^2;
      
      Iy = speye(N+1,N+1);
      e = ones(N+1,1);
      D1yy = spdiags([e  -2*e  e], [-1 0 1], N+1, N+1);
      D1yy(1,1) = -1;
      D1yy(N+1,N+1) = -1;
      D1yy = D1yy/dy^2;
      
%Generate the 2D laplacian using Kron with Iy, Ix
      Dxx = kron(Iy, D1xx);
      Dyy = kron(D1yy, Ix);
      L = Dxx + Dyy;
      
%Build the rhs
f=@(x,y)(1+2*pi^2)*cos(pi.*x).*cos(pi.*y)
rhs=f(x,y);
M=-L+eye(size(L));
u=M\rhs;
inf_err=norm(u-uexact(x,y),inf)
u=reshape(u,size(xx));
figure(2);clf;
surf(xx,yy,u)
% The order of convergence drops from 2nd order to 1st order.

%% Solve the 2D heat equation 

% Generate the mesh
N=50; % Number of grid points in each direction
dx=1/N; dy=dx;
x1d=0:dx:1;
y1d=0:dy:1;
[xx,yy]=meshgrid(x1d,y1d);
x=xx(:);y=yy(:);
%Initial condition 
initial = @(x,y)exp((x-1/2).^2+(y-1/2).^2);
u0=initial(xx,yy);
figure(3);clf;
surf(xx,yy,u0);
pause;

% Note: your initial guess does not satisfy the dirichlet bc 
% In this case, I build an operator matrix with dimension N-1 instead 
% of N+1 so that I can enforce zero-dirichlet bc later



% Build the laplacian operator with homogeneous dirichlet bc  
% Build the 1D operator first
      Ix = speye(N-1,N-1);
      e = ones(N-1,1);
      D1xx = spdiags([e  -2*e  e], [-1 0 1], N-1, N-1);
      D1xx = D1xx/dx^2;
      
      Iy = speye(N-1,N-1);
      e = ones(N-1,1);
      D1yy = spdiags([e  -2*e  e], [-1 0 1], N-1, N-1);
      D1yy = D1yy/dy^2;
      
% Generate the 2D laplacian using Kron with Iy, Ix
      Dxx = kron(Iy, D1xx);
      Dyy = kron(D1yy, Ix);
      L = Dxx + Dyy;
Tf = 5; k=0.1;
numsteps = Tf/k;
u0(1,:)=[];u0(end,:)=[];
u0(:,1)=[];u0(:,end)=[];
u=u0(:);
% Time-stepping:
for n = 1:numsteps
    % unew=u+k*L*unew
   unew =(eye(size(L))-k*L)\u; % Implicit Euler 
   u = unew;
   t = n * k;
   uplot=zeros(N+1,N+1);
   uplot(2:end-1, 2:end-1)=reshape(u,N-1,N-1);
   surf(xx,yy,uplot)
   xlabel('x'); ylabel('y');zlabel('u(t,x,y)');
   title(['n = ' num2str(n) ', t = ' num2str(t)])
   drawnow
   %pause
end

