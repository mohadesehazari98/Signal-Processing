request=input('1.finding clips/2.adding songs');
switch request
    case 1
    clip_name=input('please enter your clip name in .mp3 format','s');
    [ song_name ] = match_clip( clip_name );
    disp(song_name);
    case 2
        x=input(' hey please add your song to the Train folder and when you did press 1');
       while x~=1
           x=input(' hey please add your song to the Train folder and when you did press 1');
       end
       [ songID,hash ] = TABLE('Train');
    otherwise
    input('wrong number');
end
