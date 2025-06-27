 ;7.Find min from a list
(= (min ()) 10000000000)
 ;(= (min (Cons $x ())) $x)
(= (min (Cons $x $xs))
    (if (< $x (min $xs))
        $x
        (min $xs)))
! (min (Cons 3 (Cons 7 (Cons 2 (Cons 9 ())))) )