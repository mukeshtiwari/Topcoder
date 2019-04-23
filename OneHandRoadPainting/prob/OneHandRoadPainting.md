# [OneHandRoadPainting](/tc?module=ProblemDetail&rd=17457&pm=15418)
*TCO19 SRM 755 SRM 755 - Division I, Level Two*

## Statement
Misof recently had an accident in which he managed to cut his left hand on some broken glass. He is now "all right" - meaning that he can only use his right hand for a while. Help him with some issues he has.

In addition to writing problems for programming contests, Misof used to make a living by painting roads. He currently has a job he needs to complete: refresh the paint on the line in the middle of the road for some segments of a long straight road. Ordinarily, this would be easy: he would just load his car, drive to the places where the paint need fixing, and do the job. But with just one good hand he cannot drive, and he cannot even carry a bucket and paint at the same time.

Misof's house is at the beginning of the long straight road. You are given the int[]s *dStart* and *dEnd*. For each valid i, one of the segments Misof needs to paint begins exactly *dStart*[i] meters from his house and ends exactly *dEnd*[i] meters from his house. The segments are disjoint and they are given in sorted order.

Misof's walking speed is 1 meter per second, regardless of whether he is painting or not. He has a long paintbrush he uses to paint the road. Whenever he is at home, he can dip the paintbrush into a bucket with paint. After that procedure, the paintbrush has enough paint to cover *paintPerBrush* meters of the road. (Those meters do not have to be contiguous. He can start and stop painting arbitrarily many times, as long as he still has some paint on the paintbrush.)

Misof starts the whole process in his home and he must return back home once he's done. Find and return the shortest time in which Misof can paint all the required road segments.

## Definitions
- *Class*: `OneHandRoadPainting`
- *Method*: `fastest`
- *Parameters*: `int[], int[], int`
- *Returns*: `long`
- *Method signature*: `long fastest(int[] dStart, int[] dEnd, int paintPerBrush)`

## Notes
- Misof's house is a point and dipping the paintbrush into paint takes no time.

## Constraints
- *dStart* will contain between 1 and 500 elements, inclusive.
- *dEnd* will contain the same number of elements as *dStart*.
- All elements of *dStart* and *dEnd* will be between 1 and 2*10^9, inclusive.
- *dStart*[0] < *dEnd*[0] < *dStart*[1] < *dEnd*[1] < ...
- *paintPerBrush* will be between 1 and 2*10^9, inclusive.

## Examples
### Example 1
#### Input
<c>[3, 7],<br />[4, 9],<br />1</c>
#### Output
<c>42</c>
#### Reason
There are two segments to paint: one is one meter long (3-4) and the other is two meters long (7-9).
Misof's paintbrush can only hold enough paint to paint one meter of the road.
One optimal schedule looks as follows:
Dip the paintbrush (current time: 0).
Walk to coordinate 3 (current time: 3).
Put down the brush and walk to coordinate 4 while painting the road (current time: 4).
Walk back home and dip the paintbrush into the bucket to get more paint (current time: 8).
Walk to coordinate 9 (current time: 17).
Put down the paintbrush and paint the segment from 9 to 8 (current time: 18).
Walk back home, get more paint (current time: 26).
Walk to coordinate 7 (current time: 33).
Paint segment 7-8 (current time: 34).
Walk back home one last time (current time: 42).

### Example 2
#### Input
<c>[3, 7],<br />[4, 9],<br />5</c>
#### Output
<c>18</c>
#### Reason
This is the same scenario but the paintbrush can hold more paint, so Misof can be done much faster.

### Example 3
#### Input
<c>[1, 10, 20],<br />[4, 13, 22],<br />2</c>
#### Output
<c>98</c>

