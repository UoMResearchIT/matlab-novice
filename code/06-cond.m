



  num = 127;
  disp('before conditional...')
  
  if num > 100
      disp('The number is greater than 100')
  end
  
  disp('...after conditional')
  num = 53;
  disp('before conditional...')
  
  if num > 100
      disp('The number is greater than 100')
  else
      disp('The number is not greater than 100')
  end
  
  disp('...after conditional')
  num = 53;
  
  disp('before conditional...')
  if num > 100
      disp('The number is greater than 100')
  else
      disp('The number is not greater than 100')
      if num > 50
          disp('But it is greater than 50...')
      end
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
      disp('At least one part is not true')
  end
  if (1 < 0) || (3 < 4)
      disp('At least one part is true')
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


% ## Scripts with choices
  % PLOT_DAILY_AVERAGE_OPTION   Plots daily average, max and min inflammation across patients. If save_plots is set to 
  % true, the figures are saved to disk. If save_plots is set to false, the figures are displayed on the screen.
  
  % Load patient data
  patient_data = readmatrix('data/base/inflammation-01.csv');
  
  save_plots=true;
  
  if save_plots == true
      figure(visible='off')
  else
      figure
  end
  
  % Define tiled layout and labels
  tlo = tiledlayout(1,3);
  xlabel(tlo,'Day of trial')
  ylabel(tlo,'Inflammation')
  
  % Plot average inflammation per day
  nexttile
  plot(mean(patient_data, 1))
  title('Average')
  
  % Plot max inflammation per day
  nexttile
  plot(max(patient_data, [], 1))
  title('Max')
  
  % Plot min inflammation per day
  nexttile
  plot(min(patient_data, [], 1))
  title('Min')
  
  if save_plots == true 
      % Save plot in 'results' folder as png image:
      saveas(gcf,'results/daily_average_01.png')
  
      close()
  
  end

% ! Challenge:
% ## Changing behaviour based on patient data
  % Load patient data
  patient_data = readmatrix('data/base/inflammation-01.csv');
  
  % Compute global statistics
  g_mean = mean(patient_data(:));
  g_max = max(patient_data(:));
  g_min = min(patient_data(:));
  
  patient_number = 8;
  
  % Compute patient statistics
  p_mean = mean(patient_data(patient_number,:));
  p_max = max(patient_data(patient_number,:));
  p_min = min(patient_data(patient_number,:));
  
  % Compare patient vs global
  disp('Patient:')
  disp(patient_number)
  disp('High mean?')
  disp(p_mean > g_mean)
  disp('Highest max?')
  disp(p_max == g_max)
  disp('Lowest min?')
  disp(p_min == g_min)
% !! Solution:
  % Load patient data
  patient_data = readmatrix('data/base/inflammation-01.csv');
  
  % Compute global statistics
  g_mean = mean(patient_data(:));
  g_max = max(patient_data(:));
  g_min = min(patient_data(:));
  
  patient_number = 8;
  
  % Compute patient statistics
  p_mean = mean(patient_data(patient_number,:));
  p_max = max(patient_data(patient_number,:));
  p_min = min(patient_data(patient_number,:));
  
  % Compare patient vs global
  disp('Patient:')
  disp(patient_number)
  
  printed_something = false;
  
  if p_mean > g_mean
      disp('Patient''s mean inflammation is higher than the global mean inflammation.')
      printed_something = true;
  end
  
  if p_max == g_max
      disp('Patient''s maximum inflammation is the same as the global maximum.')
      printed_something = true;
  end
  
  if p_min == g_min
      disp('Patient''s minimum inflammation is the same as the global minimum.')
      printed_something = true;
  end
  
  if printed_something == false
      disp('Patient''s mean, maximum and minimum inflammation are not of interest.')
  end
  




