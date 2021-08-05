function [ songID,L ] = SONGID_DB( filen)
% SONGID_DB is a function that will take the name of the song and will give
% its ID
%consider that there is a matrix calles songID
songID=get_mp3_list(filen);
b=length(songID);
a= 1:1:b;
a=a';
L=length(a);
songID=[a,songID];
end

