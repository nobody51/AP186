
//7A: creating patterns
nx = 200;
ny = 200;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
tallRect = zeros (nx,ny);
tallRect (find(abs(X)<0.02 & abs(Y)<0.07) ) = 1;

wideRect = zeros (nx,ny);
wideRect (find(abs(X)<0.07 & abs(Y)<0.02) ) = 1;

dots1 = zeros(nx, ny);
dots1(50,100) = 1;
dots1(150,100) = 1;

dots2 = zeros(nx, ny);
dots2(50,100) = 1;
dots2(150,100) = 1;

FT_tallRect = abs(fftshift(fft2(double(tallRect))));
FT_wideRect = abs(fftshift(fft2(double(wideRect))));
FT_dots1 = abs(fftshift(fft2(double(dots1))));
FT_dots2 = abs(fftshift(fft2(double(dots2))));


f=scf();
grayplot(x,y,dots1);
isoview();

f=scf();
imshow(uint8((FT_dots1))*255);
isoview();



