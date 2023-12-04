



  %LOOP_DEMO   Demo script to explain loops
  
  word = 'lead';
  
  disp(word(1))
  disp(word(2))
  disp(word(3))
  disp(word(4))
  %LOOP_DEMO   Demo script to explain loops
  
  word = 'tin';
  
  disp(word(1))
  disp(word(2))
  disp(word(3))
  disp(word(4))
  %LOOP_DEMO   Demo script to explain loops
  
  word = 'lead';
  
  for letter = 1:4
      disp(word(letter))
  end
  for variable = collection
      # Do things with variable
  end
  %LOOP_DEMO   Demo script to explain loops
  
  word = 'tin';
  
  for letter = 1:3
      disp(word(letter))
  end
  %LOOP_DEMO   Demo script to explain loops
  
  word = 'aluminum';
  
  for letter = 1:length(word)
      disp(word(letter))
  end
  %LOOP_DEMO   Demo script to explain loops
  
  total = 0;
  for even_number = 2 : 2 : 10
      total = total + even_number;
  end
  
  disp('The sum of all even numbers between 1 and 10 is:')
  disp(total)

% ## The debugger

  disp(even_number)

% ! Challenge:
% ## Performing Exponentiation
  disp(5^3)
% !! Solution:
  % Loop to perform exponentiation
  b = 4;    % base
  x = 5;    % exponent
  
  result=1;
  for i = 1:x
      result = result * b;
  end
  
  disp([num2str(b), '^', num2str(x), ' = ', num2str(result)])



% ! Challenge:
% ## Incrementing with Loops
% !! Solution:
  % spell a string adding one letter at a time using a loop
  
  word = 'aluminium';
  
  for letter = 1:length(word)
      disp(word(1:letter))
  end



% ! Challenge:
% ## Looping in Reverse
  disp(1:3:11)
  disp(11:-3:1)
% !! Solution:
  % Spell a string in reverse using a loop
  
  word = 'aluminium';
  
  for letter = length(word):-1:1
      disp(word(letter))
  end


% ## Analyzing patient data from multiple files
  files = dir('data/base/inflammation-*.csv')
  filename = files(1).name;
  disp(filename)
  mod_date = files(3).date;
  disp(mod_date)
  %PLOT_ALL	Developing code to automate inflammation analysis
  
  files = dir('data/base/inflammation-*.csv');
  
  for i = 1:length(files)
  	file_name = files(i).name;
  	disp(file_name)
  end
  plot_all
  NEWSTR = replace(STR, OLD, NEW)
  new_string = replace('big_shark', 'big', 'little');
  disp(new_string)

% ## GNU Octave
  new_string = strep('big_shark', 'big', 'little')
  little_shark

  %PLOT_ALL	Developing code to automate inflammation analysis
  
  files = dir('data/base/inflammation-*.csv');
  
  for i = 1:length(files)
      file_name = files(i).name;
  
      % Generate string for image name
      img_name = replace(file_name, '.csv', '.png');
  
      % Generate path to data file and image file
      file_name = fullfile('data', 'base', file_name);
      img_name = fullfile('results',img_name);
  
      disp(file_name)
      disp(img_name)
  end
  %PLOT_ALL   Print statistics for all patients.
  %           Save plots of statistics to disk.
  
  files = dir('data/base/inflammation-*.csv');
  
  % Process each file in turn
  for i = 1:length(files)
      file_name = files(i).name;
  
      % Generate strings for image names:
      img_name  = replace(file_name, '.csv', '.png');
  
      % Generate path to data file and image file
      file_name = fullfile('data', 'base', file_name);
      img_name  = fullfile('results', img_name);
  
      plot_daily_average(file_name, img_name);
  
  end
  plot_all

% ! Challenge:
% ## Investigating patients with a high mean
% !! Solution:
  % PLOT_HIGH_MEAN_PATIENTS   Saves plots of patients with mean inflammation higher than the global mean inflammation.
  
  patient_data = readmatrix('data/base/inflammation-01.csv');
  
  per_day_mean = mean(patient_data);
  global_mean =  mean(patient_data(:));
  
  number_of_patients = size(patient_data,1);
  
  for patient_id = 1:number_of_patients
  
      patient_mean = mean(patient_data(patient_id,:));
  
      if(patient_mean > global_mean)
          patient_reference = "Patient " + string(patient_id)
          patient_vs_mean(per_day_mean, patient_data(patient_id,:), patient_reference)
      end
  
  end




