# [OneHandSort](/tc?module=ProblemDetail&rd=17457&pm=15416)
*TCO19 SRM 755 SRM 755 - Division I, Level One*

## Statement
Misof recently had an accident in which he managed to cut his left hand on some broken glass. He is now "all right" - meaning that he can only use his right hand for a while. Help him with some issues he has.

Misof needs to sort the objects on his shelf. The shelf has N+1 slots, numbered 0 through N from the left to the right. Slot N is currently empty and it should be empty once the shelf is sorted. Slots 0 through N-1 contain objects: for each i, slot i currently contains an object that belongs into slot *target*[i].

As Misof only has one working hand, he can only rearrange the shelf in one way: he can pick up any object and move it from its current slot into the one slot that is currently empty.

You are given the int[] *target* with at most 500 elements. Find any sequence of at most 1500 actions that will sort the shelf. Return a int[] containing instructions for Misof. Each element x of the return value represents the instruction "pick up the element that is currently in slot x and move it into the slot that is currently empty".

## Definitions
- *Class*: `OneHandSort`
- *Method*: `sortShelf`
- *Parameters*: `int[]`
- *Returns*: `int[]`
- *Method signature*: `int[] sortShelf(int[] target)`

## Notes
- While sorting the shelf. Misof can (and often has to) move some of the objects more than once.
- You are not required to minimize the number of moves.

## Constraints
- N will be between 1 and 500, inclusive.
- *target* will contain exactly N elements.
- Each element of *target* will be between 0 and N-1, inclusive.
- All elements of *target* will be distinct.

## Examples
### Example 1
#### Input
<c>[0, 1, 2]</c>
#### Output
<c>[ ]</c>
#### Reason
The shelf is already sorted, Misof can simply do nothing.

### Example 2
#### Input
<c>[1, 2, 3, 0]</c>
#### Output
<c>[2, 1, 0, 3, 4 ]</c>
#### Reason
In the beginning, the shelf looks as follows:

| 1 | 2 | 3 | 0 |   |
+---+---+---+---+---+

The return value describes the following solution:

Misof moves the object from slot 2. (This is the object that belongs into slot 3. Misof moves it to the empty slot 4.)
Misof moves the object from slot 1. (This is the object that belongs into slot 2. Misof moves it to the empty slot 2, where it belongs.)
Misof moves the object from slot 0. (This is the object that belongs into slot 1. Misof moves it to the empty slot 1, where it belongs.)
Misof moves the object from slot 3. (This is the object that belongs into slot 0. Misof moves it to the empty slot 0, where it belongs.)
Misof moves the object from slot 4. (This is the object that belongs into slot 3 - the one we already moved once at the beginning. Misof moves it to the empty slot 3, where it belongs.)

Other valid solutions exist.

### Example 3
#### Input
<c>[1, 0, 3, 2]</c>
#### Output
<c>[0, 1, 4, 2, 3, 4 ]</c>

