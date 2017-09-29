
//7A: creating patterns
nx = 200;
ny = 200;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
tallRect = zeros (nx,ny);
tallRect (find(abs(X)<0.7 & abs(Y)<0.2) ) = 1;

wideRect = zeros (nx,ny);
wideRect (find(abs(X)<0.2 & abs(Y)<0.7) ) = 1;

dots1 = zeros(nx, ny);
dots1 (find(abs(Y)<0.11 &abs(Y)>0.1 & abs(X)<0.01) ) = 1;

dots2 = zeros(nx, ny);
dots2 (find(abs(Y)<0.31 &abs(Y)>0.3 & abs(X)<0.01) ) = 1;


