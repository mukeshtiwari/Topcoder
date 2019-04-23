# [OneHandScheduling](/tc?module=ProblemDetail&rd=17457&pm=15415)
*TCO19 SRM 755 SRM 755 - Division II, Level One*

## Statement
Misof recently had an accident in which he managed to cut his left hand on some broken glass. He is now "all right" - meaning that he can only use his right hand for a while. Help him with some issues he has.

Misof needs to do some tasks. Each of the tasks has to be done during a specific time interval, and it requires constant use of his only hand. Find out whether he can do all the tasks.

You are given the int[]s *tStart* and *tEnd*, each with N elements. For each i between 0 and N-1, inclusive, *tStart*[i] is the timestamp of the beginning and *tEnd*[i] the timestamp of the end of task i.

(All timestamps are in seconds, with timestamp 0 being the midnight today.)

For each task, Misof needs his hand for the entire interval of time, including both endpoints. That is, if one task ends exactly at the same time at which another task begins, Misof cannot do both of them.

Return "possible" (quotes for clarity) if Misof can do all the tasks and "impossible" if he cannot do that.

## Definitions
- *Class*: `OneHandScheduling`
- *Method*: `checkSchedule`
- *Parameters*: `int[], int[]`
- *Returns*: `String`
- *Method signature*: `String checkSchedule(int[] tStart, int[] tEnd)`

## Notes
- You are not given the value N explicitly. Instead, you can determine it by looking at the number of elements in *tStart* (or *tEnd*).
- Note that the return value is case-sensitive.

## Constraints
- N will be between 1 and 10, inclusive.
- *tStart* and *tEnd* will each contain exactly N elements.
- Each element of *tStart* and *tEnd* will be between 0 and 1,000,000, inclusive.
- For each i, *tStart*[i] will be less than *tEnd*[i].

## Examples
### Example 1
#### Input
<c>[10, 100, 236],<br />[47, 235, 347]</c>
#### Output
<c>"possible"</c>
#### Reason
Task 0 starts at timestamp 10 and ends at timestamp 47.
Task 1 starts at timestamp 100 and ends at timestamp 235.
Task 2 starts at timestamp 236 and ends at timestamp 347.
Misof can do all of them.

### Example 2
#### Input
<c>[100, 236, 10],<br />[235, 347, 47]</c>
#### Output
<c>"possible"</c>
#### Reason
The same three tasks as in Example #0, just given in another order. The answer remains the same.

### Example 3
#### Input
<c>[10, 20],<br />[20, 30]</c>
#### Output
<c>"impossible"</c>
#### Reason
These two tasks overlap, so Misof cannot do both of them.

### Example 4
#### Input
<c>[10, 400000, 500000],<br />[20, 600000, 700000]</c>
#### Output
<c>"impossible"</c>
### Example 5
#### Input
<c>[1, 40, 50, 60],<br />[1000000, 41, 51, 61]</c>
#### Output
<c>"impossible"</c>

