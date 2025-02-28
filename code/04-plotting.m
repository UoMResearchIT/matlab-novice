



% ## Plotting
  patient_data = readmatrix("data/base/inflammation-01.csv");
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  patient_5 = patient_data(5,:);
  day_of_trial = 1:40;
  plot(day_of_trial, per_day_mean)




  title("Daily average inflammation")
  xlabel("Day of trial")
  ylabel("Inflammation")
  plot(day_of_trial, per_day_max)

% ## Scripts
  edit src/single_plot.m
  addpath("src")
----------------------------------------
  % *Script* to load data and plot inflammation values

  % Load the data
  patient_data = readmatrix("data/base/inflammation-01.csv");
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  patient_5 = patient_data(5,:);
  day_of_trial = 1:40;

  % Plot
  plot(day_of_trial, per_day_mean)
  title("Mean inflammation per day")
  xlabel("Day of trial")
  ylabel("Inflammation")
----------------------------------------

----------------------------------------
  % *Script* to load data and plot inflammation values
  %...
  plot(day_of_trial, per_day_max)
  title("Maximum inflammation per day")
  %...
----------------------------------------
% ## Multiple lines in a plot
  copyfile("src/single_plot.m","src/multiline_plot.m")
----------------------------------------
  % *Script* to load data and plot multiple lines on the same plot

  % Load the data
  patient_data = readmatrix("data/base/inflammation-01.csv");
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  patient_5 = patient_data(5,:);
  day_of_trial = 1:40;

  % Plot
  plot(day_of_trial, per_day_mean, DisplayName="Mean")    % Added DisplayName
  legend                                                  % Turns on legend
  title("Daily average inflammation")
  xlabel("Day of trial")
  ylabel("Inflammation")
----------------------------------------
----------------------------------------
  % *Script* to load data and plot multiple lines on the same plot
  %...
  hold on
  plot(day_of_trial, patient_5, DisplayName="Patient 5")
  hold off
----------------------------------------

% ! Challenge:
% ## Patients 3 & 4
% !! Solution:
----------------------------------------
  % *Script* to load data and plot multiple lines on the same plot
  %...
  % Plot
  plot(day_of_trial, per_day_mean, DisplayName="Mean")
  legend
  title("Daily average inflammation")
  xlabel("Day of trial")
  ylabel("Inflammation")
  hold on
  plot(day_of_trial, patient_data(3,:), DisplayName="Patient 3")
  plot(day_of_trial, patient_data(4,:), DisplayName="Patient 4")
  hold off
----------------------------------------


% ## Multiple plots in a figure
  edit src/tiled_plot.m
----------------------------------------
  % *Script* to load data and add multiple plots to a figure

  % Load the data
  patient_data = readmatrix("data/base/inflammation-01.csv");
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  per_day_min = min(patient_data);    % Added min values
  patient_5 = patient_data(5,:);
  day_of_trial = 1:40;

  % Plot
  tiledlayout(1, 2)                   % Grid of 1 row and 2 columns
  nexttile                            % First plot, on tile 1,1
  plot(day_of_trial, per_day_max)
  title("Max")
  xlabel("Day of trial")
  ylabel("Inflamation")
  nexttile                            % Second plot, on tile 1,2
  plot(day_of_trial, per_day_min)
  title("Min")
  xlabel("Day of trial")
  ylabel("Inflamation")
----------------------------------------
----------------------------------------
  % *Script* to load data and add multiple plots to a figure
  %...
  % Plot
  tlo=tiledlayout(1, 2);              % Saves the tiled layout to a variable
  title(tlo,"Per day data")           % Title for the whole layout
  xlabel(tlo,"Day of trial")          % Shared x label
  ylabel(tlo,"Inflamation")           % Shared y label
  nexttile
  plot(day_of_trial, per_day_max)
  title("Max")
  nexttile
  plot(day_of_trial, per_day_min)
  title("Min")
----------------------------------------

% ## Where is the `nexttile`?
  tiledlayout(3,5)
  nexttile(3)


% ## Resizing tiles
  nexttile([3,1])
  nexttile(8,[2,3])
  nexttile(1,[2,2])


% ## Clearing a figure
  clf

% ## Heatmaps
  heatmap(patient_data)
  title("Inflammation")
  xlabel("Day of trial")
  ylabel("Patient number")
  imagesc(patient_data)
  title("Inflammation")
  xlabel("Day of trial")
  ylabel("Patient number")


