signature NAT =
sig
  type t

  datatype 'a view =
      ZERO
    | SUCC of 'a

  val into : t view -> t
  val out : t -> t view

  exception Negative
  val fromInt : int -> t
  val asInt : t -> int
end
