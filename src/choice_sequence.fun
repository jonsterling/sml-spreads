(* An implementation of choice sequences with good front-insertion, but O(n)
 * lookup. *)
structure ChoiceSequence :> CHOICE_SEQUENCE =
struct
  open Susp

  datatype 'a front = CONS of 'a * 'a t
  withtype 'a t = 'a front susp
  val front = force
end

(* An implementation of choice sequences with O(1) access. *)
structure FunctionalChoiceSequence :> CHOICE_SEQUENCE =
struct
  datatype 'a front = CONS of 'a * 'a t
  withtype 'a t = Nat.t -> 'a

  fun front alpha =
    CONS (alpha NatUtil.zero, alpha o NatUtil.succ)

  fun delay f =
    let
      val f' = Susp.delay f
    in
      fn i =>
        let
          val CONS (x, xs) = Susp.force f'
        in
          case Nat.out i of
               Nat.ZERO => x
             | Nat.SUCC j => xs j
        end
    end
end

functor ChoiceSequenceUtil (CS : CHOICE_SEQUENCE) : CHOICE_SEQUENCE_UTIL =
struct
  open CS

  fun map f xs =
    let
      val CONS (y, ys) = front xs
    in
      delay (fn () =>
        CONS (f y, map f ys))
    end

  fun eager a = delay (fn () => a)
  fun fix f = f (delay (fn () => front (fix f)))
end

structure ChoiceSequenceUtil = ChoiceSequenceUtil (ChoiceSequence)
