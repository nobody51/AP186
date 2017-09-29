nx = 500;
ny = 500;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
r = sqrt(X.^2 + Y.^2);
A = zeros(nx,ny);
A (find(r<0.7 & r>0.4) ) = 1;
f = scf();
grayplot(x,y,A);
f.color_map = graycolormap(32);
xs2png(gcf(),'annulus.png');
