datatype mytype = TwoInts of int * int
		| Str of string
		| Pizza

(* mytyoe -> int *)
fun f (x : mytype) =
  case x of
      Pizza => 3
    | Str s => 8
    | TwoInts(i1,i2) => i1 + i2 

fun g (x : mytype) =
  case x of
      Pizza => 3
    | Str s => String.size s
    | TwoInts(i1,i2) => i1*i2
			       
