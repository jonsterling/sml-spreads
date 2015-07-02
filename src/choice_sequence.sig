signature CHOICE_SEQUENCE =
sig
  type 'a t
  datatype 'a front = CONS of 'a * 'a t

  val front : 'a t -> 'a front
  val delay : (unit -> 'a front) -> 'a t
end

signature CHOICE_SEQUENCE_UTIL =
sig
  include CHOICE_SEQUENCE
  val map : ('a -> 'b) -> 'a t -> 'b t
  val fix : ('a t -> 'a t) -> 'a t
  val eager : 'a front -> 'a t
end
