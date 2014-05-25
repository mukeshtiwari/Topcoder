# [TwoWaysSorting](http://community.topcoder.com/tc?module=ProblemDetail&rd=15854&pm=11084)
*Single Round Match 621 Round 1 - Division II, Level One*

## Statement
Sasha has a String[] *stringList*. No two elements of *stringList* have the same length.

So far, Sasha has learned two ways of sorting strings:

He can sort strings lexicographically. For example, "car" < "carriage" < "cats" < "doggies". (See Notes for a definition of the lexicographic order.)
	He can also sort strings according to their lengths in ascending order. For example, "car" < "cats" < "doggies" < "carriage".

Sasha now wonders whether *stringList* is sorted in either of these two ways. Return "lexicographically" (quotes for clarity) if *stringList* is sorted lexicographically but not according to the string lengths. Return "lengths" if *stringList* is sorted according to the string lengths but not lexicographically. Return "both" if it is sorted in both ways. Otherwise, return "none".

## Definitions
- *Class*: `TwoWaysSorting`
- *Method*: `sortingMethod`
- *Parameters*: `String[]`
- *Returns*: `String`
- *Method signature*: `String sortingMethod(String[] stringList)`

## Notes
- String A is lexicographically smaller than string B if A contains a character with a smaller ASCII value in the first position where they differ. In case one of the strings ends before they have a different character, the shorter one is considered smaller.

## Constraints
- *stringList* will contain between 1 and 50 elements, inclusive.
- Each element of *stringList* will contain between 1 and 50 characters, inclusive.
- Each character of each element of *stringList* will be a lowercase English letter ('a'-'z').
- Every two elements of *stringList* will have different lengths.

## Examples
### Example 1
#### Input
<c>["a", "aa", "bbb"]</c>
#### Output
<c>"both"</c>
#### Reason
These strings are sorted both lexicographically and according to their lengths.

### Example 2
#### Input
<c>["c", "bb", "aaa"]</c>
#### Output
<c>"lengths"</c>
#### Reason
The lengths of these strings are in ascending order. However, they are not sorted lexicographically as, for instance, "aaa" is lexicographically smaller than "c".

### Example 3
#### Input
<c>["etdfgfh", "aio"]</c>
#### Output
<c>"none"</c>
#### Reason
Here the first string is longer than the second one, so they are not sorted according to length. (Note that we require the lengths to be in ascending order.) Similarly, they are not sorted lexicographically: "aio" should come before "etdfgfh".

### Example 4
#### Input
<c>["aaa", "z"]</c>
#### Output
<c>"lexicographically"</c>
#### Reason
The input strings are sorted lexicographically only.

### Example 5
#### Input
<c>["z"]</c>
#### Output
<c>"both"</c>
### Example 6
#### Input
<c>["abcdef", "bcdef", "cdef", "def", "ef", "f", "topcoder"]</c>
#### Output
<c>"lexicographically"</c>

