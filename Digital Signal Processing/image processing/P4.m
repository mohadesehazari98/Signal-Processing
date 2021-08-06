one = imread('1.pgm');
imshow(one)
one_d = double(one);
%%
%mesh
figure
mesh(abs(one_d))
title('40-1.pgm ABS')
figure
mesh(angle(one_d))
title('40-1.pgm ANGLE')
%%
%fourier transform
one_F = fft2(one);
one_FS = fftshift(one_F);
figure
mesh(abs(one_FS))
title('40-1.pgm ABS Fourier Transform')
figure
mesh(angle(one_FS))
title('40-1.pgm ANGLE Fourier Transform')
%%
%with gaussian noise
SNR = 0.25;
out_abs = awgn(abs(one_F),SNR);
out_angle = awgn(angle(one_F),SNR);

%%
%Q1
X = abs(one_F) .* exp(1i .* out_angle) ;

x = ifft2( X );
x = abs(x);
imshow(uint8(x))

%%
%Q2
X = out_abs .* exp(1i .* angle(one_F)) ;

x = ifft2( X );
x = abs(x);
imshow(uint8(x))
%%




