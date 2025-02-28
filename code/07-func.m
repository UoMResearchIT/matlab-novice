



% ## Writing functions from scratch
  A = 0.275
  B = 5.634
  inf = (swell + B)*A
----------------------------------------
  function [out1, out2] = function_name(in1, in2)
      % FUNCTION_NAME   Function description
      %    Can add more text for the help
      %    An example is always useful!

      % This section below is called the body of the function
      out1 = calculation using in1 and in2;
      out2 = another calculation;
  end
----------------------------------------
----------------------------------------
  function inf = inflammation_swell_to_inf(swell)
     % INFLAMMATION_SWELL_TO_INF  Convert inflammation measured in Swellocity to inflammation measured in Inflammatons.

     A = 0.275;
     B = 5.634;

     inf = (swell + B)*A;
  end
----------------------------------------
  inflammation_swell_to_inf(0.5)
  val_in_inf = inflammation_swell_to_inf(0.5)

% ! Challenge:
% ## Writing your own conversion function
  A = 0.275
  B = 5.634
  inf = (swell + B)*A
% !! Solution:
----------------------------------------
  function swell = inflammation_inf_to_swell(inf)
     % INFLAMMTION_INF_TO_SWELL   Convert inflammation measured in Inflammatons to inflammation measured in Swellocity.

     A = 0.275;
     B = 5.634;

     swell = inf/A - B;
  end
----------------------------------------



% ## Functions that work on arrays

% ## Transforming scripts into functions
----------------------------------------
  function plot_patient_inflammation_option(patient_number, save_plots)
     % PLOT_PATIENT_INFLAMMATION_OPTION   Plots daily average, max and min inflammation.
     %    Inputs:
     %       patient_number - The patient number to plot
     %       save_plots - A boolean to decide whether to save the plot to disk (if true) or display it on screen (if false).
     %    Sample usage:
     %       plot_patient_inflammation_option(5, false)

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
  end
----------------------------------------
  clear
  clc
  patient_analysis(13,true)
  patient_analysis(21,false)
----------------------------------------
  function patient = plot_patient_inflammation_option(patient_number, save_plots)
----------------------------------------
  p13 = patient_analysis(13,true);
----------------------------------------
  function [per_day_mean,patient] = plot_patient_inflammation_option(patient_number, save_plots)
----------------------------------------
  [mean,p13] = patient_analysis(13,true);



% ! Challenge:
% ## Separation of concerns
% !! Solution:
----------------------------------------
  function [day, patient, mean, max, min] load_and_prepare_data(patient_number)
     % LOAD_AND_PREPARE_DATA   Load patient data and prepare it for plotting.
     %    Inputs:
     %       patient_number - The patient number to plot
     %    Outputs:
     %       day - The day of the trial
     %       patient - The patient data
     %       mean - The mean inflammation per day
     %       max - The max inflammation per day
     %       min - The min inflammation per day
     %    Sample usage:
     %       [day, patient, mean, max, min] = load_and_prepare_data(5)

     % Load patient data
     patient_data = readmatrix("data/base/inflammation-01.csv");
     per_day_mean = mean(patient_data);
     per_day_max = max(patient_data);
     per_day_min = min(patient_data);
     patient = patient_data(patient_number,:);
     day_of_trial = 1:40;
  end
----------------------------------------
----------------------------------------
  function plot_patient_inflammation_option(patient_number, save_plots)
     % PLOT_PATIENT_INFLAMMATION_OPTION   Plots daily average, max and min inflammation.
     %    Inputs:
     %       patient_number - The patient number to plot
     %       save_plots - A boolean to decide whether to save the plot to disk (if true) or display it on screen (if false).
     %    Sample usage:
     %       plot_patient_inflammation_option(5, false)

     pn_string = num2str(patient_number);

     [day, patient, mean, max, min] = load_and_prepare_data(patient_number);

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
     plot(day, mean, "DisplayName", "Mean")
     plot(day, patient, "DisplayName", "Patient " + pn_string)
     legend
     hold off

     % Plot max and min inflammation per day with the patient data
     nexttile
     title("Max and Min")
     hold on
     plot(day, max, "DisplayName", "Max")
     plot(day, patient, "DisplayName", "Patient " + pn_string)
     plot(day, min, "DisplayName", "Min")
     legend
     hold off

     if save_plots == true
        % Save plot in "results" folder as png image:
        saveas(fig,"results/patient_" + pn_string + ".png")

        close(fig)
  end
----------------------------------------




