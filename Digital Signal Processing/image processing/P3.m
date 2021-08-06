page = imread('page.jpg');
page_bw = rgb2gray(page);

%lineH
lineH = [-1 -1 -1;2 2 2;-1 -1 -1];

%lineV
lineV = [-1 2 -1;-1 2 -1;-1 2 -1];

filteredImage_H = conv2(double(lineH), double(page_bw));
filteredImage_V = conv2(double(lineV), double(page_bw));

H = uint8(filteredImage_H);
V = uint8(filteredImage_V);

%H length / V width
[a,b] = size(H);
%[a,b] = size(V); here we know their size are equal so 
out_H = zeros(a,2);
out_V = zeros(2,b);

for i=1:1:a
    out_H(i,1) = sum(H(i,:));
    out_H(i,2) = i;
end
out_H_D = sortrows(out_H,1);

for j=1:1:b
    out_V(1,j) = sum(V(:,j));
    out_V(2,j) = j;
end
out_V_D = sortrows(out_V',1);

figure
imshow(page);
hold on
r = rectangle('position',[275 690 2440 1750]);
r.EdgeColor = 'r';
title('edge-detection-mohadeseh')
%figure
%imshow(uint8(filteredImage_V));















