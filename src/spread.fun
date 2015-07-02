signature INFINITARY_SPREAD =
sig
  type tree

  include SPREAD
    where type t = tree
    where type 'a forest = 'a ChoiceSequence.t
end

functor InfinitarySpread (type elem) :> INFINITARY_SPREAD where type elem = elem =
struct
  type elem = elem

  type path = Nat.t ChoiceSequence.t
  type 'a forest = 'a ChoiceSequence.t
  datatype 'a front = NODE of elem * 'a forest

  datatype t = SUP of t front
  type tree = t

  val into = SUP
  fun out (SUP t) = t
end
