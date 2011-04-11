PJS = (
  tree = (args...) ->
    size = switch args.length
      when 0
        0
      when 1
        node = args[0]
        1
      when 2
        [node,left] = args[0]
        [left,right] = args
        1 + 2
  # TYPES = ["TUPLE", "LIST", "VECTOR", "MAP", "SET"]
  tuple = (args...) ->
    ->
      length: args.length
      nth: (i) -> args[i]
      set: (i,v) ->
        xs = for j in [0...args.length]
          if j == i then v else args[j]
        tuple(xs...)
  list = (args...) ->
    head = tail = undefined
    length = switch args.length
      when 0
        0
      when 1
        head = args[0]
        tail = list()
        1
      when 2
        [head,tail] = args
        1 + count(tail)
      else
        throw {error: "Wrong number of args (#{args.length}) passed to list()"}
    coll = ->
      length: length
      first: -> head
      rest: -> tail
      reverse: ->
        return coll if length < 2
        l = list(head)
        t = tail
        for _ in [0...count(t)]
          l = cons(first(t),l)
          t = rest(t)
        l
    coll
  count = (coll) ->
    coll().length
  nth = (coll, index) ->
    ob = coll()
    if(ob.nth)
      ob.nth(index)
    else if(index < ob.length)
      if(index == 0)
        first(coll)
      else
        nth(rest(coll), index - 1)
  first = (coll) ->
    ob = coll()
    if(ob.first)
      ob.first()
    else if(ob.nth)
      ob.nth(0)
  set = (coll, index, val) ->
    ob = coll()
    ob.set(index, val)
  cons = (el, coll) -> list(el, coll)
  reverse = (coll) -> coll().reverse()
  rest = (coll) -> coll().rest()
  conj = (coll, items...) ->
    ob = coll()
    if(ob.conj)
      ob.conj(items...)
  ->
    tuple: tuple
    list: list
    count: count
    nth: nth
    first: first
    set: set
    cons: cons
    rest: rest
    reverse: reverse
)()
  
