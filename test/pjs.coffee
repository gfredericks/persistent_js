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
