House = imread('house.jpg');
redChannel = House(:, :, 1);
greenChannel = House(:, :, 2);
blueChannel = House(:, :, 3);

%%
%sharpen
sharpen = [0 -1 0;-1 5 -1;0 -1 0];
filteredImage(:,:,1) = conv2(double(sharpen), double(redChannel));
filteredImage(:,:,2) = conv2(double(sharpen), double(greenChannel));
filteredImage(:,:,3) = conv2(double(sharpen), double(blueChannel));
imshow(uint8(filteredImage));


%%
%blur
blur = [0.0625 0.125 0.0625;0.125 0.25 0.125;0.0625 0.125 0.0625];
filteredImage(:,:,1) = conv2(double(blur), double(redChannel));
filteredImage(:,:,2) = conv2(double(blur), double(greenChannel));
filteredImage(:,:,3) = conv2(double(blur), double(blueChannel));
imshow(uint8(filteredImage));


%%
%outline
outline = [-1 -1 -1;-1 8 -1;-1 -1 -1];
filteredImage(:,:,1) = conv2(double(outline), double(redChannel));
filteredImage(:,:,2) = conv2(double(outline), double(greenChannel));
filteredImage(:,:,3) = conv2(double(outline), double(blueChannel));
imshow(uint8(filteredImage));


%%
%gauss
gauss = [0.0113 0.0838 0.0113;0.0838 0.6193 0.0838;0.0113 0.1111 0.0113];
filteredImage(:,:,1) = conv2(double(gauss), double(redChannel));
filteredImage(:,:,2) = conv2(double(gauss), double(greenChannel));
filteredImage(:,:,3) = conv2(double(gauss), double(blueChannel));
imshow(uint8(filteredImage));


%%
%avgmoving
avgmoving = [0.1111 0.1111 0.1111;0.1111 0.1111 0.1111;0.1111 0.1111 0.1111];
filteredImage(:,:,1) = conv2(double(avgmoving), double(redChannel));
filteredImage(:,:,2) = conv2(double(avgmoving), double(greenChannel));
filteredImage(:,:,3) = conv2(double(avgmoving), double(blueChannel));
imshow(uint8(filteredImage));


%%
%lineH
lineH = [-1 -1 -1;2 2 2;-1 -1 -1];
filteredImage(:,:,1) = conv2(double(lineH), double(redChannel));
filteredImage(:,:,2) = conv2(double(lineH), double(greenChannel));
filteredImage(:,:,3) = conv2(double(lineH), double(blueChannel));
imshow(uint8(filteredImage));


%%
%lineV
lineV = [-1 2 -1;-1 2 -1;-1 2 -1];
filteredImage(:,:,1) = conv2(double(lineV), double(redChannel));
filteredImage(:,:,2) = conv2(double(lineV), double(greenChannel));
filteredImage(:,:,3) = conv2(double(lineV), double(blueChannel));
imshow(uint8(filteredImage));


%%
%identity
identity = [0 0 0;0 1 0;0 0 0];
filteredImage(:,:,1) = conv2(double(identity), double(redChannel));
filteredImage(:,:,2) = conv2(double(identity), double(greenChannel));
filteredImage(:,:,3) = conv2(double(identity), double(blueChannel));
imshow(uint8(filteredImage));






