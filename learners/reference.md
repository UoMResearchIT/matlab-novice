---
title: 'Learning resources'
---

[MATLAB online](https://mathworks.com/products/matlab-online.html) lets you use the software for free, which can be useful when you do not have access to the university licences.

The [tutorials section](https://mathworks.com/support/learn-with-matlab-tutorials.html)
on MATLAB's site also lists useful video tutorials and examples to work through.

[MATLAB Academy](https://matlabacademy.mathworks.com/)
provides a lot of self-taught material and free courses.
In particular, the [Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted) program covers material similar to this course.

[MATLAB cody](https://mathworks.com/matlabcentral/cody) can be a good way to keep practicing and find interesting challenges to learn how to code with MATLAB.


## Glossary

[argument]{#argument}
:   A value given to a function or program when it runs.
The term is often used interchangeably (and inconsistently) with [parameter](#parameter).

[array]{#array}
:   A collection of values saved in a single variable
and accessed through an [index](#index)

[assign]{#assign}
:   To give a value a name by associating a variable with it.

[body]{#body}
:   (of a function): the statements that are executed when a function runs.

[boolean]{#boolean}
:   A type of variable to store logical values, such as 1,0 or true,false.

[case-insensitive]{#case-insensitive}
:   Treating text as if upper and lower case characters of the same letter were the same.
See also: [case-sensitive](#case-sensitive).

[case-sensitive]{#case-sensitive}
:   Treating text as if upper and lower case characters of the same letter are different.
See also: [case-insensitive](#case-insensitive).

[comment]{#comment}
:   A remark in a program that is intended to help human readers understand what is going on,
but is ignored by the computer.
Comments in MATLAB start with a `%` character and run to the end of the line;

[compose]{#compose}
:   To apply one function to the result of another, such as `f(g(x))`.

[conditional statement]{#conditional-statement}
:   A statement in a program that might or might not be executed
depending on whether a test is true or false.

[comma-separated values]{#comma-separated-values}
:   (CSV) A common textual representation for tables
in which the values in each row are separated by commas.

[default value]{#default-value}
:   A value to use for a [parameter](#parameter) if nothing is specified explicitly.

[delimiter]{#delimiter}
:   A character or characters used to separate individual values,
such as the commas between columns in a [CSV](#comma-separated-values) file.

[documentation]{#documentation}
:   Human-language text written to explain what software does,
how it works, or how to use it.

[empty string]{#empty-string}
:   A character string containing no characters,
often thought of as the "zero" of text.

[encapsulation]{#encapsulation}
:   The practice of hiding something's implementation details
so that the rest of a program can worry about *what* it does
rather than *how* it does it.

[floating-point number]{#floating-point-number}
:   A number containing a fractional part and an exponent.
See also: [integer](#integer).

[for loop]{#for-loop}
:   A loop that is executed once for each value in some kind of set, list, or range.
See also: [while loop](#while-loop).

[function call]{#function-call}
:   A use of a function in another piece of software.

[in-place operators]{#in-place-operators}
:   An operator such as `+=` that provides a shorthand notation for
the common case in which the variable being assigned to
is also an operand on the right hand side of the assignment.
For example, the statement `x += 3` means the same thing as `x = x + 3`.

[index]{#index}
:   A subscript that specifies the location of a single value in a collection, such as a single element of an array.

[inner loop]{#inner-loop}
:   A loop that is inside another loop. See also: [outer loop](#outer-loop).

[integer]{#integer}
:   A whole number, such as -12343. See also: [floating-point number](#floating-point-number).

[library]{#library}
:   A family of code units (functions, classes, variables) that implement a set of
related tasks.

[loop body]{#loop-body}
:   The set of instructions appearing between the line with the `for` keyword and
the line with the `end` keyword.

[loop variable]{#loop-variable}
:   The variable that keeps track of the progress of the loop.

[outer loop]{#outer-loop}
:   A loop that contains another loop.
See also: [inner loop](#inner-loop).

[parameter]{#parameter}
:   A variable named in the function's declaration that is used to hold a value passed into the call.
The term is often used interchangeably (and inconsistently) with [argument](#argument).

[pipe]{#pipe}
:   A connection from the output of one program to the input of another.
When two or more programs are connected in this way, they are called a "pipeline".

[RGB]{#rgb}
:   Amodel that represents colors as combinations of red, green, and blue.
Each color's value is typically in the range 0..255
(i.e., a one-byte integer).

[size]{#size}
:   An array's dimensions, represented as a vector.
For example, a 5×3 array's size is `(5,3)`.

[slice]{#slice}
:   A regular subsequence of a larger sequence,
such as the first five elements or every second element.

[standard input]{#standard-input}
:   A process's default input stream.
In interactive command-line applications,
it is typically connected to the keyboard; in a [pipe](#pipe),
it receives data from the [standard output](#standard-output) of the preceding process.

[standard output]{#standard-output}
:   A process's default output stream.
In interactive command-line applications,
data sent to standard output is displayed on the screen;
in a [pipe](#pipe),
it is passed to the [standard input](#standard-input) of the next process.

[stride]{#stride}
:   The inter-element increment of a regularly-spaced list of integers, as generated
by MATLAB's colon operator.

[string]{#string}
:   Short for "character string",
a sequence of zero or more characters.

[syntax error]{#syntax-error}
:   CHECKME: a programming error that occurs when statements are in an order or contain characters
not expected by the programming language

[type]{#type}
:   The classification of objects in a program.
For example, a variable's type can be [boolean](#boolean), [integer](#integer), [array](#array), [string](#string), among others.

[while loop]{#while-loop}
:   A loop that keeps executing as long as some condition is true.
See also: [for loop](#for-loop).
