Control.Print.printDepth := 1000;
Control.Print.printLength := 1000;

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
 | intBubbleSort [] = []
and
headList [n] = n
 | headList (h::t) = h
and
restList [n] = []
 | restList (h::t) = t
 | restList [] = [];

 intBubbleSort [3,5,1,8,4];





 fun length [] = 0
 | length (h::t) = 1 + length t;
length [1, 2, 3, 4];

fun bubbleSort f [x] = [x]
| bubbleSort f (h::t) = let
        fun sort f [x] = [x]
        |sort f (x::y::t) = if f (x, y) = true then x:: sort f (y::t)
                                                else y::sort f (x::t)
in if sort f (h::t) = (h::t) then (h::t)
              else bubbleSort f (sort f (h::t)) end;
bubbleSort (op <) [1,9, 3, 6, 7];
bubbleSort (fn(a,b) => length a < length b) [[1, 9, 3, 6], [1], [2,4,6], [5,5]];




datatype 'a mytree = leaf of 'a | node of 'a mytree list



fun max (x, y) = if x > y then x else y
and
 height (leaf(_)) =  0
| height(node(y::ys)) =  1 + max ( (height y), ((height (node ys) - 1)))
| height(_) = 0;



val myTree = node [node [node [leaf [4,2,14],leaf [9,83,32],leaf [96,123,4]],
                           node [leaf [47,71,82]],node [leaf [19,27,10],
                                                        leaf [111,77,22,66]],
                           leaf [120,42,16]],
                     leaf [83,13]];
height myTree;




fun sortTree (op <) (leaf (h::t)) =  leaf (bubbleSort (op <) (h::t))
 | sortTree (op <) (node (h::t)) = node (map (fn x => (sortTree (op<) x)) (h::t));
sortTree (op <) myTree;




fun flattenTree (leaf (x)) = [x]
| flattenTree (node(y::ys)) = flattenTree (y) @ flattenTree (node (ys))
| flattenTree(_) = [];
flattenTree myTree;




fun merge f (h::t) nil = (h::t)
| merge f nil (h::t) = (h::t)
| merge f (x::xs) (y::ys) = if f (x, y) = true then x::(merge f xs (y::ys))
                                            else y::(merge f (x::xs) ys)
| merge f (_) (_) = [];

merge (op <) [1, 3, 5, 14] [2,6, 10];
merge (op <) [2,4,6,8,10] [1,3,5,7,9];
val L1 = [leaf 3, node [leaf 1, node[leaf 2,leaf 4]]] ;
val L2 = [node [leaf 5, leaf 6], node [ node [ node [ leaf 7 ]]]] ;
merge (fn(tree1,tree2) => height tree1 < height tree2) L1 L2 ;



fun mergeList (op <) (x::xs::nil) = merge (op <) x xs
| mergeList (op <) (x::xs::t) = merge (op <) x (mergeList (op <) (xs::t))
and
 mergeTree (op <) (node (h::t)) = let
        fun leafList (node (x::xs)) = flattenTree (sortTree (op <) (node (x::xs)))
in mergeList (op <) (leafList (node (h::t))) end;

mergeTree (op <) myTree;
