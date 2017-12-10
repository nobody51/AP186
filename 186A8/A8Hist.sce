J = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A8\New folder\color.png");
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
