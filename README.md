# CS3217 Problem Set 1

**Name:** Your name

**Matric No:** Your matric no

## Tips
1. CS3217's docs is at https://cs3217.github.io/cs3217-docs. Do visit the docs often, as
   it contains all things relevant to CS3217.
2. A Swiftlint configuration file is provided for you. It is recommended for you
   to use Swiftlint and follow this configuration. We opted in all rules and
   then slowly removed some rules we found unwieldy; as such, if you discover
   any rule that you think should be added/removed, do notify the teaching staff
   and we will consider changing it!

   In addition, keep in mind that, ultimately, this tool is only a guideline;
   some exceptions may be made as long as code quality is not compromised.
3. Do not burn out. Have fun!

## Notes
If you have changed the skeleton code in any way, please write your
justification here. Otherwise, you may discard this section.

## Written Answers

### Problem 2.1
> You are given the private function `checkRepresentation` inside the `Graph`
> class. This function is supposed to check if the representation invariants of
> the ADT is fulfilled or not. The way it is meant to used is to put
> ```swift
> assert(checkRepresentation())
> ```
> inside the methods so that the representation invariants is not violated.
> For an example of this, you may refer to `Edge.swift`.
>
> Here, you have several choices. You may choose to implement this function and
> use this to assert the representation invariants of your implementation; if
> you do so, justify where you put the assertions, and why you put them. For
> example, you might want to put it at the beginning of constructors; at the
> end of constructors; at the beginning of methods; at the end of methods; or
> some other place, or even some combination of these. Justify why you decided
> to put (or not) the assertions at these places.
>
> Alternatively, you can choose to discard this function; if you do so, justify
> why you decided to not use `checkRepresentation` in your class. (2 points)

Your answer here

## Problem 2.2
> There are several ways to represent a graph. Here are a few:
> - As a collection of edges
> - As an adjacency list, in which each node is associated with a list of its
>   outgoing edges.
> - As an adjacency matrix, which explicitly represents for every pair (A, B)
>   of edges, whether there is an edge from A to B, and how many.
>
> Briefly discuss the advantages and disadvantages of each of these three ways.
> Afterwards, describe and justify the Graph representation you choose to
> implement. (2 points)

Your answer here

## Problem 2.3
> Imagine that the original representation invariant was changed to include a
> new requirement that there can be **at most 1 edge** between a source and
> destination node. Which method or constructor implementations would have to
> change? Please list them. 
>
> For each changed piece of code, describe the changes informally,
> and indicate how much more or less complex (in terms of code clarity and/or 
> execution efficiency) the result would be. Note that the new implementations 
> must still adhere to the given spec. (1 point)

Your answer here
