//create a 3x3 matrix pattern with edges of zero sum

pattern1 = [-1 -1 -1; 2 2 2; -1 -1 -1];

F = double(imread("C:\Users\up csrc\Documents\186A6\VIP.bmp"));

output1 = convol2d(F, pattern1);
//f=scf();
//imshow(uint8(output1));
//isoview();

pattern2 = [-1 2 -1; -1 2 -1; -1 2 -1];
output2 = convol2d(F,pattern2);
//f=scf();
//imshow(uint8(output2));
//isoview();

pattern3 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
output3 = convol2d(F,pattern3);
//f=scf();
//imshow(uint8(output3));
//isoview();
