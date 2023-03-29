---
title: Plotting data
teaching: 30
exercises: 0
questions:
- "How can I visualize my data?"
objectives:
- "Display simple graphs with adequate titles and labels."
- "Get familiar with functions `plot`, `heatmap` and `imagesc`."
- "Learn how to show images side by side."
keypoints:
- "Use `plot(vector)` to visualize data in the y axis with an index number in the x axis."
- "Use `plot(X,Y)` to specify values in both axes."
- "Document your plots with `title('My title')`, `xlabel('My horizontal label')` and `ylabel('My vertical label')`."
- "Use `subplot(m,n,p)` to create a grid of `m` x `n` plots, and choose a position `p` for a plot."
---



## Plotting
The mathematician Richard Hamming once said,
"The purpose of computing is insight, not numbers," and the best
way to develop insight is often to visualize data. Visualization
deserves an entire lecture (or course) of its own, but we can
explore a few features of MATLAB here.

We will start by exploring the function `plot`.
If we only provide a vector as an argument it plots a data-point for each value on the y axis,
and it uses the index of each element as the x axis.
The the average (accross patients) inflammation over time can then be plotted with:
```
>> plot(per_day_mean)
```
{: .language-matlab}
> **Note:** We do not even need to have the vactor saved as a variable.
> We would obtain the same plot with the command `plot(mean(patient_data, 1))`.
{: .callout}

As it is, the image is useless.
We need to give the figure a `title` and label the axes using `xlabel` and `ylabel`,
so that other people can understand what it shows
(including us if we return to this plot 6 months from now).
```
>> title('Daily average inflammation')
>> xlabel('Day of trial')
>> ylabel('Inflammation')
```
{: .language-matlab}

![Average inflammation]({{ page.root }}/fig/average-inflammation.png)

Much better, now the image actually communicates something.

The result is roughly a linear rise and fall, which is suspicious:
based on other studies, we expect a sharper rise and slower fall.
Let's have a look at two other statistics: the maximum and minimum
inflammation per day across all patients.
```
>> plot(per_day_max)
>> title('Maximum inflammation per day')
>> ylabel('Inflammation')
>> xlabel('Day of trial')
```
{: .language-matlab}

![Maximum inflammation]({{ page.root }}/fig/max-inflammation.png)

```
>> plot(per_day_min)
>> title('Minimum inflammation per day')
>> ylabel('Inflammation')
>> xlabel('Day of trial')
```
{: .language-matlab}

![Minumum inflammation]({{ page.root }}/fig/min-inflammation.png)

From the figures, we see that the maximum value rises and falls perfectly
smoothly, while the minimum seems to be a step function. Neither result
seems particularly likely, so either there's a mistake in our
calculations or something is wrong with our data.

> ## Specifying both axes
>
> For our patient data the indices coincide with the day of the study,
: but in most cases using the indices on the x axis is not desireable.
> To pass data for both the x and y values we can use the same `plot` function,
> but we give it two vectors as arguments `(X,Y)`.
> For example, the snipet bellow defines both `X` and `Y` and plots them:
> ```
> >> time=0:.1:14;
> >> sin_t=sin(t);
> >> plot(time,sin_t)
> >> title('Sinusoidal function')
> >> ylabel("sin(t)")
> >> xlabel("t")
> ```
> {: .language-matlab}
>
> ![Sine Function]({{ page.root }}/fig/sine.png)
>
{: .callout}


## Subplots

It is often convenient to combine multiple plots into one figure.
The `subplot(m,n,p)`command allows us to do just that.
The first two parameter define a grid of `m` rows and `n` columns,
in which our plots will be placed.
The third parameter indicates the position on the grid that we want to use for the "next" plot command.
For example, we can show the average daily min and max plots together with:
```
>> subplot(1, 2, 1)
>> plot(per_day_max)
>> ylabel('max')
>> xlabel('day')

>> subplot(1, 2, 2)
>> plot(per_day_min)
>> ylabel('min')
>> xlabel('day')
```
{: .language-matlab}

![Max Min subplot]({{ page.root }}/fig/max-min-subplot.png)



## Heatmaps

If we wanted to look at all our data at the same time we need a three dimensions:
One for the patients, one for the days, and another one for the inflamation values.
An option is to use a heatmap, that is, use the colour of each point to represent the inflamation values.

In matlab, at least two methods can do this for us. 
The [`heatmap` function](https://uk.mathworks.com/help/matlab/ref/heatmap.html)
takes a table as input and produces a heatmap:
```
>> heatmap(patient_data)
>> title('Inflammation')
>> xlabel('Day of trial')
>> ylabel('Patient number')
```
{: .language-matlab}

![Heat map]({{ page.root }}/fig/heatmap.png)

We gain something by visualizing the whole dataset at once,
but it is harder to distinwish the overly linear rises and fall over a 40 day period.

Similarly, the [`imagesc` function](https://uk.mathworks.com/help/matlab/ref/imagesc.html)
represents the matrix as a color image. 
```
>> imagesc(patient_data)
>> title('Inflammation')
>> xlabel('Day of trial')
>> ylabel('Patient number')
```
{: .language-matlab}

![Heat map]({{ page.root }}/fig/inflammation-heatmap.png)

Every value in the matrix is *mapped* to a color. 
Blue regions in this heat map are low values, while yellow shows high values.

Both functions provide very similar information, and can be tweaked to your liking.
The `imagesc` function is usually only used for purely numerical arrays,
whereas `heatmap` can process [tables](https://uk.mathworks.com/help/matlab/ref/table.html)
(that can have strings or categories in them).
In our case, which one you use is a matter of taste.

### Conclusions on our data analysis
Our work so far has convinced us that something is wrong with our
first data file. We would like to check the other 11 the same way,
but typing in the same commands repeatedly is tedious and error-prone.
Since computers don't get bored (that we know of), we should create a
way to do a complete analysis with a single command, and then figure out
how to repeat that step once for each file. These operations are the
subjects of the next two lessons.
