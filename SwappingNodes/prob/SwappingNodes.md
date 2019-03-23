# [SwappingNodes](/tc?module=ProblemDetail&rd=17426&pm=15335)
*2019 Humblefool Cup Prelims - Division I, Level One*

## Statement
We have a full binary tree.
That is, we have a rooted tree in which all leaves have the same depth, and each node that is not a leaf has exactly one left child and one right child.
Each leaf of our tree contains a positive integer, and these integers are distinct.

As an example, the figure below shows a full binary tree with four leaves:

________C________
                             /                 \
                        ____A____           ____B____ 
                       /         \         /         \
		      5 	  2       1           3

You are given the int[] *leaves*: the values that are currently stored in the leaves of the tree, read from the left to the right.
For example, for the tree shown above you would be given *leaves* = {5, 2, 1, 3}.

For your convenience, you are also given the int *numberOfLeaves*.
Its value will be equal to the number of elements in *leaves*.

You are allowed to transform our tree by performing a sequence of steps.
In each step you can select any inner node of the tree and swap its left and right subtrees.
(That is, the left child of the selected node becomes its right child and vice versa.)
You may do arbitrarily many steps, including zero.
You may choose the same node multiple times if you wish.

After you are done transforming the tree, we are going to read the values stored in its leaves (again, from the left to the right).
Your task is to make this sequence as small as possible.
Compute and return the lexicographically smallest sequence that can be constructed in the leaves of the tree.
(See Notes for the definition of "lexicographically smaller".)

## Definitions
- *Class*: `SwappingNodes`
- *Method*: `swapNodes`
- *Parameters*: `int[], int`
- *Returns*: `int[]`
- *Method signature*: `int[] swapNodes(int[] leaves, int numberOfLeaves)`

## Notes
- Given two distinct sequences A = a0,a1,....an-1 and B = b0,b1,....bn-1, the lexicographically smaller sequence is the one that has a smaller value at the first index where they differ. In other words, the sequence A is smaller than the sequence B if for some index x we have (ax < bx) and (for all i < x : ai = bi).

## Constraints
- *leaves* will have between 1 and 512 elements, inclusive.
- The number of elements in *leaves* will be a power of 2.
- Each element of *leaves* will be between 1 and 512, inclusive.
- All values of *leaves* will be distinct.
- *numberOfLeaves* will be equal to the number of elements in *leaves*.

## Examples
### Example 1
#### Input
<c>[5,2,1,3],<br />4</c>
#### Output
<c>[1, 3, 2, 5 ]</c>
#### Reason
The input describes the tree shown in the problem statement.

One optimal solution looks as follows:

Select node C and swap its subtrees. This produces a tree that corresponds to the sequence {1, 3, 5, 2}.
Then, select node A and swap its subtrees. (Note that A is currently the right child of C.) This produces a tree that corresponds to the sequence {1, 3, 2, 5}.

The sequence {1, 3, 2, 5} is the lexicographically smallest of all sequences that can be produced by transforming the tree, and therefore this is the correct return value.

### Example 2
#### Input
<c>[13, 10, 18, 16],<br />4</c>
#### Output
<c>[10, 13, 16, 18 ]</c>
#### Reason
Here, one optimal solution looks as follows:

Select the left child of the root of the tree. New sequence: {10, 13, 18, 16}.
Then, select the right child of the root of the tree. New sequence: {10, 13, 16, 18}.

Obviously, the sequence we just produced has to be optimal, so we are done.


