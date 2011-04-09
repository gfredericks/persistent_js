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
