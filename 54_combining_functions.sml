(* Section 3: Another Closure Idiom: Combining Functions *)

fun compose (f,g) = fn x => f (g x)

fun sqrt_of_abs i = Math.sqrt (Real.fromInt (abs i))

fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs) i

val sqrt_of_abs = Math.sqrt o Real.fromInt o abs
						 
fun double x = 2 * x
		       
val doublee = fn x => 2 * x

(* |>  !>*)
(* left-to-right *)

infix !>

fun x !> f = f x

fun sqrt_of_abs i = i !> abs !> Real.fromInt !> Math.sqrt

fun backup (f,g) = fn x => case f x of
			       NONE => g x
			     | SOME y => y

fun backup (f,g) = fn x => f x handle _ => g x
					     
			
