// take an image and convert it to gray
im = imread('C:\Users\up csrc\Documents\186A5\test2.jpg');
grayIm = rgb2gray(im)
scf(0);
isoview();
imshow(grayIm);
xs2png(gcf(),'grayImage');

//get the normalized histogram of the gray image
[counts, cells] = imhist(grayIm);
counts = counts/sum(counts);
scf(1);
plot(cells,counts);
xs2png(gcf(),'grayImageHist');

//get the normalized cumulative distribution of the gray image
cdf = cumsum(counts);
scf(2);
plot(cells,cdf);
xs2png(gcf(),'grayImageCDF');

//produce ideal cdf
k = 0.05
x = 0:255;
y = (1/(1+exp(-k*(x-127.5))));
scf(3);
plot(x,y);
xs2png(gcf(),'idealSigCDF');

//take backprojection of current cdf to ideal cdf
backProject = cdf * 255^2;
scf(4);
plot(backProject,cdf);
//xs2png(gcf(),'grayImageSigBP');

//implement backprojection to the old image to get the new image
fixedGrayIm = grayIm;

for i = 1:256
    fixedGrayIm(find(grayIm==i)) =round(sqrt(backProject(i)));
end
scf(5);
isoview();
imshow(fixedGrayIm);
xs2png(gcf(),'grayImageFixed');

//check histogram and cdf of new image
[newCounts, newCells] = imhist(fixedGrayIm);
newCounts = newCounts/sum(newCounts);
scf(6);
plot(cells,newCounts);
xs2png(gcf(),'grayImageFixedHist');

newCdf = cumsum(newCounts);
scf(7);
plot(cells,newCdf);
xs2png(gcf(),'grayImageFixedCDF');
