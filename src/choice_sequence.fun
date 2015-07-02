structure ChoiceSequence :> CHOICE_SEQUENCE =
struct
  open Susp

  datatype 'a front = CONS of 'a * 'a t
  withtype 'a t = 'a front susp
  val front = force
  fun eager a = delay (fn () => a)

  fun fix f = f (delay (fn () => front (fix f)))
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
end

structure ChoiceSequenceUtil = ChoiceSequenceUtil (ChoiceSequence)
