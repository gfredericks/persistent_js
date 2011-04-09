Tuple = (args...) ->
  length: -> args.length
  get: (i) -> args[i]
  set: (i,v) ->
    if(i >= args.length)
      throw {error: "Out of range in Tuple#set"};
    xs = for j in [0...args.length]
      if j == i
        v
      else
        args[j]
    new Tuple(xs...)

List = (head, tail) ->
  length = if(tail == undefined)
    1
  else
    1 + tail.length()
  length: -> length
  parts: -> [head, tail]
  first: -> head
  rest: -> tail
  take: (n) ->
    return new List(head) if n == 1
    return undefined if(n == 0)
    return undefined if(!tail)
    tail.take(n-1).cons(head)
  cons: (x) -> new List(x, this)
  toArray: ->
    if(tail)
      t = tail.toArray()
      t.unshift(head)
      t
    else
      [head]
  reverse: ->
    return this if length == 1
    l = new List(head)
    t = tail
    for _ in [0...t.length()]
      l = l.cons(t.first())
      t = t.rest()
    l
  toString: ->
    '(' + @toArray().join(',') + ')'
List.fromArray = (a) ->
  c = undefined
  for i in [(a.length - 1)..0] by -1
    c = new List(a[i], c)
  c
