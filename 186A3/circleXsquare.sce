nx = 200;
ny = 200;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
r = sqrt((X.^2) + (Y.^2));
A = zeros(nx,ny);
A (find(r<0.7) ) = 1;

B = zeros (nx,ny);
B (find(abs(X)<0.7 & abs(Y)<0.7) ) = 1;

C = A.*B;
f = scf();
grayplot(x,y,C);
f.color_map = graycolormap(32);
xs2png(gcf(),'circleXsquare.png');
