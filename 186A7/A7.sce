//7A
nx = 200;ny = 200;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);

//tall rectangle aperature
tallRect = zeros (nx,ny);tallRect (find(abs(X)<0.07 & abs(Y)<0.02) ) = 1;
FT_tallRect = imnorm(abs(fftshift(fft2(double(tallRect)))));
f=scf();imshow(tallRect);isoview();xs2png(gcf(),'tallRect');
f=scf();imshow(FT_tallRect);isoview();xs2png(gcf(),'tallRectFT');

// wide rectangle aperature
wideRect = zeros (nx,ny);wideRect (find(abs(X)<0.02 & abs(Y)<0.07) ) = 1;
FT_wideRect = imnorm(abs(fftshift(fft2(double(wideRect)))));
f=scf();imshow(wideRect);isoview();xs2png(gcf(),'wideRect');
f=scf();imshow(FT_wideRect);isoview();xs2png(gcf(),'wideRectFT');

//two dots along the x-axis symetric about the center
dots = zeros(nx, ny);dots(100,50) = 1;dots(100,150) = 1;
FT_dots = abs(fftshift(fft2((dots))));
f=scf();imshow(dots);isoview();xs2png(gcf(),'dots');
f=scf();imshow(uint8(FT_dots)*255);isoview();xs2png(gcf(),'dotsFT');

//two dots but closer to each other
dotsClose = zeros(nx, ny);dotsClose(100,105) = 1;dotsClose(100,95) = 1;
FT_dotsClose = abs(fftshift(fft2(double(dotsClose))));
f=scf();imshow(dotsClose);isoview();xs2png(gcf(),'dotsClose');
f=scf();imshow(uint8(FT_dotsClose)*255);isoview();xs2png(gcf(),'dotsCloseFT');

//two dots but farther from each other
dotsFar = zeros(nx, ny);dotsFar(100,20) = 1;dotsFar(100,180) = 1;
FT_dotsFar = abs(fftshift(fft2(double(dotsFar))));
f=scf();imshow(dotsFar);isoview();xs2png(gcf(),'dotsFar');
f=scf();imshow(uint8(FT_dotsFar)*255);isoview();xs2png(gcf(),'dotsFarFT');

//7B
//sines of diff freq and their FTs
freq = 4;
z = sin(2*%pi*freq*X);
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(z);isoview;xs2png(gcf(),'freq4');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'freq4FT');

freq = 1;
z = sin(2*%pi*freq*X);
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(z);isoview;xs2png(gcf(),'freq1');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'freq1FT');

freq = 10;
z = sin(2*%pi*freq*X);
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(z);isoview;xs2png(gcf(),'freq10');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'freq10FT');

//adding constant bias
constant = 5;freq = 4;
z = sin(2*%pi*freq*X)+constant;
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(uint8(z*255));isoview;xs2png(gcf(),'const5');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'const5FT');

constant = 1;freq = 4;
z = sin(2*%pi*freq*X)+constant;
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(uint8(z*255));isoview;xs2png(gcf(),'const1');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'const1FT');

constant = 10;freq = 4;
z = sin(2*%pi*freq*X)+constant;
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(uint8(z*255));isoview;xs2png(gcf(),'const10');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'const10FT');

//rotating the sine
theta = 30;
z = sin(2*%pi*4*(Y*sin(theta) + X*cos(theta)));
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(z);isoview;xs2png(gcf(),'30');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'30FT');

theta = 120;
z = sin(2*%pi*4*(Y*sin(theta) + X*cos(theta)));
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(z);isoview;xs2png(gcf(),'120');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'120FT');

//combination of sines
z = sin(2*%pi*4*X).*sin(2*%pi*4*Y);
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(z);isoview;xs2png(gcf(),'combo');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'comboFT');

theta = 30; phi = 120
z = sin(2*%pi*4*(Y*sin(theta)+X*cos(theta))).*sin(2*%pi*4*(Y*sin(phi)+X*cos(phi)));
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(z);isoview;xs2png(gcf(),'combo2');
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'combo2FT');
