



----------------------------------------
  % *Script* to illustrate use of conditionals
  num = 127;
  disp('before conditional...')

  if num > 100
      disp('The number is greater than 100')
  end

  disp('...after conditional')
----------------------------------------
----------------------------------------
  % *Script* to illustrate use of conditionals
  num = 53;
  disp('before conditional...')

  if num > 100
      disp('The number is greater than 100')
  else
      disp('The number is not greater than 100')
  end

  disp('...after conditional')
----------------------------------------
----------------------------------------
  % *Script* to illustrate use of conditionals
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
----------------------------------------
----------------------------------------
  % *Script* to illustrate use of conditionals

  num = 53;

  if num > 0
      disp('num is positive')
  elseif num == 0
      disp('num is zero')
  else
      disp('num is negative')
  end
----------------------------------------
----------------------------------------
  % *Script* to illustrate use of conditionals
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
----------------------------------------
  if ((1 > 0) && (-1 > 0))
      disp('both parts are true')
  else
      disp('At least one part is not true')
  end
  if (1 < 0) || (3 < 4)
      disp('At least one part is true')
  end

% ! Challenge:
% ## Close Enough
% !! Solution:
----------------------------------------
  %NEAR   *Script* that displays 1 if variable a is within 10% of variable b and 0 otherwise.
  a = 1.1;
  b = 1.2;

  if a/b >= 0.9 && a/b <= 1.1
      disp(1)
  else
      disp(0)
  end
----------------------------------------



% ! Challenge:
% ## Scripts with choices
% !! Solution:
----------------------------------------
  % PLOT_PATIENT_INFLAMMATION_OPTION   *Script* Plots daily average, max and min inflammation.
  % If save_plots is set to true, the figures are saved to disk.
  % If save_plots is set to false, the figures are displayed on the screen.

  save_plots = true;

  patient_number = 5;
  pn_string = num2str(patient_number);

  % Load patient data
  patient_data = readmatrix("data/base/inflammation-01.csv");
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  per_day_min = min(patient_data);
  patient = patient_data(patient_number,:);
  day_of_trial = 1:40;

  if save_plots == true
      figure(visible='off')
  else
      figure
  end
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

  if save_plots == true 
      % Save plot in "results" folder as png image:
      saveas(fig,"results/patient_" + pn_string + ".png")

      close(fig)
----------------------------------------




