



% ## Plotting
  day_of_trial = 1:40;
  plot(day_of_trial, per_day_mean)




  title("Daily average inflammation")
  xlabel("Day of trial")
  ylabel("Inflammation")
  plot(day_of_trial, per_day_max)
  title("Maximum inflammation per day")
  ylabel("Inflammation")
  xlabel("Day of trial")

% ## Scripts
  edit src/single_plot.m
  addpath("src")

  day_of_trial = 1:40;
  plot(day_of_trial, per_day_min)
  title("Minimum inflammation per day")
  ylabel("Inflammation")
  xlabel("Day of trial")
% ## Multiple lines in a plot
  copyfile("src/single_plot.m","src/multiline_plot.m")
  day_of_trial = 1:40;
  plot(day_of_trial, per_day_mean, DisplayName="Mean")
  legend
  title("Daily average inflammation")
  xlabel("Day of trial")
  ylabel("Inflammation")
  hold on
  plot(day_of_trial, patient_5, DisplayName="Patient 5")
  hold off

% ! Challenge:
% ## Patients 3 & 4
% !! Solution:
  day_of_trial = 1:40;
  plot(day_of_trial, per_day_mean, DisplayName="Mean")
  legend
  title("Daily average inflammation")
  xlabel("Day of trial")
  ylabel("Inflammation")
  hold on
  plot(day_of_trial, patient_data(3,:), DisplayName="Patient 3")
  plot(day_of_trial, patient_data(4,:), DisplayName="Patient 4")
  hold off


% ## Multiple plots in a figure
  edit src/tiled_plot.m
  day_of_trial = 1:40;
  tiledlayout(1, 2)
  nexttile
  plot(day_of_trial, per_day_max)
  title("Max")
  xlabel("Day of trial")
  ylabel("Inflamation")
  nexttile
  plot(day_of_trial, per_day_min)
  title("Min")
  xlabel("Day of trial")
  ylabel("Inflamation")
  day_of_trial = 1:40;
  tlo=tiledlayout(1, 2);
  title(tlo,"Per day data")
  xlabel(tlo,"Day of trial")
  ylabel(tlo,"Inflamation")
  nexttile
  plot(day_of_trial, per_day_max)
  title("Max")
  nexttile
  plot(day_of_trial, per_day_min)
  title("Min")

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


