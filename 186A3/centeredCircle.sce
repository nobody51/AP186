nx = 100;
ny = 100;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
r = sqrt((X.^2) + (Y.^2));
A = zeros(nx,ny);
A (find(r<0.7) ) = 1;

f = scf();
grayplot(x,y,A);
f.color_map = graycolormap(32);

E = edge(A,'sobel');
imshow(E);
