---
title: Loading data
teaching: 15
exercises: 5
questions:
- "How can I load data to an array?"
objectives:
- "Read data from a csv to be able to work with it in matlab."
- Familiarize ourselves with our sample data.
keypoints:
- "Use `readmatrix` to read tabular CSV data into a program."
---


## Loading data to an array
Before we get started, let's create some directories to help organise this project.

> ## Tip: Good Enough Practices for Scientific Computing
>
> [Good Enough Practices for Scientific Computing](https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/)
> is a paper written by researchers involved with the Carpentries,
> which covers basic workflow skills for research computing.
> It recommends the following for project organization:
>
> 1. Put each project in its own directory, which is named after the project.
> 2. Put text documents associated with the project in the `doc` directory.
> 3. Put raw data and metadata in the `data` directory, and files generated during clean-up and analysis in a `results` directory.
> 4. Put source code for the project in the `src` directory,
>    and programs brought in from elsewhere or compiled locally in the `bin` directory.
> 5. Name all files to reflect their content or function.
>
{: .callout}

We already have a `data` directory in our `matlab-novice-inflammation` project directory,
so we only need to create a `results` directory for this project.
You can use your computer's file browser to create this directory.
We'll save all our scripts and function files in the main project directory.

A final step is to set the *current folder* in MATLAB to our project folder.
Use the **Current Folder** window in the MATLAB GUI to browse to your project folder
(`matlab-novice-inflammation`).

In order to check the current directory, we can run `pwd` (print working directory).
A second check we can do is to run the `ls` (list) command in the Command Window to list the contents
of the working directory ---
we should get the following output:

```
data   results
```
{: .output}



Reading data from files and writing data to them
are essential tasks in scientific computing,
and admittedly,
something that we'd rather not spend a lot of time thinking about.
Fortunately, MATLAB comes with a number of high-level tools to do these things efficiently,
sparing us the grisly detail.

If we know what our data looks like (in this case, we have a matrix stored as comma-separated values)
and we're unsure about what command we want to use,
we can search the documentation.
Type `read matrix` into the documentation toolbar.
MATLAB suggests using `readmatrix`.
If we have a closer look at the documentation,
MATLAB also tells us, which in- and output arguments this function has.

To load the data from our CSV file into MATLAB, type the following
command into the MATLAB command window, and press <kbd>Enter</kbd>:

```
>> patient_data = readmatrix('data/inflammation-01.csv');
```
{: .language-matlab}

This loads the data and assigns it to a variable, *patient_data*.
This is a good example of when to use a semi-colon to suppress output ---
try re-running the command without the semi-colon to find out why.
You should see a wall of numbers printed, which is the data from the file.

```
>> patient_data = readmatrix('data/inflammation-01.csv')
```
{: .language-matlab}

The expression `readmatrix(...)` is a
[function call]({{ page.root }}/reference.html#function-call).
Functions generally need [arguments]({{ page.root }}/reference.html#argument)
to run.
In the case of the `readmatrix` function, we need to provide a single
argument: the name of the file we want to read data from. This
argument needs to be a character string or
[string]({{ page.root }}/reference.html#string), so we put it in quotes.


Now that our data is in memory, we can start doing things with it.
First, let's find out its [size]({{ page.root }}/reference.html#size):

```
>> size(patient_data)
```
{: .language-matlab}

```
ans =

    60 40
```
{: .output}

The output tells us that the variable `patient_data`
refers to a table of values
that has 60 rows and 40 columns.

MATLAB stores *all* data in the form of multi-dimensional arrays. For example:

* Numbers, or *scalars* are represented as two dimensional arrays with only one row and one column, as are single characters.
* Lists of numbers, or *vectors* are two dimensional as well, but the value of one of the dimensions equals one.
  By default vectors are row vectors, meaning they have one row and as many columns as there are elements in the vector.
* Tables of numbers, or *matrices* are arrays with more than one column and more than one row.
* Even character strings, like sentences, are stored as an "array
of characters".

Normally, MATLAB arrays can't store elements of different data types. For
instance, a MATLAB array can't store both a `float` and a `char`. To do that,
you have to use a [Cell Array](http://www.mathworks.com/help/matlab/cell-arrays.html).

We can use the `class` function to find out what type of data lives
inside an array:

```
>> class(patient_data)
```
{: .language-matlab}

```
ans =
    'double'
```
{: .output}

This output tells us that `patient_data` contains
double precision floating-point numbers. This is the default numeric
data type in MATLAB. If you want to store other numeric data types,
you need to tell MATLAB explicitly. For example, the command,

```
>> x = int16(325);
```
{: .language-matlab}


assigns the value `325` to the name `x`, storing it as a 16-bit signed
integer.


