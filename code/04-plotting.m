



% ## Plotting
  plot(1:40,per_day_mean)




  title('Daily average inflammation')
  xlabel('Day of trial')
  ylabel('Inflammation')
  plot(per_day_max)
  title('Maximum inflammation per day')
  ylabel('Inflammation')
  xlabel('Day of trial')
  plot(per_day_min)
  title('Minimum inflammation per day')
  ylabel('Inflammation')
  xlabel('Day of trial')
% ## Multiple lines in a plot
  plot(per_day_mean,DisplayName="Mean")
  legend
  title('Daily average inflammation')
  xlabel('Day of trial')
  ylabel('Inflammation')
  hold on
  plot(patient_5,DisplayName="Patient 5")
  hold off

% ! Challenge:
% ## Patients 3 & 4
% !! Solution:
  plot(per_day_mean,DisplayName="Mean")
  legend
  title('Daily average inflammation')
  xlabel('Day of trial')
  ylabel('Inflammation')
  hold on
  plot(patient_data(3,:),DisplayName="Patient 3")
  plot(patient_data(4,:),DisplayName="Patient 4")
  hold off


% ## Multiple plots in a figure
  tiledlayout(1, 2)
  nexttile
  plot(per_day_max)
  title('Max')
  xlabel('Day of trial')
  ylabel('Inflamation')
  nexttile
  plot(per_day_min)
  title('Min')
  xlabel('Day of trial')
  ylabel('Inflamation')
  tlo=tiledlayout(1, 2)
  title(tlo,'Per day data')
  xlabel(tlo,'Day of trial')
  ylabel(tlo,'Inflamation')
  nexttile
  plot(per_day_max)
  title('Max')
  nexttile
  plot(per_day_min)
  title('Min')

% ## Clearing a figure

% ## Heatmaps
  heatmap(patient_data)
  title('Inflammation')
  xlabel('Day of trial')
  ylabel('Patient number')
  imagesc(patient_data)
  title('Inflammation')
  xlabel('Day of trial')
  ylabel('Patient number')


