---
title: Writing MATLAB Scripts
teaching: 35
exercises: 0
---

::::::::::::::::::::::::::::::::::::::: objectives

- Write and save MATLAB scripts.
- Save MATLAB plots to disk.
- Document our scripts for future reference.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How can I save and re-use my programs?

::::::::::::::::::::::::::::::::::::::::::::::::::


In the previous episode we started talking about scripts.
A MATLAB script is just a text file with a `.m` extension,
and we found that they let us save and run several commands in one go.

In this episode we will revisit the scripts in a bit more depth,
and will recap some of the concepts we've learned so far.

:::::::::::::::::::::::::::::::::::::::::  callout

## The MATLAB path

MATLAB knows about files in the current directory, but if we want to
run a script saved in a different location, we need to make sure that
this file is visible to MATLAB.
We do this by adding directories to the MATLAB **path**.
The *path* is a list of directories MATLAB will search through to locate
files.

To add a directory to the MATLAB path,
we go to the `Home` tab,
click on `Set Path`,
and then on `Add with Subfolders...`.
We navigate to the directory and
add it to the path to tell MATLAB where to look for our files. When you refer
to a file (either code or data), MATLAB will search all the directories in the path
to find it. Alternatively, for data files, we can provide the relative or
absolute file path.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::  callout

## Comments

You might have noticed that we described what we want our code to do in lines starting with the percent sign: `%`.
This is another plus of writing scripts: 
you can comment your code to make it easier to understand when you come back to it after a while.

::::::::::::::::::::::::::::::::::::::::::::::::::

## Script for plotting -- Recap

You should already have a script from the previous lesson that plots the mean and max using a tiled layout.
We will replicate and improve upon that script as way of a recap, adding comments to make it easier to understand.

Create a new script in the current directory called `plot_patient_inflammation.m`
```matlab
>> edit src/plot_patient_inflammation.m
```

In the script, lets recap what we need to do:

```matlab
% *Script* to plot daily average, max and min inflammation.

% Load patient data
patient_data = readmatrix("data/base/inflammation-01.csv");
per_day_mean = mean(patient_data);
per_day_max = max(patient_data);
per_day_min = min(patient_data);
patient = patient_data(5,:);
day_of_trial = 1:40;

fig = figure;
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
plot(day_of_trial, patient, "DisplayName", "Patient 5")
legend
hold off

% Plot max and min inflammation per day with the patient data
nexttile
title("Max and Min")
hold on
plot(day_of_trial, per_day_max, "DisplayName", "Max")
plot(day_of_trial, patient, "DisplayName", "Patient 5")
plot(day_of_trial, per_day_min, "DisplayName", "Min")
legend
hold off
```

Now, before running this script lets clear our workplace so that we can see what is happening.
```matlab
>> clear
>> clc
```

If you now run the script by clicking "Run" on the graphical user interface,
pressing `F5` on the keyboard,
or typing the script's name `plot_patient_inflammation` on the command line (the file name without the extension),
you'll see a bunch of variables appear in the workspace.

As you can see, the script ran every line of code in the script in order, and created any variable we asked for.
Having the code in the script makes it much easier to follow what we are doing, and also make changes.

Note that we are explicitly creating a new figure window using the `figure` command.

Try this on the command line:

```matlab
>> figure
```

MATLAB's plotting commands only create a new figure window if one doesn't already exist:
the default behaviour is to reuse the current figure window as we saw in the previous episode.
Explicitly creating a new figure window in the script avoids any unexpected results from
plotting on top of existing figures.

Now lets run the script:
```matlab
>> plot_patient_inflammation
```

You should see the figure appear.

Try running `plot_patient_inflammation` again without closing the first figure to see that it does not plot on top of the previous figure
A second figure is created. If you look carefully, at the top it is labelled as "Figure 2".

It is worth mentioning that it is possible to close all the currently open figures with:
```matlab
>> close all
```

:::::::::::::::::::::::::::::::::::::::::  callout

## Help text

A comment can appear on any line, but be aware that the first line
or block of comments in a script or function is used by MATLAB as the
**help text**.
When we use the `help` command, MATLAB returns the *help text*.
The first help text line (known as the **H1 line**)
typically includes the name of the program, and a brief description.
The `help` command works in just the same way for our own programs as for
built-in MATLAB functions.
You should write help text for all of your own scripts and functions.

::::::::::::::::::::::::::::::::::::::::::::::::::

Let's write an H1 line at the top of our script:

```matlab
% PLOT_PATIENT_INFLAMMATION   *Script* Plots daily average, max and min inflammation.
```

We can then get help for our script by running

```matlab
>> help plot_patient_inflammation
```
```output
  plot_patient_inflammation   Computes mean, max and min of a patient and compares to global statistics.
```

### Saving figures

We can ask MATLAB to save the image too using the `saveas` command.
In order to maintain an organised project we'll save the images
in the `results` directory:

```matlab
% PLOT_PATIENT_INFLAMMATION   *Script* ...
% ...
% Save plot in "results" folder as png image:
saveas(fig,"results/patient_5.png")
```

:::::::::::::::::::::::::::::::::::::::  challenge

## Plot patient N

One of the advantages of having a script is that we can easily modify it to plot different patients.
In our script, however, we have to modify a few lines to reflect the change in the titles and file name, for example.

Can you modify the script so that we can plot any patient by only updating one variable at the top of the script?

Note: You may want to use the `num2str` function to convert a number to a string.

:::::::::::::::  solution

Most of the script remains unchanged, but we need to create a new variable `patient_number` at the top of the script.
Our updated script looks like this:

```matlab
% PLOT_PATIENT_INFLAMMATION   *Script* Plots daily average, max and min inflammation.

patient_number = 5;                                                  %%%
pn_string = num2str(patient_number);                                 %%%

% Load patient data
patient_data = readmatrix("data/base/inflammation-01.csv");
per_day_mean = mean(patient_data);
per_day_max = max(patient_data);
per_day_min = min(patient_data);
patient = patient_data(patient_number,:);                            %%%
day_of_trial = 1:40;

fig = figure;
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
plot(day_of_trial, patient, "DisplayName", "Patient " + pn_string)   %%%
legend
hold off

% Plot max and min inflammation per day with the patient data
nexttile
title("Max and Min")
hold on
plot(day_of_trial, per_day_max, "DisplayName", "Max")
plot(day_of_trial, patient, "DisplayName", "Patient " + pn_string)   %%%
plot(day_of_trial, per_day_min, "DisplayName", "Min")
legend
hold off

% Save plot in "results" folder as png image:
saveas(fig,"results/patient_" + pn_string + ".png")                  %%%
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::


:::::::::::::::::::::::::::::::::::::::::  callout

## Getting the current figure

In the script we saved our figure as a variable `fig`.
This is very useful because we can pass it as a reference, for example, for the `saveas` function.
If we had not done that, we would need to pass the "current figure".
You can get the current figure with `gcf`, like so:
```matlab
>> saveas(gcf,"results/patient_5.png")
```
You can also use gcf to test you are on the right figure, for example with
```matlab
>> gcf == fig
```

::::::::::::::::::::::::::::::::::::::::::::::::::

### Hiding figures

When saving plots to disk, it's sometimes useful to turn off their visibility as MATLAB plots them.
For example, we might not want to view (or spend time closing) the figures in MATLAB, 
and not displaying the figures could make the script run faster.

Let's add a couple of lines of code to do this.

We can ask MATLAB to create an empty figure window without
displaying it by setting its `Visible` property to `'off'`.
We can do this by passing the option as an argument to the figure creation: `figure(Visible='off')`

When we do this, we have to be careful to manually "close" the figure
after we are doing plotting on it - the same as we would "close"
an actual figure window if it were open.
We can do so with the command `close`

Adding these two lines, our finished script looks like this:
```matlab
% PLOT_PATIENT_INFLAMMATION   *Script* Plots daily average, max and min inflammation.

patient_number = 5;
pn_string = num2str(patient_number);

% Load patient data
patient_data = readmatrix("data/base/inflammation-01.csv");
per_day_mean = mean(patient_data);
per_day_max = max(patient_data);
per_day_min = min(patient_data);
patient = patient_data(patient_number,:);
day_of_trial = 1:40;

fig = figure(Visible='off');                             % The figure will not be displayed
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

% Save plot in "results" folder as png image:
saveas(fig,"results/patient_" + pn_string + ".png")

close(fig)                                               % Closes the hidden figure
```

The scripts we've written make regenerating plots easier,
and looking at individual patient's data much simpler,
but we still need to open the script, change the patient number, save, and run.
In contrast, when we have used *functions* we can *provide* arguments,
which are then used to do something. So, can we create our own *functions*?




:::::::::::::::::::::::::::::::::::::::: keypoints

- Save MATLAB code in files with a `.m` suffix.
- The set of commands in a script get executed by calling the script by its name,
  and all variables are saved to the workspace.
  Be careful, this potentially **replaces** variables.
- Comment your code to make it easier to understand using `%` at the start of a line.
- The first line of any script or function (known as the H1 line) should be a comment.
  It typically includes the name of the program, and a brief description.
- You can use `help script_name` to get the information in the H1 line.
- Create new figures with `figure`, or new 'invisible' figures with `figure(visible='off')`.
  Remember to close them with `close()`, or `close all`.
- Save figures with `saveas(fig,"results/my_plot_name.png")`,
  where `fig` is the figure you want to save,
  and can be replaced with `gcf` if you want to save the current figure.

::::::::::::::::::::::::::::::::::::::::::::::::::
