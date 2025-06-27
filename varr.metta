 ; track variables across multiple blocks
(= (find-common-vars ()) ())
(= (find-common-vars (Cons $block $blocks))
    (find-common-vars $blocks (count-appearances $block)))

 ; count appearances of variables in each block
(= (count-appearances () $counts) $counts)
(= (count-appearances (Cons $var $vars) $counts)
    (count-appearances $vars (update-count $var $counts))) ; Update count for the variable

 ; Function to update the count of a variable in the count list
(= (update-count $var ()) (Cons (Cons $var 1) ()))
(= (update-count $var (Cons (Cons $var $count) $counts)) (Cons (Cons $var (+ $count 1)) $counts)) ; If found, increment the count
(= (update-count $var (Cons (Cons $other-var $count) $counts))
    (Cons (Cons $other-var $count) (update-count $var $counts))) ; Continue searching if not found yet

 ;3.append to a list
(= (append () $y) (Cons $y ()))
(= (append (Cons $x $xs) $y) (Cons $x (append $xs $y)))

 ; Filter out variables that have a count greater than 1 (appear in multiple blocks)
(= (filter-common-vars () ()) ())
(= (filter-common-vars (Cons (Cons $var $count) $counts) $result)
    (if (> $count 1)
        (filter-common-vars $counts (append $result (Cons $var ()))) ; Append the variable to the result if count > 1
        (filter-common-vars $counts $result)))

(= (block1) (Cons A (Cons B (Cons C ()))))
(= (block2) (Cons A (Cons B (Cons F ()))))
(= (block3  ) (Cons B (Cons C (Cons D ()))))

! (find-common-vars (Cons (block1 ) (Cons (block2 ) (Cons (block3) ()))))
