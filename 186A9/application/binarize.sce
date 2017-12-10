I = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A9\application\segmented\C1.jpg");
I = rgb2gray(I);

[count, cells] = imhist(I, 256);
plot (cells,count);

//xs2png(gcf(), "histogram.png");

f=scf();
BW = I>210;
imshow(BW);
isoview();
//xs2png(gcf(), "bwcheck");

SE1 = imcreatese('ellipse',5,5);
SE2 = imcreatese('ellipse',10,10);

im1 = imopen(BW,SE2);
fixed = imclose(im1,SE1);

f=scf();
imshow(im);
isoview();
