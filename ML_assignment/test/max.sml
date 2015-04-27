Control.Print.printDepth := 100;
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

intBubble [4,9,1,10,6];





fun intBubbleSort [n] = [n]
 | intBubbleSort (h::t) = headList (intBubble (h::t)) :: intBubbleSort (restList (intBubble (h::t)))
and
headList [n] = n
 | headList (h::t) = h
and
restList [n] = []
 | restList (h::t) = t;

 intBubbleSort [3,5,1,8,4];





 fun length [] = 0
 | length (h::t) = 1 + length t;
length [1, 2, 3, 4];

 fun bubbleSort (op <) [n] = [n]
 | bubbleSort (op <) (h::t) = let
 		fun sort (op <) [n] = [n]
 		| sort (op <) (x::y::t) = if x < y then x:: sort (op <) (y::t)
 										else y::sort (op <) (x::t)
 in if sort (op <) (h::t) = (h::t) then (h::t)
 			else bubbleSort (op <) (sort (op <) (h::t)) end;


bubbleSort (op <) [1,9, 3, 6, 7];




datatype 'a mytree = leaf of 'a | node of 'a mytree list

fun max (x, y) = if x > y then x else y;

fun height (leaf(_)) =  0
| height(node(y::ys)) =  1 + max ( (height y), ((height (node ys) - 1)))
| height(_) = 0;



val myTree = node [node [node [leaf [4,2,14],leaf [9,83,32],leaf [96,123,4]],
                           node [leaf [47,71,82]],node [leaf [19,27,10],
                                                        leaf [111,77,22,66]],
                           leaf [120,42,16]],
                     leaf [83,13]];
height myTree;

height (node [node [node [leaf [4,2,14],leaf [9,83,32],leaf [96,123,4]]]]);

height (leaf [1]);
height (node [leaf [1], leaf [2]]);
height (node [node [leaf [1]], leaf [2]]);
height (node[leaf [1]]);




fun sortTree (op <) (leaf (h::t)) =  leaf (bubbleSort (op <) (h::t))
 | sortTree (op <) (node (h::t)) = node (map (fn x => (sortTree (op<) x)) (h::t));


sortTree (op <) myTree;


fun flattenTree (leaf (x)) = [x]
| flattenTree (node(y::ys)) = flattenTree (y) @ flattenTree (node (ys))
| flattenTree(_) = [];

flattenTree myTree;




fun merge (op <) (h::t) nil = (h::t)
| merge (op <) nil (h::t) = (h::t)
| merge (op <) (x::xs) (y::ys) = if (x < y) then x::(merge (op <) xs (y::ys))
                                            else y::(merge (op <) (x::xs) ys)
| merge (op <) (_) (_) = [];


merge (op <) [1, 3, 5, 14] [2,6, 10];
merge (op <) [2,4,6,8,10] [1,3,5,7,9];
