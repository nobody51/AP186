//set up ROI in ncc
I = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A8\New folder\1stROI.jpg")
I = double(I);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
Int = R+G+B;
Int(find(Int==0)) = 1000000
r = R./Int;
g = G./Int;

//take parametric values
mean_r = mean(r);
sigma_r = stdev(r);
mean_g = mean(g);
sigma_g = stdev(g);

//set original image in ncc

A = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A8\New folder\lolol.jpg");
A = double(A);
RA = A(:,:,1);
GA = A(:,:,2);
BA = A(:,:,3);
IntA = RA+GA+BA;
IntA(find(IntA==0)) = 1000000;
rA = RA./IntA;
gA = GA./IntA;

//pixel likelihood
pr = (1/(sigma_r*sqrt(2*%pi))) * exp(-((rA-mean_r).^2)/(2*sigma_r.^2));
pg = (1/(sigma_g*sqrt(2*%pi))) * exp(-((gA-mean_g).^2)/(2*sigma_g.^2));
final = pr.*pg;

imwrite(final,"parametricROI1.jpg")

