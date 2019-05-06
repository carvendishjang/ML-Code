(* generic functions to switch how/whether currying is used *)
(* in each case, the type tells you a lot *)

fun curry f x y = f (x,y)

fun uncurry f (x,y) = f x y (* uncurry foo *)

(* example*)

(* tupled but we wish it were curried *)

fun range (i,j) = if i > j then [] else i :: range(i+1, j)

val countuo = curry range 1

val xs = countuo 7 (* [1,2,3,4,5,6,7] *)

		 
