



% ## Loading data to an array

% ## Tip: Good Enough Practices for Scientific Computing

  pwd
  ls
  patient_data = readmatrix('data/base/inflammation-01.csv');
  size(patient_data)
  class(patient_data)
% ## Initial exploration
% #### **One patient at a time**
  patient_5 = patient_data(5,:)
  mean_p5=mean(patient_5)
  max_p5 = max(patient_5)
  min_p5 = min(patient_5)
  std_p5 = std(patient_5)

% ! Challenge:
% ## All data points at once
% !! Solution:
  global_mean = mean(patient_data(:))
  global_max = max(patient_data(:))


  mean_p5 > global_mean
  max_p5 == global_max
% #### **One day at a time**
  day_9 = patient_data(:,9);
  mean_d9 = mean(day_9)
  max_d9 = max(day_9)
% #### **Whole array analysis**
  x=mean(patient_data);
  per_day_mean = mean(patient_data);
  per_day_max = max(patient_data);
  per_day_mean > global_mean
  find(ans)

% ### Per patient analysis
  help mean
  per_patient_mean = mean(patient_data,2);
  per_patient_max = max(patient_data,[],2);



