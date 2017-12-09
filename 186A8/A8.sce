I = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A8\check.jpg");
I = double(I);

[count, cells] = imhist(I, 256);
plot (cells,count);
f=scf();
BW = I<125;
imshow(BW);
