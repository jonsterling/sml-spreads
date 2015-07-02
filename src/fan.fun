functor Fan (type elem) :> FAN where type elem = elem =
struct
  type 'a forest = 'a list

  type elem = elem

  structure Path = FunctionalChoiceSequence
  type path = Nat.t Path.t

  datatype 'a front = NODE of elem * 'a forest
  datatype t = SUP of t front
  val into = SUP
  fun out (SUP t) = t
end
