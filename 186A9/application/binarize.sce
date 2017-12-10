I = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A9\application\segmented\C12.jpg");
I = rgb2gray(I);

//[count, cells] = imhist(I, 256);
//plot (cells,count);

//xs2png(gcf(), "histogram.png");

f=scf();
BW = I>210;
imshow(BW);
isoview();
xs2png(gcf(), "C12");

