class Tuple
  constructor: (@args...) ->

  length: -> @args.length
  get: (i) -> @args[i]
  set: (i,v) ->
    if(i >= @args.length)
      throw {error: "Out of range in Tuple#set"};
    new Tuple(
      for j in [0...@args.length]
        if j==i
          v
        else
          @args[j]
    )

class Vector
  
