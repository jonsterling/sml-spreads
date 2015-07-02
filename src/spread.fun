functor InfinitarySpread (type elem) :> INFINITARY_SPREAD where type elem = elem =
struct
  type elem = elem

  structure Path = FunctionalChoiceSequence
  structure Forest = FunctionalChoiceSequence

  type path = Nat.t Path.t
  type 'a forest = 'a Forest.t
  datatype 'a front = NODE of elem * 'a forest

  datatype t = SUP of t front

  val into = SUP
  fun out (SUP t) = t
end
