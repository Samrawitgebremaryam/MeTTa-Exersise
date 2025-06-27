
(Female Monica)
(Male Chandler)
(Male John)
(Female Pam)
(Female Jane)
(Female Kim)
(Male Adam)
(Male Tim)
(Male Bob)
(Male Joey)
(Female Eve)

(parent Chandler John)
(parent Chandler Pam)
(parent Chandler Adam)
(parent Chandler Jane)
(parent Monica Adam)
(parent Monica John)
(parent Monica Pam)
(parent Monica Jane)
(parent John Bob)
(parent Pam Tim)
(parent Pam Kim)
(parent Adam Eve)
(parent Jane Joey)

;Get the Parents of John.
;!(match &self (parent $x John) ($x is John's parent))

;Get the Mother of Pam.
(= (get-mother $x) 
(match &self
(,(parent $y $x) (Female $y))
$y
))
;(get-mother Pam)

;Get the Siblings of Pam.
 (= (get-siblings $x)
   (match &self
     (, (parent $y $x)
        (parent $y $z)
        (Male $y)
        )
        (let True (not (== $x $z)) $z)
        )
   )  
   ;!(get-siblings Pam)

;get parent
(= (get-parent $y) (match &self (parent $x $y) $x))
;!(get-parent Pam)

 ; get brother 
 (= (get-brother $x)
   (match &self
     (, (parent $y $x)
        (parent $y $z)
        (Male $z))
        (let True (not (== $x $z)) $z)
 
        )
   )
   ;!(get-brother John)

;Get the Uncles of Tim. 
(= (get-parent $y) (match &self (parent $x $y) $x))
(= (get-uncle $x) (get-brother (get-parent $x)))
;!(get-uncle Tim)

; Get the Nephews of John
(=(get-children $x)(match &self (parent $x $y) $y))
;!(get-children Monica)


(= (get-nephews $x)(
    let $h (get-children(get-siblings $x)) (match &self (Male $h) $h)
  ))

;!(get-children(get-siblings John))
;!(get-nephews John)

;get nice 
(= (get-nice $x) (
let $c (get-children(get-siblings $x)) (match &self (Female $c) $c)
))
!(get-nice John)

;Get all Predecessors of Bob.
(= (Parent $x $y) (match &self (parent $x $y) $x))
(= (predecessor $x $z) (Parent $x $z))
(= (predecessor $x $z) (predecessor $x (Parent $y $z)))
; Who are predecessors of Bob
;! (predecessor $x Bob)

