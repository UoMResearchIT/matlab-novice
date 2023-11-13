



  num = 37;
  
  if num > 100
      disp('greater')
  else
      disp('not greater')
  end
  
  disp('done')
  num = 53;
  disp('before conditional...')
  
  if num > 100
      disp('53 is greater than 100')
  end
  
  disp('...after conditional')
  %CONDITIONAL_DEMO   Demo script to illustrate use of conditionals
  
  num = 53;
  
  if num > 0
      disp('num is positive')
  elseif num == 0
      disp('num is zero')
  else
      disp('num is negative')
  end
  % Demo script to illustrate use of conditionals
  num = 53;
  
  if num > 0
      disp('num is positive')
  elseif num == 0
      disp('num is zero')
  elseif num > 50
      % This block will never be executed
      disp('num is greater than 50')
  else
      disp('num is negative')
  end
  if ((1 > 0) && (-1 > 0))
      disp('both parts are true')
  else
      disp('one part is not true')
  end
  if (1 < 0) || (3 < 4)
      disp('at least one part is true')
  end

% ! Challenge:
% ## True and False Statements
  if ''
      disp('empty string is true')
  else
      disp('empty string is false')
  end
  
  if 'foo'
      disp('non empty string is true')
  else
      disp('non empty string is false')
  end
  
  if []
      disp('empty array is true')
  else
      disp('empty array is false')
  end
  
  if [22.5, 1.0]
      disp('non empty array is true')
  else
      disp('non empty array is false')
  end
  
  if [0, 0]
      disp('array of zeros is true')
  else
      disp('array of zeros is false')
  end
  
  if true
      disp('true is true')
  else
      disp('true is false')
  end


% ! Challenge:
% ## Close Enough
% !! Solution:
  %NEAR   Display 1 if variable a is within 10% of variable b
  %       and display 0 otherwise
  a = 1.1;
  b = 1.2;
  
  if a/b >= 0.9 && a/b <= 1.1
      disp(1)
  else
      disp(0)
  end


  numbers = [-5, 3, 2, -1, 9, 6];
  total = 0;
  
  for n = numbers
      if n >= 0
          total = total + n;
      end
  end
  
  disp(['sum of positive values: ', num2str(total)])
  pos_total = 0;
  neg_total = 0;
  
  for n = numbers
      if n >= 0
          pos_total = pos_total + n;
      else
          neg_total = neg_total + n;
      end
  end
  
  disp(['sum of positive values: ', num2str(pos_total)])
  disp(['sum of negative values: ', num2str(neg_total)])
  for number = 1:3
      for letter = 'ab'
          disp([num2str(number), letter])
      end
  end

% ! Challenge:
% ## Nesting
% !! Solution:
  for letter = 'ab'
      for number = 1:3
          disp([num2str(number), letter])
      end
  end


  print(img_name,'-dpng')
  close()
  figure(visible='off')
  figure(visible='on')
  % or equivalently: figure()
  %PLOT_ALL  Save plots of statistics to disk.
  %          Use variable plot_switch to control interactive plotting
  %          vs saving images to disk.
  %            plot_switch = 0: show plots interactively
  %            plot_switch = 1: save plots to disk
  
  plot_switch = 0;
  
  files = dir('data/inflammation-*.csv');
  
  % Process each file in turn
  for i = 1:length(files)
      file_name = files(i).name;
  
      % Generate strings for image names:
      img_name = replace(file_name, '.csv', '.png');
  
      % Generate path to data file and image file
      file_name = fullfile('data', filename);
      img_name  = fullfile('results', img_name);
  
      patient_data = readmatrix(file_name);
  
      % Create figures
      if plot_switch == 1
          figure(visible='off')
      else
          figure(visible='on')
      end
  
      tlo = tiledlayout(1,3);
      xlabel(tlo,'Day of trial')
      ylabel(tlo,'Inflammation')
  
      nexttile
      plot(mean(patient_data, 1))
      title('Average')
  
      nexttile
      plot(max(patient_data, [], 1))
      title('Max')
  
      nexttile
      plot(min(patient_data, [], 1))
      title('Min')
  
      if plot_switch == 1
          print(img_name, '-dpng')
          close()
      end
  
  end


