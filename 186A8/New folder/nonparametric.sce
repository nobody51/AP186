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

BINS = 32;
rint = round(r*(BINS-1)+1);
gint = round(g*(BINS-1)+1);

//2d hist
colors = gint(:)+(rint(:)-1)*BINS;
hist = zeros(BINS,BINS);
for row = 1:BINS
    for col = 1:(BINS-row+1)
        hist(row,col) = length(find(colors==(((col+(row-1)*BINS)))));
    end;
end;

//original image
A = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A8\New folder\lolol.jpg");
A = double(A);
RA = A(:,:,1);
GA = A(:,:,2);
BA = A(:,:,3);
IntA = RA+GA+BA;
IntA(find(IntA==0)) = 1000000;
rA = RA./IntA;
gA = GA./IntA;


//hist projection
proj_array = zeros(size(rA,1),size(rA,2));
for i = 1:size(rA,1)
    for j = 1:size(rA,2)
        r_proj = round(rA(i,j)*(BINS-1) + 1);
        g_proj = round(gA(i,j)*(BINS-1) + 1);
        proj_array(i,j) = hist(r_proj,g_proj);
    end;
end

imwrite(hist,"ROI2hist.jpg");
imwrite(proj_array,"Final.jpg");

