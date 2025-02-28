




% ## The MATLAB path


% ## Comments

% ## Script for plotting -- Recap
  edit src/plot_patient_inflammation.m
----------------------------------------
  % *Script* to plot daily average, max and min inflammation.

  % Load patient data
  patient_data = readmatrix("data/base/inflammation-01.csv");
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  per_day_min = min(patient_data);
  patient = patient_data(5,:);
  day_of_trial = 1:40;

  fig = figure;
  clf;

  % Define tiled layout and labels
  tlo = tiledlayout(1,2);
  xlabel(tlo,"Day of trial")
  ylabel(tlo,"Inflammation")

  % Plot average inflammation per day with the patient data
  nexttile
  title("Average")
  hold on
  plot(day_of_trial, per_day_mean, "DisplayName", "Mean")
  plot(day_of_trial, patient, "DisplayName", "Patient 5")
  legend
  hold off

  % Plot max and min inflammation per day with the patient data
  nexttile
  title("Max and Min")
  hold on
  plot(day_of_trial, per_day_max, "DisplayName", "Max")
  plot(day_of_trial, patient, "DisplayName", "Patient 5")
  plot(day_of_trial, per_day_min, "DisplayName", "Min")
  legend
  hold off
----------------------------------------
  clear
  clc
  figure
  plot_patient_inflammation
  close all

% ## Help text

----------------------------------------
  % PLOT_PATIENT_INFLAMMATION   *Script* Plots daily average, max and min inflammation.
----------------------------------------
  help plot_patient_inflammation
% ### Saving figures
----------------------------------------
  % PLOT_PATIENT_INFLAMMATION   *Script* ...
  % ...
  % Save plot in "results" folder as png image:
  saveas(fig,"results/patient_5.png")
----------------------------------------

% ! Challenge:
% ## Plot patient N
% !! Solution:
----------------------------------------
  % PLOT_PATIENT_INFLAMMATION   *Script* Plots daily average, max and min inflammation.

  patient_number = 5;                                                  %%%
  pn_string = num2str(patient_number);                                 %%%

  % Load patient data
  patient_data = readmatrix("data/base/inflammation-01.csv");
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  per_day_min = min(patient_data);
  patient = patient_data(patient_number,:);                            %%%
  day_of_trial = 1:40;

  fig = figure;
  clf;

  % Define tiled layout and labels
  tlo = tiledlayout(1,2);
  xlabel(tlo,"Day of trial")
  ylabel(tlo,"Inflammation")

  % Plot average inflammation per day with the patient data
  nexttile
  title("Average")
  hold on
  plot(day_of_trial, per_day_mean, "DisplayName", "Mean")
  plot(day_of_trial, patient, "DisplayName", "Patient " + pn_string)   %%%
  legend
  hold off

  % Plot max and min inflammation per day with the patient data
  nexttile
  title("Max and Min")
  hold on
  plot(day_of_trial, per_day_max, "DisplayName", "Max")
  plot(day_of_trial, patient, "DisplayName", "Patient " + pn_string)   %%%
  plot(day_of_trial, per_day_min, "DisplayName", "Min")
  legend
  hold off

  % Save plot in "results" folder as png image:
  saveas(fig,"results/patient_" + pn_string + ".png")                  %%%
----------------------------------------



% ## Getting the current figure
  saveas(gcf,"results/patient_5.png")
  gcf == fig

% ### Hiding figures
----------------------------------------
  % PLOT_PATIENT_INFLAMMATION   *Script* Plots daily average, max and min inflammation.

  patient_number = 5;
  pn_string = num2str(patient_number);

  % Load patient data
  patient_data = readmatrix("data/base/inflammation-01.csv");
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  per_day_min = min(patient_data);
  patient = patient_data(patient_number,:);
  day_of_trial = 1:40;

  fig = figure(Visible='off');                             % The figure will not be displayed
  clf;

  % Define tiled layout and labels
  tlo = tiledlayout(1,2);
  xlabel(tlo,"Day of trial")
  ylabel(tlo,"Inflammation")

  % Plot average inflammation per day with the patient data
  nexttile
  title("Average")
  hold on
  plot(day_of_trial, per_day_mean, "DisplayName", "Mean")
  plot(day_of_trial, patient, "DisplayName", "Patient " + pn_string)
  legend
  hold off

  % Plot max and min inflammation per day with the patient data
  nexttile
  title("Max and Min")
  hold on
  plot(day_of_trial, per_day_max, "DisplayName", "Max")
  plot(day_of_trial, patient, "DisplayName", "Patient " + pn_string)
  plot(day_of_trial, per_day_min, "DisplayName", "Min")
  legend
  hold off

  % Save plot in "results" folder as png image:
  saveas(fig,"results/patient_" + pn_string + ".png")

  close(fig)                                               % Closes the hidden figure
----------------------------------------


