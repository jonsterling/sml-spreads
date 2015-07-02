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

signature INFINITARY_SPREAD =
sig
  structure Forest : CHOICE_SEQUENCE

  include SPREAD
    where type 'a forest = 'a Forest.t
end

