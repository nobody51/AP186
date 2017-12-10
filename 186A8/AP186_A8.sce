////Grayscale image of a check

chec = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A8\check.jpg");
chec = rgb2gray(chec);
[count, cells] = imhist(chec, 256);
plot (cells, count);
isoview();
xs2png(gcf(), "A8PartA1.png")

BW = chec < 140;
imshow(BW); isoview();
imwrite(BW, "A8PartA2threshideal.png")

//for i = 50:10:200
//    scf(15);
//    clf(15);
//    
//    drawlater();
//    filename = "A8PartA2thresh " + string(i) + ".png"
//    BW = chec < i;
//    xtitle("Threshold =" + string(i))
//    imshow(BW); isoview();
//    xs2png(gcf(), filename)
//    drawnow();
//    
//end

//2D Histogram
J = imread("C:\users\jarmsmagalang\My Documents\College\5th Year\App Physics 186\AP186 A8\Gretag-Macbeth_ColorChecker.jpg");
go_on = 'y';
while go_on ~= 'n' do
    subplot(1,2,1)
    I = imcropm(J);
    I = double(I);
    R = I(:,:,1); G = I(:,:,2); B = I(:,:,3);
    Int = R+G+B;
    Int(find(Int == 0)) = 100000;
    r = R./Int; g = G./Int;
    BINS = 32
    rint = round(r*(BINS-1)+1);
    gint = round(g*(BINS-1)+1);
    colors = gint(:) + (rint(:)-1)*BINS;
    hist = zeros(BINS, BINS);
    for row = 1:BINS
        for col = 1:(BINS-row+1)
            hist(row,col) = length(find(colors==(((col+(row-1)*BINS)))));
        end;
    end;
    
    subplot(1,2,2);
    Matplot(imrotate(hist*255/max(hist), 90)); isoview();
    f = gcf(); f.color_map = rainbowcolormap(64);

    go_on = input("Again? y/n", "s");
    if go_on =='n' then break end;
end;
//
////Parametric Segmentation
//roi = double(imread("C:\users\jarmsmagalang\My Documents\College\5th Year\App Physics 186\AP186 A8\ROI4.png"));
//R = roi(:,:,1); G = roi(:,:,2); B = roi(:,:,3);
//Int = R+G+B;
//Int(find(Int == 0)) = 100000;
//r = R./Int; g = G./Int;
//
//mean_r = mean(r); sigma_r = stdev(r);
//mean_g = mean(g); sigma_g = stdev(g);
//
//img = double(imread("C:\users\jarmsmagalang\My Documents\College\5th Year\App Physics 186\AP186 A8\face.jpeg"));
//R_img = img(:,:,1); G_img = img(:,:,2); B_img = img(:,:,3);
//Int_img = R_img+G_img+B_img;
//Int_img(find(Int_img == 0)) = 100000;
//r_img = R_img./Int_img; g_img = G_img./Int_img;
//
//pr = (1/sigma_r*sqrt(2*%pi))*exp(-((r_img-mean_r).^2/(2*sigma_r.^2)))
//pg = (1/sigma_g*sqrt(2*%pi))*exp(-((g_img-mean_g).^2/(2*sigma_g.^2)))
//image = pr.*pg;
//
//f0 = scf(); imshow(image);
//
//Non-Parametric Segmentation
//roi = double(imread("C:\users\jarmsmagalang\My Documents\College\5th Year\App Physics 186\AP186 A8\ROI5.png"));
//R = roi(:,:,1); G = roi(:,:,2); B = roi(:,:,3);
//Int = R+G+B;
//Int(find(Int == 0)) = 100000;
//r = R./Int; g = G./Int;
//
//BINS = 32
//r_Int = round(r*(BINS-1)+1);
//g_Int = round(g*(BINS-1)+1);
//
//colors = g_Int(:)+(r_Int(:)-1)*BINS;
//hist = zeros(BINS, BINS);
//for row = 1:BINS
//    for col = 1:(BINS-row+1)
//        hist(row, col) = length(find(colors==(((col+(row-1)*BINS)))));
//    end;
//end;
//
//img = double(imread("C:\users\jarmsmagalang\My Documents\College\5th Year\App Physics 186\AP186 A8\face.jpeg"));
//R_img = img(:,:,1); G_img = img(:,:,2); B_img = img(:,:,3);
//Int_img = R_img+G_img+B_img;
//Int_img(find(Int_img == 0)) = 100000;
//r_img = R_img./Int_img; g_img = G_img./Int_img;
//
//proj_array = zeros(size(r_img,1), size(r_img,2));
//for i = 1:size(r_img, 1)
//    for j = 1:size(r_img,2)
//        r_proj = round(r_img(i,j)*(BINS-1)+1);
//        g_proj = round(g_img(i,j)*(BINS-1)+1);
//        proj_array(i,j) = hist(r_proj, g_proj);
//    end;
//end;
//
////f1 = scf(); imshow(hist);
//f2 = scf(); imshow(proj_array);
//
