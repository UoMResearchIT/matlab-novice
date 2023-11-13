



% ## Initializing an Array
  Z = zeros(3,5)
  Z = zeros(3)
  Z = zeros(1x5)
  R = rand(8);
  O = ones(10,10);


  Fives = ones(3,6)*5;
  M = magic(4)
% ## Array indexing
  M = magic(8)
  M(5, 6)


  M([4,5,6],[5,6,7])

% ## The `:` operator
  1:6
  1:3:15

  M(4:6, 5:7)

% ! Challenge:
% ## Checkerboard
% !! Solution:
  M(1:3:8, 2:2:8)


% ### Selecting whole rows or columns
  M(5, 1:8)

% ## The key-word `end`
  M(2,end)
  M(5:end,3)

  M(5, 1:end)

% ## Using `:` as an index
  M(5, :)

  M(1:4, :)
  M(:, 6:end)

% ! Challenge:
% ## Master indexing
% !! Solution:
  M(2:3:end, :)



% ! Challenge:
% ## Slicing character arrays
  element = 'oxygen';
  disp(['first three characters: ', element(1:3)])
  disp(['last three characters: ', element(4:6)])
% !! Solution:




