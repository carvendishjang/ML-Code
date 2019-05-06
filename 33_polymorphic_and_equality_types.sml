fun append (xs, ys)=
  case xs of
      [] => ys
    | x::xs' => x::append(xs',ys)
			       
fun equal (x,y)=
  if x=y then "yes" else "No"
			     (*Don't do this*)

fun is_three x =
  if x=3 then "yes" else "No"
			     
