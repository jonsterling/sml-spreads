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

signature NAT_UTIL =
sig
  include NAT
  val zero : t
  val succ : t -> t

  val mapView : ('a -> 'b) -> 'a view -> 'b view
end
