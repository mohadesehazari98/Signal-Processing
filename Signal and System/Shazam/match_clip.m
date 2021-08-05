function [ song_name ] = match_clip( clip_name )
% This function gives us the song that matches the most to our clip

idmatrix=zeros(1,1);
n=1;
[ pairs ] = pairsfind( clip_name );
[songID,hash ] = TABLE('Train');
L=length(songID);
index = ((pairs(4)-pairs(3))*(2^16))+(pairs(1)*(2^8))+pairs(2);
if hash(index,:,:)==0
    disp('sorry but can not find your song');
else
    while hash(index,1,n)~=0
    if idmatrix(n)==0
        idmatrix(n)=hash(index,1,n);
    else
        idmatrix=[idmatrix;hash(index,1,n)];
    end
    n=n+1;
    end
end
    for m=1:1:L
    if mode(idmatrix)==songID(m,1)
        song_name=songID(m,2);
    end
    end
end

