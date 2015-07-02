signature SPREAD =
sig
  type elem

  structure Path : CHOICE_SEQUENCE
  type path = Nat.t Path.t

  type 'a forest
  datatype 'a front = NODE of elem * 'a forest

  type t
  val into : t front -> t
  val out : t -> t front
end
