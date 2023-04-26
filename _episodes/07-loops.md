---
title: Repeating With Loops
teaching: 40
exercises: 10
questions:
- "How can I repeat the same operations on multiple values?"
objectives:
- "Explain what a for loop does."
- "Correctly write for loops that repeat simple commands."
- "Trace changes to a loop variable as the loops runs."
- "Use a for loop to process multiple files"
keypoints:
- "Use `for` to create a loop that repeats one or more operations."
---

We'd now like to expand our analysis to cover all of the data from each trial together. We *could* do this with the 
commands we already know and the functions we've already written, but this would involve us typing out a lot of 
duplicate code. To avoid all of this repetition, we have to teach MATLAB to repeat our commands, and to do *that*, 
we have to learn how to write *loops*.

To get us started, to read in all the data we could type the following:

~~~
%READ_ALL_DATA  Read in all of the data

patient_data_1 = read_matrix('data/inflammation-01.csv');
patient_data_2 = read_matrix('data/inflammation-02.csv');
patient_data_3 = read_matrix('data/inflammation-03.csv');
patient_data_4 = read_matrix('data/inflammation-04.csv');
patient_data_5 = read_matrix('data/inflammation-05.csv');
patient_data_6 = read_matrix('data/inflammation-06.csv');
patient_data_7 = read_matrix('data/inflammation-07.csv');
patient_data_9 = read_matrix('data/inflammation-08.csv');
patient_data_8 = read_matrix('data/inflammation-09.csv');
patient_data_10 = read_matrix('data/inflammation-10.csv');
patient_data_11 = read_matrix('data/inflammation-11.csv');
patient_data_12 = read_matrix('data/inflammation-12.csv');

~~~
{: .language-matlab}

Remember, that every time code is repeated in more than one place, it will eventually be wrong in one of those places.
Also, if we change the name of our datasets or the type of analysis we're performing we'll have to remember to change
our code in 12 different places.

We could start to make things a bit easier by storing the name of each file in an array:

~~~
%READ_ALL_DATA  Read in of the data, using an array to store the filenames

filenames = ["data/inflammation-01.csv",...
                "data/inflammation-02.csv",...
                "data/inflammation-03.csv",...
                "data/inflammation-04.csv",...
                "data/inflammation-05.csv",...
                "data/inflammation-06.csv",...
                "data/inflammation-07.csv",...
                "data/inflammation-08.csv",...
                "data/inflammation-09.csv",...
                "data/inflammation-10.csv",...
                "data/inflammation-11.csv",...
                "data/inflammation-12.csv",...
                ];

patient_data_1 = readmatrix(filenames(1));
patient_data_2 = readmatrix(filenames(2));
patient_data_3 = readmatrix(filenames(3));
patient_data_4 = readmatrix(filenames(4));
patient_data_5 = readmatrix(filenames(5));
patient_data_6 = readmatrix(filenames(6));
patient_data_7 = readmatrix(filenames(7));
patient_data_9 = readmatrix(filenames(8));
patient_data_8 = readmatrix(filenames(9));
patient_data_10 = readmatrix(filenames(10));
patient_data_11 = readmatrix(filenames(11));
patient_data_12 = readmatrix(filenames(12));

~~~
{: .language-matlab}

There are two problems with this approach: 

1. If we have a lot more than twelve files, this method will become very laborious. In other words, it doesn't scale.

2. If the size of the `filenames` array changes our script will not do what we 
want it to do. In other words, it's fragile.

Suppose we reduce the size of our `filenames` array to contain just two filenames. Our script now produces an error
as it tries to access elements of the array that don't exist.

~~~
%READ_ALL_DATA  Read in of the data, using an array to store the filenames

filenames = ["data/inflammation-01.csv",...
                "data/inflammation-02.csv"
                ];

patient_data_1 = readmatrix(filenames(1));
patient_data_2 = readmatrix(filenames(2));
patient_data_3 = readmatrix(filenames(3));
patient_data_4 = readmatrix(filenames(4));
patient_data_5 = readmatrix(filenames(5));
patient_data_6 = readmatrix(filenames(6));
patient_data_7 = readmatrix(filenames(7));
patient_data_9 = readmatrix(filenames(8));
patient_data_8 = readmatrix(filenames(9));
patient_data_10 = readmatrix(filenames(10));
patient_data_11 = readmatrix(filenames(11));
patient_data_12 = readmatrix(filenames(12));

~~~
{: .language-matlab}

~~~
error: A(I): Index exceeds the number of array elements. Index must not exceed 2.
~~~
{: .error}

There's a better approach:

~~~
%READ_ALL_DATA  Read in of the data, using an array to store the filenames and a for loop

filenames = ["data/inflammation-01.csv",...
                "data/inflammation-02.csv",...
                "data/inflammation-03.csv",...
                "data/inflammation-04.csv",...
                "data/inflammation-05.csv",...
                "data/inflammation-06.csv",...
                "data/inflammation-07.csv",...
                "data/inflammation-08.csv",...
                "data/inflammation-09.csv",...
                "data/inflammation-10.csv",...
                "data/inflammation-11.csv",...
                "data/inflammation-12.csv",...
                ];

data = [];

for file_index = 1:12
    study_data = readmatrix(filenames(file_index));
    data = cat(1, data, study_data);
end

~~~
{: .language-matlab}

This improved version uses a [for loop]({{ page.root }}/reference.html#for-loop) to
repeat an operation---in this case, reading in some data and adding it to the `data` array---once for
each element in an array.

The general form of a for loop is:

~~~
for variable from range_vector
    do things with variable
end
~~~
{: .source}

The for loop executes the commands in the
[loop body]({{ page.root }}/reference.html#loop-body)
for every value in the array `range_vector`.
This value is called the [loop variable]({{ page.root }}/reference.html#loop-variable),
and we can call it whatever we like.
In our example, we gave it the name `file_index`.

We have to terminate the loop body with the `end` keyword,
and we can have as many commands as we like in the loop body.
But, we have to remember
that they will all be repeated as many times as
there are values in `range_vector`.

Our for loop has made our code more scalable,
and less fragile.
There's still one little thing about it that should bother us.
For our loop to deal appropriately with more or less filenames in the `filenames` array,
we have to change the first line of our loop by hand:

~~~
%READ_ALL_DATA  Read in of the data, using an array to store the filenames and a for loop

filenames = ["data/inflammation-01.csv",...
                "data/inflammation-02.csv"
                ];

data = []

for file_index = 1:2
    study_data = readmatrix(filenames(file_index))
    cat(1, data, study_data)
end

~~~
{: .language-matlab}

Although this works,
it's not the best way to write our loop:

* We might update `filenames` and forget to modify the loop to reflect that
  change.

* We might make a mistake while counting the number of elements in
  `filenames`.

Fortunately,
MATLAB provides us with a convenient function to
write a better loop:

~~~
%READ_ALL_DATA  Read in of the data, using an array to store the filenames and a for loop

filenames = ["data/inflammation-01.csv",...
                "data/inflammation-02.csv"
                ];

data = []

for file_index = length(filenames)
    study_data = readmatrix(filenames(file_index))
    cat(1, data, study_data)
end
~~~
{: .language-matlab}

This is much more robust code,
as it can deal identically with
`filenames` arrays of indeterminate length.

We're now using the `cat` function to concatenate an array containing data we've just read in to a general `data` array.
As this function is new, it's worth taking a closer look at exactly what our script is doing.

> ## The debugger
> We can use the MATLAB debugger to trace the execution of a program.
>
> The first step is to set a **break point** by clicking just to the
> right of a line number on the `-` symbol.
> A red circle will appear --- this is the break point,
> and when we run the script, MATLAB will pause execution at that line.
>
> A green arrow appears, pointing to the next line to be run.
> To continue running the program one line at a time, we use the `step` button.
>
> We can then inspect variables in the workspace or by hovering the cursor
> over where they appear in the code,
> or get MATLAB to evaluate expressions in the command window
> (notice the prompt changes to `K>>`).
>
> This process is useful to check your understanding of a program,
> in order to correct mistakes.
>
> This process is illustrated below:
> ![debugger-demo]({{ page.root }}/fig/debugger.gif)
{: .callout}

When we enter the loop, the `data` array is empty. The loop index starts at 1 and increases by 1 on every iteration. 
The first time through the loop, the file whose filename is first in the `filenames` array is read into the array 
`study_data`. This array is then concatenated with the `data` array to make a new array. The new array is assigned 
back to `data`. Then on the second iteration, the data from the second filename in `filenames` is read in and added to 
`data` (which now contains data from the first file). This continues until at the end of the loop, `data` contains all 
of the data from the files whose filenames are listed in `filenames`.

Note that a loop variable is just a variable
that's being used to record progress in a loop.
It still exists after the loop is over,
and we can re-use variables previously defined as loop variables as well:

~~~
>> disp(file_index)
~~~
{: .language-matlab}

~~~
2
~~~
{: .output}

## Effectively gathering the filenames of multiple files

There is one major problem remaining with our script: we have to manually create the `filenames` array. Wouldn't it 
be good if we could tell MATLAB to automatically generate a list of the data files in a particular folder? That way
when data comes in from more studies we can quickly re-run our analysis to include the data.

We can use the `dir` command to return a **structure array** containing
the names of the files in the `data` directory.
Each element in this *structure array* is a **structure**, containing
information about a single file in the form of named **fields**.

```
>> files = dir('data/inflammation-*.csv')
```
{: .language-matlab}

```
files =
  12×1 struct array with fields:
    name
    folder
    date
    bytes
    isdir
    datenum
```
{: .output}

To access the *name* field of the first file, we can use the following syntax:

```
>> filename = files(1).name;
>> disp(filename)
```
{: .language-matlab}

```
inflammation-01.csv
```
{: .output}

To get the modification date of the third file, we can do:

~~~
>> mod_date = files(3).date;
>> disp(mod_date)
~~~
{: .language-matlab}

~~~
26-Jul-2015 22:24:31
~~~
{: .output}

A good first step towards processing multiple files is to write a loop which prints
the name of each of our files.
Let's write this in a script `statistics_all.m` which we will then develop further:

~~~
%STATISTICS_ALL	Developing code to automate inflammation analysis

files = dir("data/inflammation-*.csv");

for i = 1:length(files)
	file_name = files(i).name;
	disp(file_name)
end
~~~
{: .language-matlab}


~~~
>> statistics_all
~~~
{: .language-matlab}

~~~
inflammation-01.csv
inflammation-02.csv
inflammation-03.csv
inflammation-04.csv
inflammation-05.csv
inflammation-06.csv
inflammation-07.csv
inflammation-08.csv
inflammation-09.csv
inflammation-10.csv
inflammation-11.csv
inflammation-12.csv
~~~
{: .output}

We need to add add the name folder containing the files to the `filenames`. We can do this using the `fullfile` function.
We can then add each filename to the `filenames` array.

~~~
%STATISTICS_ALL	Developing code to automate inflammation analysis

files = dir("data/inflammation-*.csv");
filenames = [];

for i = 1:length(files)
	file_name = files(i).name;
    file_name = fullfile("data", file_name);
    filenames = [filenames; file_name]
	disp(filenames(i))
end
~~~
{: .language-matlab}


~~~
>> statistics_all
~~~
{: .language-matlab}

~~~
inflammation-01.csv
inflammation-02.csv
inflammation-03.csv
inflammation-04.csv
inflammation-05.csv
inflammation-06.csv
inflammation-07.csv
inflammation-08.csv
inflammation-09.csv
inflammation-10.csv
inflammation-11.csv
inflammation-12.csv
~~~
{: .output}

>## Automatically generating plots for each file.
>
> We would like to use the `patient_vs_mean` function to compare a sample of the patients individual inflammation to 
> the mean inflammation for the entire dataset. 
>
> Use the code we've just written to read in all of the trial data into one array and then write a for loop that 
> generates comparison plots for the first 10 patients in the array and saves them to disk. Reuse the `patient_vs_mean`
> function we wrote at the end of the last lesson.
>
> > ## Solution
> > ~~~
> > %PlOT_PATIENT_VS_MEAN_SAMPLE Running patient_vs_mean on a sample of patients.
> >
> > files = dir("data/inflammation-*.csv");
> > filenames = [];
> >
> > for i = 1:length(files)
> >  file_name = files(i).name;
> >  file_name = fullfile("data", file_name);
> >  filenames = [filenames; file_name]
> >  disp(filenames(i));
> > end
> >
> > data = []
> >
> > for file_index = 1:12
> >  study_data = readmatrix(filenames(file_index));
> >  data = cat(1, data, study_data);
> > end
> >
> > per_day_mean = mean(data);
> >
> > for patient_no = 1:10
> >  patient_vs_mean(per_day_mean, data(patient_no,:), ['patient '+string(patient_no)])
> > end
> > ~~~
> > {: .language-matlab}
> {: .solution}
{: .challenge}
>
> Can we modify the script to generate a plot for every 50 patients in the full data set? Recall that we can 
> generate ranges with increments of different sizes, for example `1:2:10`.
>
> > ## Solution
> > ~~~
> > %PlOT_PATIENT_VS_MEAN_SAMPLE Running patient_vs_mean on a sample of patients.
> >
> > files = dir("data/inflammation-*.csv");
> > filenames = [];
> >
> > for i = 1:length(files)
> >  file_name = files(i).name;
> >  file_name = fullfile("data", file_name);
> >  filenames = [filenames; file_name];
> >  disp(filenames(i))
> > end
> >
> > data = []
> >
> > for file_index = 1:12
> >  study_data = readmatrix(filenames(file_index));
> >  data = cat(1, data, study_data);
> > end
> >
> > per_day_mean = mean(data);
> >
> > for patient_no = 1:50:length(data)
> >  patient_vs_mean(per_day_mean, data(patient_no,:), ['patient '+string(patient_no)])
> > end
> > ~~~
> > {: .language-matlab}
> {: .solution}
{: .challenge}

We've now looked at how to use loops to analyze data from multiple files. Next we will look at how we can use 
conditional statements to quickly and easily change what kind of analysis our code performs.
