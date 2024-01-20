[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/Nkz77OlX)
# CS3217 Problem Set 1

**Name:** Jair Goh

**Matric No:** A0253158A

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

Ended up not implementing as invariants are already enforced within structure:
isDirected enforces that the graph is either directed or undirected,
addEdge cannot add duplicate edges (in which weights are also considered)
and since adjacencyList is used, keys must be unique and labels cannot be the same

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

Collection: The simplest of all three, the advantage is the fact that it takes up
the least space but is the least convenient to access. Take for example the function to
find all nodes that are neighbours of a particular node. If we let n be the no.
of nodes in the collection, and e be the number of edges it would take O(e) time as all
nodes have to be checked. Adjacency lists would take O(1) while Adjacency matrices take
O(e/n). In deciding whether to implement as a adjacency list or matrix, I looked at the structure
of the code. Since we are using classes to represent the node and edge, a matrix would duplicate
the work since the nested Array would technically already store the information about the edge.

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

checkRepresentation. A check would need to be added to see if any edge is the reverse of another.
In this case, it would be quite inefficient as all edges must be traversed. This is compared to if
invariants were to be checked at every mutating function on a case by case level. Code will be more readable
in the former solution and would be better scalable as well.

