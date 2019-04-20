# [CycleLength](/tc?module=ProblemDetail&rd=17396&pm=15287)
*TCO19 SRM 747 Round 1 - Division II, Level Two*

## Statement
Hermi has read somewhere that one of the measures of quality for a pseudorandom generator is the length of its period.
Help him test some simple generators for this property.

Formally, the period length of an infinite sequence { A[0], A[1], A[2], ... } is the smallest positive integer p such that starting from some n=n0 we have A[n+p] = A[n] for all n.
Of course, some infinite sequences don't have any period, but those in this problem will all have some finite periods.

Note that the period doesn't have to start right at the beginning of the sequence.
For example, suppose we have the sequence { 4, 7, 1024, 15, 1, 2, 3, 1, 2, 3, 1, 2, 3, ... } that goes on by repeating 1, 2, 3 forever.
The length of the period of this sequence is 3.

Hermi's generators are linear congruential generators.
You are given the parameters of one generator: the ints *seed*, *a*, *b*, and *m*.
The generator itself is shown below.
Compute and return the length of its period.

state = seed
while True:
    print(state)
    state = (state * a + b) modulo m

## Definitions
- *Class*: `CycleLength`
- *Method*: `solve`
- *Parameters*: `int, int, int, int`
- *Returns*: `int`
- *Method signature*: `int solve(int seed, int a, int b, int m)`

## Notes
- It can be shown that the output of the generator always has a finite period.

## Constraints
- *m* will be between 1 and 10^6, inclusive.
- *seed*, *a* and *b* will each be between 0 and *m*-1, inclusive.

## Examples
### Example 1
#### Input
<c>7,<br />3,<br />4,<br />10</c>
#### Output
<c>4</c>
#### Reason
The generated sequence is {7, 5, 9, 1, 7, 5, 9, 1, 7, 5, 9, 1, ...} and its period length is 4.

### Example 2
#### Input
<c>1,<br />2,<br />0,<br />997</c>
#### Output
<c>332</c>
#### Reason
The sequence begins {1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 27, ...}. Eventually it starts repeating itself.

### Example 3
#### Input
<c>47,<br />0,<br />23,<br />100</c>
#### Output
<c>1</c>
#### Reason
The sequence {47, 23, 23, 23, 23, 23, 23, 23, 23, ...} has period length 1.

### Example 4
#### Input
<c>548687,<br />538918,<br />376524,<br />931161</c>
#### Output
<c>690</c>
#### Reason
Watch out for integer overflow when generating the sequence! The correct first few elements of this sequence are { 548687, 52352, 564521, 120560, 571829, 653435, 861713, 684494, 565739, 54179, 930530, 193031, ... }


