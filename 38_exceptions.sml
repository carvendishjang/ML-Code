fun hd xs =
  case xs of
      []   => raise List.Empty
    | x::_ => x

exception MyUndesirable

exception MyOtherException of int * int

fun mydiv (x,y) =
  if y=0
  then raise MyOtherException(3,4)
  else x div y

fun maxlist (xs,ex) =
  case xs of
      [] => raise ex
    | x::[] => x
    | x::xs' => Int.max(x,maxlist(xs',ex))

val w = maxlist ([],MyUndesirable)
	handle MyUndisirable => 433
				    
		       
val x = maxlist ([3,4,5],MyUndesirable)
	handle MyUndesirable => 43

val z = maxlist ([],MyUndesirable)
	handle MyUndesirable => 43
