//7C
nx = 200;ny = 200;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);

dots = zeros(nx, ny);dots(100,75) = 1;dots(100,125) = 1;
FT_dots = abs(fftshift(fft2((dots))));
f=scf();imshow(dots);isoview();
f=scf();imshow(uint8(FT_dots)*255);isoview();

r1 = sqrt(((X).^2) + ((Y+0.25).^2));
A1 = zeros(nx,ny);
A1 (find(r1<0.1) ) = 1;
r2 = sqrt(((X).^2) + ((Y-0.25).^2));
A2 = zeros(nx,ny);
A2 (find(r2<0.1) ) = 1;
A = A1 + A2
AFT = imnorm(fft2(A))

f=scf();imshow(A);isoview();
f=scf();imshow(uint8(fftshift(abs(AFT))));isoview();
