 [x, Fs] = audioread( 'AliLikesToWrite.wav'); 
 sign_x = sign(x); 
 sound(sign_x, Fs)
