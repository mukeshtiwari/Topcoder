# [MoreSquares](/tc?module=ProblemDetail&rd=17450&pm=15362)
*TCO19 SRM 754 Round 1 - Division I, Level One*

## Statement
Given a set of points in the plane, its square count is the number of ways in which we can select four of those points in such a way that they form the corners of a square.
The square may be rotated arbitrarily. Order of the four points does not matter. For example, the square count for the set { (1,2), (1,0), (0,1), (2,1) } is 1.

You are given a set S of points in the plane with integer coordinates.
Return the number of points P with the following property: P is not in S, and if we add P to S, the square count will increase.

In order to keep the input size small, S is given as follows:
You are given the ints *N*, *SX*, *SY*, and the int[]s *Xprefix* and *Yprefix*.
Use the pseudocode given below to generate S.

X, Y = two empty arrays of length N each
L    = length(Xprefix)

for i = 0 .. L-1:
    X[i] = Xprefix[i]
    Y[i] = Yprefix[i]

for i = L .. N-1:
    X[i] = ( X[i-1] * 47 + 42 ) modulo SX
    Y[i] = ( Y[i-1] * 47 + 42 ) modulo SY

for i = 0 .. N-1:
    if (X[i], Y[i]) is not in S:
        add (X[i], Y[i]) to S

## Definitions
- *Class*: `MoreSquares`
- *Method*: `countLocations`
- *Parameters*: `int, int, int, int[], int[]`
- *Returns*: `int`
- *Method signature*: `int countLocations(int N, int SX, int SY, int[] Xprefix, int[] Yprefix)`

## Notes
- The reference solution would work fast enough for any input of the given size, it does not depend on any properties of the pseudorandom generator.
- The new point P can lie anywhere in the plane.

## Constraints
- *N* will be between 1 and 3,000, inclusive.
- *SX* and *SY* will each be between 1 and 10^6, inclusive.
- *Xprefix* will have between 1 and min(100,*N*) elements, inclusive.
- *Yprefix* will have the same number of elements as *Xprefix*.
- Each element of *Xprefix* will be between 0 and *SX*-1, inclusive.
- Each element of *Yprefix* will be between 0 and *SY*-1, inclusive.

## Examples
### Example 1
#### Input
<c>3,<br />100,<br />100,<br />[3, 0, 2],<br />[0, 1, 2]</c>
#### Output
<c>1</c>
#### Reason
The set S contains the points (3,0), (0,1), and (2,2). By adding a fourth point at (1,-1) we can increase the square count from 0 to 1.

### Example 2
#### Input
<c>5,<br />100,<br />100,<br />[47, 47, 47, 47, 47],<br />[47, 47, 47, 47, 47]</c>
#### Output
<c>0</c>
#### Reason
The set S contains only one point: (47, 47). Adding a second point will always produce a two-element set with square count zero.

### Example 3
#### Input
<c>23,<br />11,<br />13,<br />[7],<br />[0]</c>
#### Output
<c>5</c>
#### Reason
The set S contains 20 points. In the order of insertion, these are: (7, 0), (8, 3), (0, 1), (9, 11), (3, 0), (7, 3), (8, 1), (0, 11), (9, 0), (3, 3), (7, 1), (8, 11), (0, 0), (9, 3), (3, 1), (7, 11), (8, 0), (0, 3), (9, 1), (3, 11). The last three points generated using the formula in the statement are (7, 0), (8, 3), and (0, 1) again.

The five possible locations for the new point that increases the square count are (6, 2), (8, -1), (8, 2), (10, 2), and (11, 8).


