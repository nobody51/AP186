nx = 500; ny = 500;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
A = sin(20*X);
A (find(A>0.0 ) ) = 1;
A (find(A<0.0 ) ) = 0;
f = scf();
grayplot(x,y,A);
f.color_map = graycolormap(32);
xs2png(gcf(),'grating.png');
