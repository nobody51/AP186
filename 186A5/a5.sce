// take an image and convert it to gray
im = imread('C:\Users\up csrc\Documents\186A5\test2.jpg');
grayIm = rgb2gray(im)
scf(0);
isoview();
imshow(grayIm);

//get the normalized histogram of the gray image
[counts, cells] = imhist(grayIm);
counts = counts/sum(counts);
//scf(1);
//plot(cells,counts);

//get the normalized cumulative distribution of the gray image
cdf = cumsum(counts);
//scf(2);
//plot(cells,cdf);

//produce ideal cdf
x = 0:255;
y = x * 1/255;
//scf(3);
//plot(x,y);

//take backprojection of current cdf to ideal cdf
backProject = cdf * 255;
scf(4);
plot(backProject,cdf);

fixedGrayIm = grayIm;

for i = 1:256
    fixedGrayIm(find(grayIm==i)) =backProject(i);
end
scf(5);
isoview();
imshow(fixedGrayIm);

