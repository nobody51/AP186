nx = 500;
ny = 500;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
A = zeros (nx,ny);
B = zeros (nx,ny);
A (find(abs(X)<0.25 &abs(X)>0.1 & Y>0 & Y<0.25) ) = 1; //transcept
B (find(abs(X)<0.1 & abs(Y)<0.4) ) = 1; //nave
C = A + B;

f = scf();
grayplot(x,y,C);
f.color_map = graycolormap(32);
xs2png(gcf(),'cross.png');
