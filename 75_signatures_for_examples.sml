signature RATIONAL_C =
sig
    type rational
    exception BadFrac
    val whole : int -> rational
    val make_frac : int * int -> rational
    val add : rational * rational -> rational
    val toString : rational -> string
end

structure Rational1 :> RATIONAL_C =
struct

datatype rational = whole of int | Frac of int*int
exception BadFrac

fun gcd (x,y) =
  if x=y
  then x
  else if x < y
  then gcd(x,y-x)
  else gcd(y,x)

fun reduce r =
  case r of
      whole _ => r
    | Frac(x,y) =>
      if x=0
      then whole 0
      else let val d = gcd(abs x,y) in
	       if d=y
	       then whole(x div d)
	       else Frac(x div d, y div d)
	   end

fun make_frac (x,y) =
  if y = 0
  then raise BadFrac
  else if y < 0
  then reduce(Frac(~x,~y))
  else reduce(Frac(x,y))

fun add (r1,r2) =
  case (r1, r2) of
      (whole(i),whole(j))   => whole(i+j)
    | (whole(i),Frac(j,k))  => Frac(j+k*i,k)
    | (Frac(j,k),whole(i))  => Frac(j+k*i,k)
    | (Frac(a,b),Frac(c,d)) => reduce (Frac(a*d + b*c, b*d))

fun toString r =
  case r of
      whole i => Int.toString i
    | Frac(a,b) => (Int.toString a) ^ "/" ^ (Int.toString b)

end
    
