kobe = imread('kobe.jpeg');

%%
% scale 1/5
kobe_5 = imresize(kobe, 0.2);
%figure, imshow(kobe), figure, imshow(kobe_5)

%%
% scale 5
kobe_50 = imresize(kobe_5, 5 ,'nearest');
%figure, imshow(kobe_5), figure, imshow(kobe_50)

%%
redChannel =   kobe_50(:, :, 1);
greenChannel = kobe_50(:, :, 2);
blueChannel =  kobe_50(:, :, 3);

%avgmoving
avgmoving = [0.1111 0.1111 0.1111;0.1111 0.1111 0.1111;0.1111 0.1111 0.1111];
%gauss
gauss = [0.0113 0.0838 0.0113;0.0838 0.6193 0.0838;0.0113 0.1111 0.0113];

filteredImage(:,:,1) = conv2(double(gauss), double(redChannel));
filteredImage(:,:,2) = conv2(double(gauss), double(greenChannel));
filteredImage(:,:,3) = conv2(double(gauss), double(blueChannel));


filteredimage(:,:,1) = conv2(double(avgmoving), double(filteredImage(:, :, 1)));
filteredimage(:,:,2) = conv2(double(avgmoving), double(filteredImage(:, :, 2)));
filteredimage(:,:,3) = conv2(double(avgmoving), double(filteredImage(:, :, 3)));
figure
imshow(uint8(filteredimage));









