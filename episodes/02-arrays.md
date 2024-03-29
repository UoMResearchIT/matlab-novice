---
title: Arrays
teaching: 30
exercises: 10
---

::::::::::::::::::::::::::::::::::::::: objectives

- Learn how to create multidimensional arrays
- Select individual values and subsections of an array.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How can I access the information in an array?

::::::::::::::::::::::::::::::::::::::::::::::::::

## Initializing an Array

We just talked about how MATLAB *thinks* in arrays, and declared some very simple arrays using square brackets.
In some cases, we will want to create space to save data, but not save anything just yet.
One way of doing so is with `zeros`.
The function [zeros](https://uk.mathworks.com/help/matlab/ref/zeros.html)
takes the dimensions of our array as arguments, and populates it with zeros. For example,
```matlab
>> Z = zeros(3,5)
```
```output
Z =
     0     0     0     0     0
     0     0     0     0     0
     0     0     0     0     0
```
creates a matrix of 3 rows and 5 columns, filled with zeros.
If we had only passed one dimension, MATLAB assumes you want a square matrix, so
```matlab
>> Z = zeros(3)
```
```output
Z =
     0     0     0
     0     0     0
     0     0     0
```
yields a 3×3 array.
If we want a single row and 5 columns, we need to remember that MATLAB reads `rows`×`columns`, so
```matlab
>> Z = zeros(1,5)
```
```output
Z =
     0     0     0     0     0
```

This way `zeros` function works is shared with many other functions that create arrays.

For example, the [`ones` function](https://uk.mathworks.com/help/matlab/ref/ones.html)
is nearly identical, but the arrays are filled with ones, and
the [`rand` function](https://uk.mathworks.com/help/matlab/ref/rand.html)
assigns uniformly distributed random numbers between zero and 1 to each space in the array.
```matlab
>> R = rand(8);
>> O = ones(10,10);
```

:::::::::::::::::::::::::::::::::::::::::  callout

**Note:** This is when supressing the output becomes more important.
You can more comfortably explore the variables `R` and `O` by double clicking them in the workspace.

::::::::::::::::::::::::::::::::::::::::::::::::::

The `ones` function can actually help us initialize a matrix to any value,
because we can multiply a matrix by a constant and it will multiply each element.
So for example,
```matlab
>> Fives = ones(3,6)*5;
```
Produces a 3×6 matrix full of fives.


The [`magic` function](https://uk.mathworks.com/help/matlab/ref/magic.html) works in a similar way,
but you can only declare square matrices with it.
The magic thing about them is that the sum of the elements on each row or column is the same number.
```matlab
>> M = magic(4)
```
```output
M =
    16     2     3    13
     5    11    10     8
     9     7     6    12
     4    14    15     1
```
In this case, each row or column adds up to 34.
But how could I tell in a bigger matrix?
How can I select some of the elements of the array and sum them, for example?


## Array indexing

Array **indexing**, is the method by which we can select one or more different elements of an array.
A solid understanding of array indexing will be essential to working with arrays.
Lets start with selecting one element.

First, we will create an 8×8 "magic" matrix:

```matlab
>> M = magic(8)
```

```output
ans =

   64    2    3   61   60    6    7   57
    9   55   54   12   13   51   50   16
   17   47   46   20   21   43   42   24
   40   26   27   37   36   30   31   33
   32   34   35   29   28   38   39   25
   41   23   22   44   45   19   18   48
   49   15   14   52   53   11   10   56
    8   58   59    5    4   62   63    1
```

We want to access a single value from the matrix:

![](fig/matrix-single-element.svg){alt='Accessing a single value'}

To do that, we must provide its [index]({{ page.root }}/reference.html#index) in parentheses.
In a 2D array, this means the row and column of the element separated by a comma,
that is, as `(row, column)`. This index goes after the name of our array. In our case, this is:
```matlab
>> M(5, 6)
```
```output
ans = 38
```

So the index `(5, 6)` selects the element on the fifth row and sixth column of `M`.

:::::::::::::::::::::::::::::::::::::::::  callout

**Note:** Matlab starts counting indices at 1, not 0! Many other programming languages start counting indices at 0, so 
be careful!.

::::::::::::::::::::::::::::::::::::::::::::::::::

An index like the one we used selects a single element of an array,
but we can also select a group of elements if instead of a number we give arrays of indices.
For example, if we want to select this submatrix:

![](fig/matrix-submatrix.svg){alt='Accessing a submatrix'}

we want rows 4, 5 and 6, and columns 5, 6 and 7, that is, the arrays `[4,5,6]` for rows, and `[5,6,7]` for columns:
```matlab
>> M([4,5,6],[5,6,7])
```
```output
ans =
   36   30   31
   28   38   39
   45   19   18
```

:::::::::::::::::::::::::::::::::::::::::  callout

## The `:` operator

In matlab, the symbol `:` ([`colon`](https://uk.mathworks.com/help/matlab/ref/colon.html)) is used to specify a range.
The range is specified as `start:end`.
For example, if we type `1:6` it generates an array of consecutive numbers from 1 to 6:
```matlab
>> 1:6
```
```output
ans =
   1     2     3     4     5     6
```

We can also specify an *increment* other than one.
To specify the increment, we write the range as `start:increment:end`.
For example, if we type `1:3:15` it generates an array starting with 1, then 1+3, then 1+2*3, and so on,
until it reaches 15 (or as close as it can get to 15 without going past it):
```matlab
>> 1:3:15
```
```output
ans =
   1     4     7    10    13
```
The array stopped at 13 because 13+3=16, which is over 15.

::::::::::::::::::::::::::::::::::::::::::::::::::

The rows and columns we just selected could have been specified as ranges.
So if we want the rows from 4 to 6 and columns from 5 to 7,
we can specify the ranges as `4:6` and `5:7`.
On top of being a much quicker and neater way to get the rows and columns,
MATLAB knows that the range will produce an array, so we do not even need the square brackets anymore.
So the command above becomes:
```matlab
>> M(4:6, 5:7)
```
```output
ans =
   36   30   31
   28   38   39
   45   19   18
```
:::::::::::::::::::::::::::::::::::::::  challenge

## Checkerboard

Select the elements highlighted on the image:

![](fig/matrix-strided-rowncols.svg){alt='Accessing strided rows and columns'}

:::::::::::::::  solution

We need to select every other element in both dimensions.
To do that, we define the apropriate intervals with an increment of 2:
```matlab
>> M(1:3:8, 2:2:8)
```
```output
ans =
    2   61    6   57
   26   37   30   33
   15   52   11   56
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::


### Selecting whole rows or columns

If we want a whole row, for example:

![](fig/matrix-row.svg){alt='Accessing a row'}

we could in principle pick the 5th row and for the columns use the range `1:8`.
```matlab
>> M(5, 1:8)
```
```output
ans =
   32   34   35   29   28   38   39   25
```
However, we need to know that there are 8 columns, which is not very robust.

:::::::::::::::::::::::::::::::::::::::::  callout

## The key-word `end`

When indexing the elements of an array, the key word `end` can be used to get the last index available.

For example, `M(2, end)` returns the last element of the second row:
```matlab
>> M(2, end)
```
```output
ans =
   16
```

We can also use it in combination with the `:` operator.
For example, `M(5:end, 3)` returns the elements of column 3 from row 5 until the end:
```matlab
>> M(5:end,3)
```
```output
ans =
   35
   22
   14
   59
```

::::::::::::::::::::::::::::::::::::::::::::::::::

We can then use the keyword `end` instead of the 8 to get the whole row with `1:end`.
```matlab
>> M(5, 1:end)
```
```output
ans =
   32   34   35   29   28   38   39   25
```
This is much better, now this works for any size of matrix, and we don't need to know the size.

:::::::::::::::::::::::::::::::::::::::::  callout

## Using `:` as an index

Getting a whole row or column is such a common operation, that MATLAB has a shortcut:
Using `:` alone is equivalent to `1:end`!

For example, We can then get the whole fifth row with:
```matlab
>> M(5, :)
```
```output
ans =
   16
```

::::::::::::::::::::::::::::::::::::::::::::::::::

As you can see, the `:` operator is quite important when accessing arrays!

We can use it to select multiple rows,

![](fig/matrix-multi-rows.svg){alt='Accessing multiple rows'}

```matlab
>> M(1:4, :)
```
```output
ans =
   64    2    3   61   60    6    7   57
    9   55   54   12   13   51   50   16
   17   47   46   20   21   43   42   24
   40   26   27   37   36   30   31   33
```

or multiple columns:

![](fig/matrix-multi-cols.svg){alt='Accessing multiple columns'}

```matlab
>> M(:, 6:end)
```
```output
ans =
    6    7   57
   51   50   16
   43   42   24
   30   31   33
   38   39   25
   19   18   48
   11   10   56
   62   63    1
```

or even the whole matrix. Try for example:

```matlab
>> N = M(:)
```
and you'll see that it returns all the elements of M.
The result, however, is a column vector, not a matrix.
We can make sure that the result of `M(:)` has 8x8=64 elements
by using the function [size](https://uk.mathworks.com/help/matlab/ref/size.html),
which returns the dimensions of the array given as an input:
```matlab
>> size(N)
```
```output
ans =
   64    1
```
So it has 64 rows and 1 column.
Effectively, then, `M(:)` 'flattens' the array into a column vector.
The order of the elements in the resulting vector comes from appending each column of the original array in turn.
This is the result of something called [linear indexing](https://uk.mathworks.com/company/technical-articles/matrix-indexing-in-matlab.html),
which is a way of accessing elements of an array by a single index.

:::::::::::::::::::::::::::::::::::::::  challenge

## Master indexing

Select the elements highlighted on the image without using the numbers 5 or 8, and using `end` only once:

![](fig/matrix-strided-rows.svg){alt='Accessing strided columns'}

:::::::::::::::  solution

We need to tart with row `2`, and subsequently select every third row:
```matlab
>> M(2:3:end, :)
```
```output
ans =
    9   55   54   12   13   51   50   16
   32   34   35   29   28   38   39   25
    8   58   59    5    4   62   63    1
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

## Slicing character arrays

A subsection of an array is called a [slice]({{ page.root }}/reference.html#slice).
We can take slices of character arrays as well:

```matlab
>> element = 'oxygen';
>> disp("first three characters: " + element(1:3))
>> disp("last three characters: " + element(4:6))
```

```output
first three characters: oxy
last three characters: gen
```

And we can use all the tricks we have learned to select the data we want.
For example, to select every other character we can use the colon operator with an increment of 2:
```matlab
>> element(1:2:end)
```
```output
ans =
    'oye'
```

We can also use the colon operator to access all the elements of the array,
but you'll notice that the only difference between evaluating `element` and `element(:)`
is that the former is a row vector, and the latter a column vector.




:::::::::::::::::::::::::::::::::::::::: keypoints

- Some functions to initialize matrices include `zeros`, `ones`, and `rand`.
  They all produce a square matrix if only one argument is given,
  but you can specify the dimensions you want separated by a comma, as in `zeros(rows,columns)`.
- To select data points we use round brackets and provide the row and column indices of the elements we want.
  They can be just numbers or arrays of numbers, e.g. `M(5,[3,4,5])`.
- Use the colon operator `:` to generate ordered arrays as `start:end` or `start:increment:end`.
- Use the keyword `end` to obtain the index of the final element.
- The colon operator by itself `:` selects all the elements.

::::::::::::::::::::::::::::::::::::::::::::::::::


