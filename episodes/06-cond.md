---
title: Making Choices
teaching: 35
exercises: 5
---

::::::::::::::::::::::::::::::::::::::: objectives

- Introduce conditional statements.
- Test for equality within a conditional statement.
- Combine conditional tests using `AND` and `OR`.
- Construct a conditional statement using `if`, `elseif`, and `else`.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How can programs make choices depending on variable values?

::::::::::::::::::::::::::::::::::::::::::::::::::


In the last lesson we began experimenting with scripts, allowing us to re-use code for analysing data and plotting
figures over and over again. To make our scripts even more useful, it would be nice if they did different things
in different situations - either depending on the data they're given or on different options that we specify. We 
want a way for our scripts to "make choices".

The tool that MATLAB gives us for doing this is called a [conditional statement]({{ page.root }}/reference.html#conditional-statement).
We will use conditional statements together with the logical operations we encountered back in [lesson 01]({{ page.root }}/01-intro.hmtl#logical-operations).
The simplest conditional statement consists starts with an `if`, and concludes with an `end`, like this:

```matlab
num = 127;
disp('before conditional...')

if num > 100
    disp('The number is greater than 100')
end

disp('...after conditional')
```

```output
before conditional...
The number is greater than 100
...after conditional
```
Now try changing the value of `num` to, say, 53:

```output
before conditional...
...after conditional
```

MATLAB skipped the code inside the conditional statement because the logical operation returned false.

The choice making is not quite complete yet.
We have managed to "do" or "not do" something, but we have not managed to choose between to actions.
For that, we need to introduce the keyword `else` in the conditional statement, like this:

```matlab
num = 53;
disp('before conditional...')

if num > 100
    disp('The number is greater than 100')
else
    disp('The number is not greater than 100')
end

disp('...after conditional')
```

```output
before conditional...
The number is not greater than 100
...after conditional
```

If the logical operation that follows is true, the body of the `if` statement (i.e., the lines between `if` and `else`) is executed.
If the logical operation returns false, the body of the `else` statement (i.e., the lines between `else` and `end`) is executed instead.
Only one of these statement bodies is ever executed, never both.

We can also "nest" a conditional statements inside another conditional statement.
```matlab
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
```

```output
before conditional...
The number is not greater than 100
But it is greater than 50...
...after conditional
```

This "nesting" can be quite useful, so MATLAB has a special keyword for it.
We can chain several tests together using `elseif`.
This makes it simple to write a script that gives the sign of a number:

```matlab
%CONDITIONAL_DEMO   Demo script to illustrate use of conditionals

num = 53;

if num > 0
    disp('num is positive')
elseif num == 0
    disp('num is zero')
else
    disp('num is negative')
end
```

Recall that we use a double equals sign `==` to test for equality rather than a
single equals sign (which assigns a value to a variable).

During a conditional statement, if one of the conditions is true,
this marks the end of the test: no subsequent conditions will be tested
and execution jumps to the end of the conditional.

Let's demonstrate this by adding another condition which is true.

```matlab
% Demo script to illustrate use of conditionals
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
```

We can also combine logical operations, using `&&` (and) and `||` (or), as we did before:
```matlab
if ((1 > 0) && (-1 > 0))
    disp('both parts are true')
else
    disp('At least one part is not true')
end
```

```output
At least one part is not true
```

```matlab
if (1 < 0) || (3 < 4)
    disp('At least one part is true')
end
```

```output
at least one part is true
```

:::::::::::::::::::::::::::::::::::::::  challenge

## Close Enough

Write a script called `near` that performs a test on two variables, and displays `1`
when the first variable is within 10% of the other
and `0` otherwise. Compare your implementation with
your partner's: do you get the same answer for
all possible pairs of numbers?

:::::::::::::::  solution

```matlab
%NEAR   Display 1 if variable a is within 10% of variable b
%       and display 0 otherwise
a = 1.1;
b = 1.2;

if a/b >= 0.9 && a/b <= 1.1
    disp(1)
else
    disp(0)
end
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

## Scripts with choices

In the last lesson, we wrote a script that saved several plots to disk. It would nice if our script could be more 
flexible. Could we modify it so that it either saved the plots to disk *or* displayed them on screen? Could we do this
in such a way to make it easy to change between the two behaviours? This is something that conditional statements allow
us to do.

We introduce a variable `save_plots` that we can set to either `true` or `false` and modify our script so that when
`save_plots = true` the plots are saved to disk, and when `save_plots = false` the plots are printed to the screen.

```matlab
% PLOT_DAILY_AVERAGE_OPTION   Plots daily average, max and min inflammation across patients. If save_plots is set to 
% true, the figures are saved to disk. If save_plots is set to false, the figures are displayed on the screen.

% Load patient data
patient_data = readmatrix('data/base/inflammation-01.csv');

save_plots=true;

if save_plots == true
    figure(visible='off')
else
    figure
end

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

if save_plots == true 
    % Save plot in 'results' folder as png image:
    saveas(gcf,'results/daily_average_01.png')

    close()

end
```
Save the script in a file names `plot_daily_average_option.m` and investigate what setting the variable `save_plots` 
to `true` and `false` does.

:::::::::::::::::::::::::::::::::::::::  challenge

## Changing behaviour based on patient data

We'd like to improve our `patient_analysis` script from the previous lesson, specifically it's output.
Currently the script displays `0` or `1` to indicate whether or not the patient has a high mean,
has a maximum equivalent to the highest in the dataset, and has a minimum equivalent to the lowest in the dataset.
Instead, we'd like the script to print a line of descriptive text only when each of these is true:

1. The mean inflammation for the patient is higher than the global mean.
2. The maximum inflammation for the patient is the same as the global maximum.
3. The minimum inflammation for the patient is the same as the global minimum.
4. If none of the above is the case, then the script should print a line informing us that the patient's mean, maximum
and minimum inflammation are not remarkable.

Using the `patient_analysis` script from the previous lesson as a starting point (shown below for reference),
can you use conditional statements to make a script that does this?

```matlab
% Load patient data
patient_data = readmatrix('data/base/inflammation-01.csv');

% Compute global statistics
g_mean = mean(patient_data(:));
g_max = max(patient_data(:));
g_min = min(patient_data(:));

patient_number = 8;

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
```

There are several different ways to do this, so compare your finished script with your neighbour and see if you did it the same way.

:::::::::::::::  solution
```matlab
% Load patient data
patient_data = readmatrix('data/base/inflammation-01.csv');

% Compute global statistics
g_mean = mean(patient_data(:));
g_max = max(patient_data(:));
g_min = min(patient_data(:));

patient_number = 8;

% Compute patient statistics
p_mean = mean(patient_data(patient_number,:));
p_max = max(patient_data(patient_number,:));
p_min = min(patient_data(patient_number,:));

% Compare patient vs global
disp('Patient:')
disp(patient_number)

printed_something = false;

if p_mean > g_mean
    disp('Patient''s mean inflammation is higher than the global mean inflammation.')
    printed_something = true;
end

if p_max == g_max
    disp('Patient''s maximum inflammation is the same as the global maximum.')
    printed_something = true;
end

if p_min == g_min
    disp('Patient''s minimum inflammation is the same as the global minimum.')
    printed_something = true;
end

if printed_something == false
    disp('Patient''s mean, maximum and minimum inflammation are not of interest.')
end

```
:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::::::::: keypoints

- Use conditional statements to make choices based on values in your program.
- A conditional statement block starts with an `if` and finishes with `end`. It can also include an `else`.
- Use `elseif` to nest conditional statements.
- Use `&&` (and), `||` (or) to combine logical operations.
- Only one of the statement bodies is ever executed.
::::::::::::::::::::::::::::::::::::::::::::::::::
