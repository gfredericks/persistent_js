PJS = (
  TYPES = ["TUPLE", "LIST", "VECTOR", "MAP", "SET"]
  tuple = (args...) ->
    [0,
      ->
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
          tuple(xs...)]
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
    length: -> length
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
    
  ->
    tuple: tuple
)()
  
