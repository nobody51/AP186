nx = 128;
ny = 128;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = meshgrid(x,y);
r = sqrt((X.^2) + (Y.^2));
A = zeros(nx,ny);
A (find(r<0.7) ) = 1;   //generates a circle with radius <-



f = scf();
grayplot(A);


