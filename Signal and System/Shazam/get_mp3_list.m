function song_list = get_mp3_list(directory)
  dir_object = dir(directory);

  full_list = cell(size(dir_object));
  for i=1:size(dir_object,1)
    full_list{i} = dir_object(i).name;
  end
  
  song_list = cell(size(full_list));
  counter=1;
  for ii = 1 : size(full_list, 1)
    if ~isempty(strfind(full_list{ii}, '.mp3'))
      song_list{counter} = full_list{ii};
      counter = counter + 1;
    end
  end
  if counter == 1
    disp('No MP3s Found'); 
  end
  
  % Reduce list to correct length
  song_list = song_list(1:counter-1);
end
