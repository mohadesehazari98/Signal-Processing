A = imread('a.pgm');
B = imread('b.pgm');
figure; imshow(A)
figure; imshow(B)

A_d = double(A);
B_d = double(B);

%%
%fourier transform
A_F = fft2(A);
B_F = fft2(B);
A_FS = fftshift(A_F);
B_FS = fftshift(B_F);

figure
subplot(2,1,1)
mesh(abs(A_FS))
title('7-1.pgm ABS Fourier Transform')
subplot(2,1,2)
mesh(angle(A_FS))
title('7-1.pgm ANGLE Fourier Transform')
figure
subplot(2,1,1)
mesh(abs(B_FS))
title('25-1.pgm ABS Fourier Transform')
subplot(2,1,2)
mesh(angle(B_FS))
title('25-1.pgm ANGLE Fourier Transform')

%%
%A
X = abs(A_F) .* exp(1i .* angle(B_F)) ;

x = ifft2( X );
x = abs(x);
imshow(uint8(x))

%%
%B
X = abs(B_F) .* exp(1i .* angle(A_F)) ;

x = ifft2( X );
x = abs(x);
imshow(uint8(x))
%%




