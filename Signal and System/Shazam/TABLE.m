function [ songID,hash ] = TABLE( file )
%this function will create two data table
[ songID,L ] = SONGID_DB( file);
if L==1
    hash=zeros(900000,2,1);
end
name=char(songID(L,2));
pairs=pairsfind(name);
[ hash ] = HASHTABLE(pairs,hash,songID(L,1));
end

