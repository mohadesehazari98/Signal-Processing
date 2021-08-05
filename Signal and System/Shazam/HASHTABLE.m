function [ hash ] = HASHTABLE(pairs,hash,ID )
%This function will make a hash table for us
index = ((pairs(4)-pairs(3))*(2^16))+(pairs(1)*(2^8))+pairs(2);
    for n=1:1:1000
        if hash(index,1,n)==0
            hash(index,1,n)=ID;
            hash(index,2,n)=t1;
            hash(index,1,n+1)=0;
        end
    end
end