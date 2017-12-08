//7C
nx = 200;ny = 200;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);

//1
dots = zeros(nx, ny);dots(100,75) = 1;dots(100,125) = 1;
FT_dots = abs(fftshift(fft2((dots))));
f=scf();imshow(dots);isoview();
f=scf();imshow(uint8(FT_dots)*255);isoview();

//1
r1 = sqrt(((X).^2) + ((Y+0.25).^2));
r2 = sqrt(((X).^2) + ((Y-0.25).^2));
A = zeros(nx,ny);
A (find(r1<0.1) ) = 1;
A (find(r2<0.1) ) = 1;

AFT = imnorm(abs(fft2(A)))

f=scf();imshow(A);isoview();
f=scf();imshow(uint8(fftshift(AFT)*255));isoview();

//3
squares = zeros (nx,ny);squares (find(abs(X)< 0.01 & abs(Y)>0.24 & abs(Y)<0.26) ) = 1;
FT_squares = abs(fftshift(fft2(double(squares))));
f=scf();imshow(squares);isoview();
f=scf();imshow(FT_squares);isoview();

//4/5
a = 1
b = 0.5
c = 0.1
rx = a*exp(-(X).^2/(2*c^2));
ry1 = a*exp(-(Y-b).^2/(2*c^2));
ry2 = a*exp(-(Y+b).^2/(2*c^2));
gauss = rx.*ry1 + rx.*ry2
FT_gauss =imnorm(abs(fftshift(fft2(double(gauss)))))

f=scf();imshow(gauss);isoview();
f=scf();imshow(uint8(FT_gauss*255));isoview();

//6

