structure Nat :> NAT =
struct
  type t = int

  datatype 'a view =
      ZERO
    | SUCC of 'a

  fun map f ZERO = ZERO
    | map f (SUCC x) = SUCC (f x)

  fun into ZERO = 0
    | into (SUCC x) = x + 1

  fun out 0 = ZERO
    | out n = SUCC (n - 1)

  exception Negative

  fun fromInt i =
    if i < 0 then
      raise Negative
    else
      i

  fun asInt i = i
end

functor NatUtil (N : NAT) : NAT_UTIL =
struct
  open N

  val zero = into ZERO
  fun succ x = into (SUCC x)
end

structure NatUtil = NatUtil (Nat)
