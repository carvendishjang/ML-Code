(* Section 3: Partial Application*)

fun sorted3 x y z = z >= y andalso y >= x

fun fold f acc xs =
  case xs of
      [] => acc
    | x::xs' => fold f (f(acc,x)) xs'

(* If a curried function is applied to "too few" arguments, that returns, which    is often useful.
   A powerful idiom (no new semantics) *)

val is_nonnegative = sorted3 0 0

val sum = fold (fn (x,y) => x+y) 0

(* In fact, not doing this is often a harder-to-notice version of unnecessary function wrapping, as in these inferior versions *)
	       
fun is_nonnegative_inferior x = sorted3 0 0 x

fun sum_inferior xs = fold (fn (x,y) => x+y) 0 xs

(* another example *)
fun range i j = if i > j then [] else i :: range (i+1) j

val countup = range 1

(* countup 6 [1,2,3,4,5,6] *)
		    
fun countup_inferior x = range 1 x

(* comon style is to curry higher-order functions with a arguments first to enable convenient partial application *)

fun exists predicate xs =
  case xs of
      [] => false
    | x::xs' => predicate x orelse exists predicate xs'

val no = exists (fn x => x=7) [4,11,23] (* false *)

val hasZero = exists (fn x => x=0) (* int list -> bool *)

val incrementAll = List.map (fn x => x + 1)

(* Library functions foldl, List.filter, etc. also curried: *)

val removeZeros = List.filter (fn x => x <> 0)

(* but if you get a stranfe message about "value restriction", put back in the actually-necessary wrapping or an explicit non-polymorphic type *)

			      (* doesn't work for reasons we won't explain here (more later) *)		(* (only an issue will polymorphic type )*)

			      (* val pairwithOne = List.map (fn x => (x,1)) (* 'a list -> ('a * int) list *)*)

			      (* workarounds: *)

fun pairWithOne xs = List.map (fn x => (x,1)) xs

val pairWithOne : string list -> (string * int) list = List.map (fn x => (x,1))

								(* this function works fine because result is not polymorphic *)
val incrementAndPairWithOne = List.map (fn x => (x+1,1))
				       
			      
