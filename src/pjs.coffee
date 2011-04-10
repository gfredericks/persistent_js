PJS = (
  # TYPES = ["TUPLE", "LIST", "VECTOR", "MAP", "SET"]
  tuple = (args...) ->
    ->
      length: args.length
      get: (i) -> args[i]
      set: (i,v) ->
        xs = for j in [0...args.length]
          if j == i
            v
          else
            args[j]
        tuple(xs...)
  list = (args...) ->
    head = tail = undefined
    length = switch args.length
      when 0
        0
      when 1
        head = args[0]
        1
      when 2
        [head,tail] = args
        1 + count(tail)
      else
        throw {error: "Wrong number of args (#{args.length}) passed to list()"}
    length = if(tail == undefined)
      1
    else
      1 + tail.length()
    ->
      length: length
      first: -> head
      rest: -> tail
      reverse: ->
        return this if length == 1
        l = new List(head)
        t = tail
        for _ in [0...t.length()]
          l = l.cons(t.first())
          t = t.rest()
        l
  count = (coll) ->
    coll().length
  nth = (coll, index) ->
    ob = coll()
    if(ob.nth)
      ob.nth(index)
    elsif(index < ob.length)
      if(index == 0)
        first(coll)
      else
        nth(rest(coll), index - 1)
  ->
    tuple: tuple
    list: list
    count: count
    nth: nth
)()
  
