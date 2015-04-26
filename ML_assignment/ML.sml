- fun min (n::nil) = n
= | min (x::y::t) = if (x > y) then min (y::t)
=                    else min (x::t);

- fun insert (n:int) nil = [n]
= | insert n (h::t) = if (n<h) then n::(h::t)
					else h::insert n t;

- fun sort sort nil = nil
= | sort (h::t) = insert h (sort t);


Problem 1:

fun intBubble [] = []
 | intBubble (h::t) = min (h::t) ::extract (h::t)
and
min (n::nil) = n
 | min (x::y::t) = if (x > y) then min (y::t)
                    else min (x::t)
and
extract [] = []
 | extract (h::t) = if h = min (h::t) then t
 					else h::extract t;


Problem 2:

fun intBubbleSort [n] = [n]
 | intBubbleSort (h::t) = headList (intBubble (h::t)) :: intBubbleSort (restList (intBubble (h::t)))
and 
headList [n] = n
 | headList (h::t) = h
and 
restList [n] = []
 | restList (h::t) = t;


 Problem 3:

 fun bubbleSort (op <) [n] = [n]
 | bubbleSort (op <) (h::t) = let
 		fun sort (op <) [n] = [n]
 		| sort (op <) (x::y::t) = if (op <) (x, y) = true then x:: sort (op <) (y::t)
 										else y::sort (op <) (x::t)
 in if sort (op <) (h::t) = (h::t) then (h::t)
 			else bubbleSort (op <) (sort (op <) (h::t)) end;

 fun bubbleSort length (x::nil) = (x::nil)
 | bubbleSort length (h::t) = let
 	fun sort length (x::nil) = (x::nil)
 	| sort length (x::y::t) = if length x < length y then x::sort length (y::t)
 								else y::sort length (x::t)
 in if sort length (h::t) = (h::t) then (h::t)
 						else bubbleSort length (sort length (h::t)) end;

 Problem 4:

 datatype 'a mytree = leaf of 'a | node of 'a mytree list;

 Problem 5:

 fun max (x, y) = if x > y then x else y;

fun height (leaf(_)) = (print("leaf "); 0)
| height(node(y::ys)) = ( print("123 "); 1 + max ( (height y), ((height (node ys) - 1))))
| height(_) = 0;


 Problem 6:

 fun sortTree (op <) (leaf (h::t)) =  leaf (bubbleSort (op <) (h::t))
 | sortTree (op <) (node (h::t)) = node (map (fn x => (sortTree (op<) x)) (h::t));

 Problem 7 :

fun flattenTree (leaf (x)) = [x]
| flattenTree (node(y::ys)) = flattenTree (y) @ flattenTree (node (ys))
| flattenTree(_) = [];

Problem 8:

fun merge (op <) (h::t) nil = (h::t)
| merge (op <) nil (h::t) = (h::t)
| merge (op <) (x::xs) (y::ys) = if (x < y) then x::(merge (op <) xs (y::ys))
                                            else y::(merge (op <) (x::xs) ys)
| merge (op <) (_) (_) = [];

