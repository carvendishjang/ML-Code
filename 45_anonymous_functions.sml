fun n_times (f,n,x) =
  if n=0
  then x
  else
      f(n_times(f,n-1,x))

fun until_zero (f,x) =
  if x=0
  then 0
  else
      1 + until_zero (f,f x)

fun triple_n_times (n,x) =
  n_times ((fn x => 3*x),n,x)
	  
