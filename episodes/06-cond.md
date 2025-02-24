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
% *Script* to illustrate use of conditionals
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
% *Script* to illustrate use of conditionals
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
% *Script* to illustrate use of conditionals

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
```

We can also combine logical operations, using `&&` (and) and `||` (or), as we did before:
```matlab
>> if ((1 > 0) && (-1 > 0))
>>     disp('both parts are true')
>> else
>>     disp('At least one part is not true')
>> end
```
```output
At least one part is not true
```

```matlab
>> if (1 < 0) || (3 < 4)
>>     disp('At least one part is true')
>> end
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
%NEAR   *Script* that displays 1 if variable a is within 10% of variable b and 0 otherwise.
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

:::::::::::::::::::::::::::::::::::::::  challenge

## Scripts with choices

In the last lesson, we wrote a script that saved several plots to disk. It would nice if our script could be more 
flexible.

Can you modify it so that it either saves the plots to disk *or* displays them on screen?
Make it easy to change between the two behaviours using a conditional statements.

:::::::::::::::  solution

We can introduce a variable `save_plots` that we can set to either `true` or `false` and modify our script so that when
`save_plots == true` the plots are saved to disk, and when `save_plots == false` the plots are printed to the screen.

```matlab
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
```

Save the script in a file names `plot_patient_inflammation_option.m` and confirm that
setting the variable `save_plots` to `true` and `false` do what we expect.

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::::::::: keypoints

- Use conditional statements to make choices based on values in your program.
- A conditional statement block starts with an `if` and finishes with `end`. It can also include an `else`.
- Use `elseif` to nest conditional statements.
- Use `&&` (and), `||` (or) to combine logical operations.
- Only one of the statement bodies is ever executed.
::::::::::::::::::::::::::::::::::::::::::::::::::
