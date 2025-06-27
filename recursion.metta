 ;1.Find the length of a list

(= (length ()) 0)
(= (length (Cons $x $xs)) (+ 1 (length $xs)))

 ;! (length (Cons A (Cons B (Cons C ()))))

 ; 2. Find the sum of all the multiples of 3 or 5 upto a certain number

(= (sum-untill $num $sum)
    (
        if (> $num 0)
        (
            if (or (== 0 (% $num 3)) (== 0 (% $num 5)))
            (sum-untill (- $num 1) (+ $sum $num))
            (sum-untill (- $num 1) $sum)
        )
    $sum
))

 ;!(sum-untill 10 0)

 ;3.append to a list
(= (append () $y) (Cons $y ()))
(= (append (Cons $x $xs) $y) (Cons $x (append $xs $y)))
 ;!(append (Cons A (Cons B (Cons C ()))) D)

 ;4. push to a list
(= (push $y $xs) (Cons $y $xs))
 ;!(push 10 (Cons 1 (Cons 2())))

 ;5. pop from a list
(= (pop ()) ())
(= (pop (Cons $x $xs)) $xs)
 ;!(pop (Cons 1 (Cons 2(Cons 3()))))

6.pop last from a list
(= (pop-last ()) ())
 ;;(= (pop-last (Cons $x ())) ())
(= (pop-last (Cons $x $xs)) (
        if (== $xs  ())
        ()
        (Cons $x (pop-last $xs))) )

! (pop-last (Cons 1 (Cons 2 (Cons 3 ()))))

 ;7.is member
(= (member $value ()) false)
(= (member $value (Cons $x $xs))
    (if (== $x $value) True
        (member $value $xs)))
 ;!(member 4 (Cons 2 (Cons 4 (Cons 3 ()))))
 ;!(member A (Cons A (Cons B (Cons C ()))))
 ;!(member D (Cons A (Cons B (Cons C ()))))

 ;8. Remove element

(= (remove $value ()) ())
(= (remove $value (Cons $x $xs))
    (if (== $x $value)
        (remove $value $xs)
        (Cons $x (remove $value $xs))))
 ;!(remove B (Cons A (Cons B (Cons C (Cons B ())))) )

 ;6.Find max from a list
(= (max ()) -10000000000)
 ;(= (max (Cons $x ())) $x)
(= (max (Cons $x $xs))
    (if (> $x (max $xs))
        $x
        (max $xs)))
 ;!(max (Cons 3 (Cons 7 (Cons 2 (Cons 9 ())))) )

 ;7.Find min from a list
(= (min ()) 10000000000)
 ;(= (min (Cons $x ())) $x)
(= (min (Cons $x $xs))
    (if (< $x (min $xs))
        $x
        (min $xs)))
! (min (Cons 3 (Cons 7 (Cons 2 (Cons 9 ())))) )
