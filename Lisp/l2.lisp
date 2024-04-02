;12. Determine the list of nodes accesed in preorder in a tree of type (2).


; myAppend(l1l2...ln, p1p2...pm) = 
; = p1p2...pm, if n = 0
; = {l1} U myAppend(l2...ln, p1p2...pm), otherwise


(defun myAppend (l p)
  (cond
    ((null l) p)
    (t (cons (car l) (myAppend (cdr l) p)))
  )
)


; preorder(l1..ln) = 
; = nil, if l is empty
; = myAppend(list(car l), myAppend(preorder(l2), preorder(l3))), otherwise

(defun preorder(l)
  (cond
    ((null l) nil)
    (t (myAppend (list (car l)) (myAppend (preorder (cadr l)) (preorder (caddr l)))))
  )
)
;cadr-second element of l
;caddr-third element of l