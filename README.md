# PersistentJS #

Currently in development -- persistent data structures for JavaScript.

## Implementation Strategy ##

All data structures store their data in a closure, which as far as I know is
the only way to create truly inaccessible variables in JavaScript. Each data
structure is presented as a basic object with functions that can access the
data. All "mutator" functions return a new object that shares as much state
with the old object as it can.

### Tuples ###

Tuples are implemented with a basic array. They should be used only for small
lengths, as any mutation will create a new copy of the whole array (c.f.
Erlang).

Tuples are probably not very useful for user code.

### Vectors/Arrays ###

This could be done with the hash-map (integer keys), but that makes slicing
operations difficult. It might be better to just have it as a separate tree
implementation. Maybe create a base tree that both extend.

### Lists ###

Linked lists are easy to implement as 2-element Tuples -- the head and the
tail. You should be familiar with which operations can be expected to perform
in linear time vs. constant time.

### Hash-Maps ###

Hash-Maps are currently implemented as a basic self-balancing binary tree.
Keys can be numbers, strings, or any persistent data structure.
