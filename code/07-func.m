



% ## Writing functions from scratch
  inflammation_IIU = (inflammation_AIU + B)*A
  B = 5.634
  A = 0.275
  function [out1, out2] = function_name(in1, in2)
      % FUNCTION_NAME   Function description
      %    Can add more text for the function help
      %    An example is always useful!
  
      % This section below is called the body of the function
      out1 = calculation using in1 and in2;
      out2 = another calculation;
  end
  function inflammation_in_IIU = inflammation_AIU_to_IIU(inflammation_in_AIU)
     % INFLAMMATION_AIU_TO_IIU  Convert inflammation mesured in AIU to inflammation measued in IIU.
  
     A = 0.275;
     B = 5.634;
  
     inflammation_in_IIU = (inflammation_in_AIU + B)*A;
  
  end
  inflammation_AIU_to_IIU(0.5)
  val_in_IIU = inflammation_AIU_to_IIU(0.5)

% ! Challenge:
% ## Writing your own conversion function
% !! Solution:
  function inflammation_in_AIU = inflammation_IIU_to_AIU(inflammation_in_IIU)
     % INFLAMMTION_IIU_TO_AIU   Convert inflammation measured in IIU to inflammation measured in AIU.
  
     A = 0.275;
     B = 5.634;
  
     inflammation_in_AIU = inflammation_in_IIU/A - B;
  
  end



% ## Functions that work on arrays

% ## Transforming scripts into functions
  function patient_analysis(patient_number)
      % PATIENT_ANALYSIS   Computes mean, max and min of a patient and compares to global statistics.
      %    Takes the patient number as an input, and prints the relevant information to console.
      %    Sample usage:
      %       patient_analysis(5)
  
      % Load patient data
      patient_data = readmatrix('data/base/inflammation-01.csv');
  
      % Compute global statistics
      g_mean = mean(patient_data(:));
      g_max = max(patient_data(:));
      g_min = min(patient_data(:));
  
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
  
  end
  clear
  clc
  patient_analysis(13)
  function p_mean = patient_analysis(patient_number)
  p13 = patient_analysis(13)
  function [p_mean,p_max,p_min] = patient_analysis(patient_number)
  [p13_mean,p13_max,p13_min] = patient_analysis(13)



% ! Challenge:
% ## Plotting daily average of different data files
% !! Solution:
  function plot_daily_average(data_file,plot_name)
      %PLOT_DAILY_AVERAGE   Plots daily average, max and min inflammation accross patients.
      %   The function takes the data in data_file and saves it as plot_name
      %   Example usage:
      %       plot_daily_average('data/base/inflammation-03.csv','results/plot3.png')
  
      % Load patient data
      patient_data = readmatrix(data_file);
  
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
      saveas(gcf,plot_name)
  
      close()
  end



% ! Challenge:
% ## Plotting patient vs mean
% !! Solution:
  function patient_vs_mean(per_day_mean,patient_data,patient_reference)
      % PATIENT_VS_MEAN   Plots the global mean and patient inflammation on top of each other.
      %   per_day_mean should be a vector with the global mean.
      %   patient_data should be a vector with only the patient data.
      %   patient_reference will be used to identify the patient on the plot.
      %
      %   Sample usage:
      %       patient_data = readmatrix('data/base/inflammation-01.csv');
      %       per_day_mean = mean(patient_data);
      %       patient_vs_mean(per_day_mean,patient_data(5,:),"Patient 5")
  
      figure(visible='off')
  
      %Plot per_day_mean
      plot(per_day_mean,DisplayName="Mean")
      legend
      title('Daily average inflammation')
      xlabel('Day of trial')
      ylabel('Inflammation')
  
      %Overlap patient data
      hold on
      plot(patient_data,DisplayName=patient_reference)
      hold off
  
      % Save plot
      saveas(gcf,"results/"+patient_reference+".png")
  
      close()
  
  end




