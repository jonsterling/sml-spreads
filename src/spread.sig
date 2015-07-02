signature SPREAD =
sig
  type elem
  type path = Nat.t ChoiceSequence.t

  type 'a forest
  datatype 'a front = NODE of elem * 'a forest

  type t
  val into : t front -> t
  val out : t -> t front
end
