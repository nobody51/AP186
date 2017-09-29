nx = 500;
ny = 500;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
//apperature
A = exp(-(X.^2 + Y.^2));
r = sqrt(X.^2 + Y.^2);
A (find(r>0.7) ) = 0;
//square
D = zeros (nx,ny);
D (find(abs(X)<0.3 & abs(Y)<0.3) ) = 1;
//square X apperature
B = A.*D

f = scf();
grayplot(x,y,B);
f.color_map = graycolormap(32);
xs2png(gcf(),'squareXapperature2.png');
