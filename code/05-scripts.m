



  edit src/patient_analysis.m

% ## The MATLAB path

  % Load patient data
  patient_data = readmatrix('data/base/inflammation-01.csv');
  
  % Compute global statistics
  g_mean = mean(patient_data(:));
  g_max = max(patient_data(:));
  g_min = min(patient_data(:));
  
  % Compute patient statistics
  p_mean = mean(patient_data(5,:));
  p_max = max(patient_data(5,:));
  p_min = min(patient_data(5,:));
  
  % Compare patient vs global
  disp('Patient 5:')
  disp('High mean?')
  disp(p_mean > g_mean)
  disp('Highest max?')
  disp(p_max == g_max)
  disp('Lowest min?')
  disp(p_min == g_min)

% ## Comments

  clear
  clc
  patient_analysis
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
  patient_analysis

% ## Help text

  % PATIENT_ANALYSIS   Computes mean, max and min of a patient and compares to global statistics.
  help patient_analysis
% ## Script for plotting
  edit src/plot_daily_average.m
  % PLOT_DAILY_AVERAGE   Plots daily average inflammation accross patients.
  
  % Load patient data
  patient_data = readmatrix('data/base/inflammation-01.csv');
  
  figure
  
  % Plot average inflammation per day
  plot(mean(patient_data, 1))
  title('Daily average inflammation')
  xlabel('Day of trial')
  ylabel('Inflammation')
  figure
  plot_daily_average
% ### Modified script for sub-plots
  % PLOT_DAILY_AVERAGE   Plots daily average, max and min inflammation accross patients.
  
  % Load patient data
  patient_data = readmatrix('data/base/inflammation-01.csv');
  
  figure
  
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
  % Save plot in 'results' folder as png image:
  print('results/daily_average_01','-dpng')

  % Save plot in 'results' folder as png image:
  saveas(gcf,'results/daily_average_01.png')

  % PLOT_DAILY_AVERAGE   Saves plot of daily average, max and min inflammation accross patients.
  
  % Load patient data
  patient_data = readmatrix('data/base/inflammation-01.csv');
  
  figure(visible='off')
  
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
  
  % Save plot in 'results' folder as png image:
  saveas(gcf,'results/daily_average_01.png')
  
  close()


