for count=1:11
    I = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A10\segmented\parametricPen"+string(count)+".jpg");
    SE1 = imcreatese('ellipse',10,10);
    SE2 = imcreatese('ellipse',5,5);
    im1 = imclose(I,SE1);
    im2 = imopen(im1,SE1);
    imwrite(im2,"cleanPen"+string(count)+".jpg");
end
