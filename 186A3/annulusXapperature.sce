nx = 500;
ny = 500;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
r = sqrt(X.^2 + Y.^2);
//annulus
A = zeros(nx,ny);
A (find(r<0.7 & r>0.4) ) = 1;

//apperature
D = exp(-(X.^2 + Y.^2));
D (find(r>0.7) ) = 0;


//X
B = A.*D
f = scf();
grayplot(x,y,B);
f.color_map = graycolormap(32);
//xs2png(gcf(),'annulusXapperature.png');
