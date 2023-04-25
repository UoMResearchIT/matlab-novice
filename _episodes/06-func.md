---
title: Creating Functions
teaching: 45
exercises: 20
questions:
- "How can I teach MATLAB how to do new things?"
objectives:
- "Compare and contrast MATLAB function files with MATLAB scripts."
- "Define a function that takes arguments."
- "Test a function."
- "Recognize why we should divide programs into small, single-purpose functions."
keypoints:
- "Break programs up into short, single-purpose functions with meaningful names."
- "Define functions using the `function` keyword."
---

In the `patient_analysis` script we created,
we can choose which patient to analyse by modifying the variable `patient_number`.
If we want patient 13, we need to open `patient_analysis.m`, go to line 9, modify the variable,
save and then run `patient_analysis`.
This is a lot of steps for such a simple request.

We have used a few predefined Matlab functions, to which we can provide arguments.
So how can we define a function in Matlab?

A MATLAB function *must* be saved in a text file with a `.m` extension.
The name of that file must be the same as the function defined
inside it. The name must start with a letter and cannot contain spaces.

The first line of our function is called the *function definition*.
Anything following the function definition line is called the *body* of the
function. The keyword `end` marks the end of the function body, and the
function won't know about any code after `end`.

A function can have multiple input and output parameters if required,
but isn't required to have any of either.
The general form of a function is shown in the pseudo-code below:

```
function [out1, out2] = function_name(in1, in2)
    %FUNCTION_NAME   Function description

    % This section below is called the body of the function
    out1 = something calculated;
    out2 = something else;
end
```
{: .language-matlab}

Just as we saw with scripts, functions must be _visible_ to MATLAB, i.e.,
a file containing a function has to be placed in a directory that
MATLAB knows  about. The most convenient of those directories is the
current working directory.

> ## GNU Octave
>
> In common with MATLAB, Octave searches the current working directory and
> the path for functions called from the command line.
{: .callout}

We already have a `.m` file called `patient_analysis`, so lets define a function with that name.

Open the `patient_analysis.m` file, if you don't already have it open.
Instead of line 9, where `patient_number` is set, we want to provide that variable as an input.
So lets remove that line, and right at the top of our script we'll add the function definition
telling matlab what our function is called and what inputs it needs.
```
function patient_analysis(patient_number)
    % PATIENT_ANALYSIS   Computes mean, max and min of a patient and compares to global statistics.

    % Load patient data
    patient_data = readmatrix('data/inflammation-01.csv');

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
```
{: .language-matlab}

Congratulations! You've now created a Matlab function.

You may have noticed that the code inside the function is indented.
Matlab does not need this, but it makes it much more readable!

Lets clear our workspace and run our function in the command line:
```
>> clear
>> clc
>> patient_analysis(13)
```
{: .language-matlab}
```
Patient 5:
High mean?
   1
Highest max?
   0
Lowest min?
   1
```
{: .output}

So now we can get the patient analysis of whichever patient we want,
and we do not need to modify `patient_analysis.m` anymore.
However, you may have noticed that we have no variables in our workspace.
Inside the function, the variables `patient_data`, `g_mean`, `g_max`, `g_min`, `p_mean`,
`p_max`, and `p_min` are created, but then they are deleted when the function ends.

## Introduce debugger here???

This is one of the major differences between scripts and functions:
a script can be thought of as automating the command line,
with full access to all variables in the base workspace,
whereas a function has its own separate workspace.

To be able to access variables from your workspace, you have to pass them in as inputs.
To be able to save variables to your workspace, it needs to return them as outputs.

Lets say, for example, that we want to save the mean of each patient.
In our `patient_analysis.m` we already compute the value and save it in `p_mean`,
but we need to tell matlab that we want the function to return it.

To do that we modify the function definition like this:
```
function p_mean = patient_analysis(patient_number)
```
{: .language-matlab}

It is important that the variable name is the same that is used inside the function.

If we now run our function in the command line, we get:
```
p13 = patient_analysis(13)
```
{: .language-matlab}
```
Patient 5:
High mean?
   1
Highest max?
   0
Lowest min?
   1

p13 =
    6.2250
```
{: .output}

We could return more outputs if we want.
For example, lets return the min and max as well.
To do that, we need to specify all the outputs in square brackets, as an array.
So we need to replace the function definition for:
```
function [p_mean,p_max,p_min] = patient_analysis(patient_number)
```
{: .language-matlab}

To call our function now we need to provide space for all 3 outputs,
so in the command line, we run it as:
```
[p13_mean,p13_max,p13_min] = patient_analysis(13)
```
{: .language-matlab}
```
Patient 5:
High mean?
   1
Highest max?
   0
Lowest min?
   1
p13_mean =
    6.2250
p13_max =
    17
p13_min =
     0
```
{: .output}

> **Note**
> If you had not provided space for all the outputs,
> Matlab assumes you are only interested in the first one,
> so `ans` would save the mean.
{: .callout}

## Could add an `if` here, to prevent the output print?

## Stopped editing here!!!






This is our first taste of how larger programs are built:
we define basic operations,
then combine them in ever-larger chunks to get the effect we want.
Real-life functions will usually be larger than the ones shown
here---typically half a dozen to a few dozen lines---but
they shouldn't ever be much longer than that,
or the next person who reads it won't be able to understand what's going on.

> ## Concatenating in a Function
>
> In MATLAB, we concatenate strings by putting them into an array or using the
> `strcat` function:
>
> ~~~
> >> disp(['abra', 'cad', 'abra'])
> ~~~
> {: .language-matlab}
>
> ~~~
> abracadabra
> ~~~
> {: .output}
>
> ~~~
> >> disp(strcat('a', 'b'))
> ~~~
> {: .language-matlab}
>
> ~~~
> ab
> ~~~
> {: .output}
>
> Write a function called `fence` that has two parameters, `original` and
> `wrapper` and adds `wrapper` before and after `original`:
>
> ~~~
> >> disp(fence('name', '*'))
> ~~~
> {: .language-matlab}
>
> ~~~
> *name*
> ~~~
> {: .output}
> > ## Solution
> > ```
> > function wrapped = fence(original, wrapper)
> >     %FENCE   Return original string, with wrapper prepended and appended
> >
> >     wrapped = strcat(wrapper, original, wrapper);
> > end
> > ```
> > {: .language-matlab}
> {: .solution}
{: .challenge}

> ## Getting the Outside
>
> If the variable `s` refers to a string, then `s(1)` is the string's first
> character and `s(end)` is its last. Write a function called `outer` that returns
> a string made up of just the first and last characters of its input:
>
> ~~~
> >> disp(outer('helium'))
> ~~~
> {: .language-matlab}
>
> ~~~
> hm
> ~~~
> {: .output}
> > ## Solution
> > ```
> > function ends = outer(s)
> >     %OUTER   Return first and last characters from a string
> > 
> >     ends = strcat(s(1), s(end));
> > end
> > ```
> > {: .language-matlab}
> {: .solution}
{: .challenge}

> ## Variables Inside and Outside Functions
>
> Consider our function `fahr_to_kelvin` from earlier in the episode:
> ```
> function ktemp = fahr_to_kelvin(ftemp)
>   %FAHR_TO_KELVIN   Convert Fahrenheit to Kelvin
>   ktemp = ((ftemp-32)*(5.0/9.0)) + 273.15;
> end
> ```
> {: .language-matlab}
> 
> What does the following code display when run --- and why?
>
> ~~~
> ftemp = 0
> ktemp = 0
>
> disp(fahr_to_kelvin(8))
> disp(fahr_to_kelvin(41))
> disp(fahr_to_kelvin(32))
>
> disp(ktemp)
> ~~~
> {: .language-matlab}
>
> > ## Solution
> > ```
> > 259.8167
> > 278.1500
> > 273.1500
> > 0
> > ```
> > {: .output}
> >
> > `ktemp` is 0 because the function `fahr_to_kelvin` has no knowledge of
> > the variable `ktemp` which exists outside of the function.
> {: .solution}
{: .challenge}

Once we start putting things in functions so that we can
re-use them, we need to start testing that those functions are
working correctly.
To see how to do this, let's write a function to center a
dataset around a particular value:

~~~
function out = center(data, desired)
    out = (data - mean(data(:))) + desired;
end
~~~
{: .language-matlab}

We could test this on our actual data, but since we
don't know what the values ought to be,
it will be hard to tell if the result was correct,
Instead, let's create a matrix of 0's, and then center that
around 3:

~~~
>> z = zeros(2,2);
>> center(z, 3)
~~~
{: .language-matlab}

~~~
ans =

   3   3
   3   3
~~~
{: .output}

That looks right, so let's try out `center` function on our real data:

~~~
>> data = readmatrix('data/inflammation-01.csv');
>> centered = center(data(:), 0)
~~~
{: .language-matlab}

It's hard to tell from the default output whether the
result is correct--this is often the case when working with
fairly large arrays--but, there are a few simple tests that
will reassure us.

Let's calculate some simple statistics:

~~~
>> disp([min(data(:)), mean(data(:)), max(data(:))])
~~~
{: .language-matlab}

~~~
0.00000    6.14875   20.00000
~~~
{: .output}

And let's do the same after applying our `center` function
to the data:

~~~
>> disp([min(centered(:)), mean(centered(:)), max(centered(:))])
~~~
{: .language-matlab}

~~~
   -6.1487   -0.0000   13.8513
~~~
{: .output}

That seems almost right: the original mean
was about 6.1, so the lower bound from zero is now about -6.1.
The mean of the centered data isn't quite zero--we'll explore
why not in the challenges--but it's pretty close. We can even
go further and check that the standard
deviation hasn't changed:

~~~
>> std(data(:)) - std(centered(:))
~~~
{: .language-matlab}

~~~
5.3291e-15
~~~
{: .output}

The difference is very small. It's still possible that our function
is wrong, but it seems unlikely enough that we should probably
get back to doing our analysis. We have one more task first, though:
we should write some [documentation]({{ page.root }}/reference.html#documentation)
for our function to remind ourselves later what it's for and
how to use it.

~~~
function out = center(data, desired)
    %CENTER   Center data around a desired value.
    %
    %       center(DATA, DESIRED)
    %
    %   Returns a new array containing the values in
    %   DATA centered around the value.

    out = (data  - mean(data(:))) + desired;
end
~~~
{: .language-matlab}

Comment lines immediately below the function definition line
are called "help text". Typing `help function_name` brings
up the help text for that function:

~~~
>> help center
~~~
{: .language-matlab}

~~~
Center   Center data around a desired value.

    center(DATA, DESIRED)

Returns a new array containing the values in
DATA centered around the value.
~~~
{: .output}

> ## Testing a Function
>
> 1. Write a function called `normalise` that takes an array as input and returns an
>    array of the same shape with its values scaled to lie in the range 0.0 to 1.0.
>    (If L and H are the lowest and highest values in the input array, respectively,
>    then the function should map a value v to (v - L)/(H - L).) Be sure to give the
>    function a comment block explaining its use.
>
> 1. Run `help linspace` to see how to use `linspace` to generate
>    regularly-spaced values. Use arrays like this to test your `normalise` function.
>
> > ## Solution
> >
> > 1. 
> >
> >     ```
> >     function out = normalise(in)
> >         %NORMALISE   Return original array, normalised so that the
> >         %            new values lie in the range 0 to 1.
> >
> >         H = max(max(in));
> >         L = min(min(in));
> >         out = (in-L)/(H-L);
> >     end
> >     ```
> >     {: .language-matlab}
> >
> > 2. 
> >
> >     ```
> >     a = linspace(1, 10);   % Create evenly-spaced vector
> >     norm_a = normalise(a); % Normalise vector
> >     plot(a, norm_a)        % Visually check normalisation
> >     ```
> >     {: .language-matlab}
> {: .solution}
{: .challenge}

> ## Convert a script into a function
>
> Write a function called `plot_dataset` which plots the three summary graphs
> (max, min, std) for a given inflammation data file.
>
> The function should operate on a single data file,
> and should have two parameters: `file_name` and `plot_switch`.
> When called, the function should create the three graphs produced in the
> previous lesson. Whether they are displayed or saved to the `results` directory
> should be controlled by the value of `plot_switch`
> i.e. `plot_dataset('data/inflammation-01.csv', 0)`
> should display the corresponding graphs for the first data set;
> `plot_dataset('data/inflammation-02.csv', 1)` should save the figures for the second
> dataset to the `results` directory.
>
> You should mostly be reusing code from the `plot_all` script.
>
> Be sure to give your function help text.
>
> > ## Solution
> > ```
> > function plot_dataset(file_name, plot_switch)
> >     %PLOT_DATASET    Perform analysis for named data file.
> >     %   Create figures to show average, max and min inflammation.
> >     %   Display plots in GUI using plot_switch = 0,
> >     %   or save to disk using plot_switch = 1.
> >     %
> >     %   Example:
> >     %       plot_dataset('data/inflammation-01.csv', 0)
> >     
> >     % Generate string for image name:
> >     img_name = replace(file_name, '.csv', '.png');
> >     img_name = replace(img_name, 'data', 'results');
> >
> >     patient_data = readmatrix(file_name);
> >     
> >     if plot_switch == 1
> >     	figure('visible', 'off')
> >     else
> >     	figure('visible', 'on')
> >     end
> >     
> >     subplot(2, 2, 1)
> >     plot(mean(patient_data, 1))
> >     ylabel('average')
> >     
> >     subplot(2, 2, 2)
> >     plot(max(patient_data, [], 1))
> >     ylabel('max')
> >     
> >     subplot(2, 2, 3)
> >     plot(min(patient_data, [], 1))
> >     ylabel('min')
> >     
> >     if plot_switch == 1
> >         print(img_name, '-dpng')
> >         close()
> >     end
> >  end
> >  ```
> > {: .language-matlab}
> {: .solution}
{: .challenge}

> ## Automate the analysis for all files
>
> Modify the `plot_all` script so that as it loops over the
> data files, it calls the function `plot_dataset` for each file
> in turn.
> Your script should save the image files to the 'results' directory
> rather than displaying the figures in the MATLAB GUI.
>
> > ## Solution
> >
> > ```
> > %PLOT_ALL    Analyse all inflammation datasets
> > %   Create figures to show average, max and min inflammation.
> > %   Save figures to 'results' directory.
> >
> > files = dir('data/inflammation-*.csv');
> >
> > for i = 1:length(files)
> >     file_name = files(i).name;
> >     file_name = fullfile('data', file_name);
> >
> >     % Process each data set, saving figures to disk.
> >     plot_dataset(file_name, 1);
> > end
> > ```
> > {: .language-matlab}
> {: .solution}
{: .challenge}


We have now solved our original problem: we can analyze
any number of data files with a single command.
More importantly, we have met two of the most important
ideas in programming:

1. Use arrays to store related values, and loops to
   repeat operations on them.

2. Use functions to make code easier to re-use and
   easier to understand.
