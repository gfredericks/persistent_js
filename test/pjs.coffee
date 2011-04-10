$(document).ready ->
  test "Tuples", ->
    a = tuple(7,8,9)
    equals(nth(a, 0), 7)
    equals(nth(a, 1), 8)
    equals(nth(a, 2), 9)
    b = set(a,1,143)
    equals(nth(a, 1), 8)
    equals(nth(b, 0), 7)
    equals(nth(b, 1), 143)
    equals(nth(b, 2), 9)

  test "Lists", ->
    equals(count(list()), 0)
    a = cons(7,list())
    equals(count(a), 1)
    b = cons(4,a)
    equals(count(b), 2)
    equals(first(b), 4)
    equals(first(reverse(b)), 7)
    equals(first(reverse(a)), first(a))
