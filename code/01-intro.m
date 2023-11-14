



% ## Introduction to the MATLAB GUI
% ## Working with variables
  x = 55
  y = 10
  x + y
  x - y
  z = x * y
  y = y/5
  z = z - y^3 + 5*x
% ### Logical operations
  mass = 20
  age = 2.5
  frac = mass/age
  c1 = frac < 10
  c2 = frac > 10

% ## Data types
% !! Solution:
  weight = 64.5
  size3 = 'L'
  patient_name = "Jane Doe"
  alive_on_day_3 = true
  class(patient_name)


  c3 = frac == mass/age
  c4 = frac < 10 && age > 5
  c5 = frac < 10 || age > 5

% ! Challenge:
% ## Negating conditions and including the limits
% !! Solution:


% ### Arrays
  A = [1, 2, 3]
  B = [1, 2; 3, 4; 5, 6]
  Names = ["John", "Abigail", "Bertrand", "Lucile"]
  C = [true; false; false; true]
  B > 3

% ## Suppressing the output
  x = 33;


% ## Printing a variable's value
  patient_name
  disp(patient_name)


% ## Keeping things tidy
  clear alive_on_day_3
  clc



