structure Nat :> NAT =
struct
  type t = int

  datatype 'a view =
      ZERO
    | SUCC of 'a

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
