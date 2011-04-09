$(document).ready ->
  test "Tuples", ->
    a = new Tuple(7,8,9)
    equals(a.get(0), 7)
    equals(a.get(1), 8)
    equals(a.get(2), 9)
    b = a.set(1,143)
    equals(a.get(1), 8)
    equals(b.get(0), 7)
    equals(b.get(1), 143)
    equals(b.get(2), 9)

  test "Lists", ->
    a = new List(7)
    equals(a.length(), 1)
    b = a.cons(4)
    equals(b.length(), 2)
    equals(b.first(), 4)
    equals(b.reverse().first(), 7)
    equals(a.first(), a.reverse().first())
