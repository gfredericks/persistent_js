$(document).ready ->
  test "Tuples", ->
    a = PJS.tuple(7,8,9)
    equals(PJS.nth(a, 0), 7)
    equals(PJS.nth(a, 1), 8)
    equals(PJS.nth(a, 2), 9)
    b = set(a,1,143)
    equals(PJS.nth(a, 1), 8)
    equals(PJS.nth(b, 0), 7)
    equals(PJS.nth(b, 1), 143)
    equals(PJS.nth(b, 2), 9)

  test "Lists", ->
    a = new List(7)
    equals(a.length(), 1)
    b = a.cons(4)
    equals(b.length(), 2)
    equals(b.first(), 4)
    equals(b.reverse().first(), 7)
    equals(a.first(), a.reverse().first())

    a = List.fromArray([1,3,4])
    equals(a.toString(), "(1,3,4)")

    a = (2*x for x in [1..500])
    b = List.fromArray(a)
    equals(b.length(), 500)
    deepEqual(b.take(5).toArray(), [2,4,6,8,10])
