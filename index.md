---
permalink: index.html
site: sandpaper::sandpaper_site
---

The best way to learn how to program is to do something useful, so this
introduction to [MATLAB](https://en.wikipedia.org/wiki/MATLAB) is built around a common scientific task: data analysis.
Our real goal isn't to teach you MATLAB, but to teach you the basic concepts
that all programming depends on. We use MATLAB in our lessons because:

1. we have to use *something* for examples;
2. it's well-documented;
3. it has a large (and growing) user base among scientists in academia and industry; and
4. it has a large library of packages available for performing diverse tasks.

But the two most important things are to use whatever language your colleagues
are using, so that you can share your work with them easily, and to use that
language *well*.

:::::::::::::::::::::::::::::::::::::::::  callout

### Introductory slides

The [introductory slides](episodes/files/intro_slides.pdf), shown at the beginning of the session, contain a lot of useful links, including the feedback form.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::::  callout

## GNU Octave

[GNU Octave](https://www.gnu.org/software/octave/) is a free and open-source alternative
to MATLAB which shares its syntax ([see more about compatibility](https://en.wikipedia.org/wiki/GNU_Octave#MATLAB_compatibility)).
Thus, if you don't have access to MATLAB, you can easily set up Octave
on your computer and still work through the lesson.


::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::  prereq

## Prerequisites

To begin tackling this lesson, you will need to:

- Understand the concepts of files and directories, and the concept of a "working directory".
- Know how to start up MATLAB, and access the *command window* (which generally has a `>>` prompt).
- Know how to create, edit and save text files.
  

::::::::::::::::::::::::::::::::::::::::::::::::::

## Overview of the data

We are studying inflammation in patients who have been given a new treatment.
Our dataset is divided in 3 groups:

- The base group consists of 12 files containing a base study of inflammation after a surgery without any new treatment.
- The control group consists of 6 files containing the data for patients that were given a placebo.
- The test group consists of 6 files containing the data for patients that were given the new treatement.

In the files, each row holds information for a single patient and the columns represent successive days.

![](fig/inflammation-data.png){alt='Information saved in each data file.'}

The actual data sets do not have titles for columns or rows.
The data is stored in [Comma Separated Values (CSV)](learners/reference.md#comma-separated-values) format.
This means that values in a single row are separated with a `,`.
The first few rows of our first file,
[`inflammation-01.csv`](episodes/data/matlab-novice-inflammation/data/inflammation-01.csv), look like this:

```
0,0.065,0.169,0.271,0.332,0.359,0.354,0.333,0.304,0.268,0.234,0.204,0.179,0.141,0.133,0.115,0.083,0.076,0.065,0.065,0.047,0.04,0.041,0.028,0.02,0.028,0.012,0.02,0.011,0.015,0.009,0.01,0.01,0.007,0.007,0.001,0.008,-0,0.006,0.004
0,0.034,0.114,0.2,0.272,0.321,0.328,0.32,0.314,0.287,0.246,0.215,0.207,0.171,0.146,0.131,0.107,0.1,0.088,0.065,0.061,0.052,0.04,0.042,0.04,0.03,0.031,0.031,0.016,0.019,0.02,0.017,0.019,0.006,0.009,0.01,0.01,0.005,0.001,0.011
0,0.081,0.216,0.277,0.273,0.356,0.38,0.349,0.315,0.23,0.235,0.198,0.106,0.198,0.084,0.171,0.126,0.14,0.086,0.01,0.06,0.081,0.022,0.035,0.01,0.086,-0,0.102,0.032,0.07,0.017,0.136,0.022,-0,0.031,0.054,-0,-0,0.05,0.001
```

We want to explore and analyse this data, and for that we will need to:

- Load that data into memory.
- Make operations with the data.
- Visualize the processed data.

To do all that, we'll have to learn a little bit about programming.
