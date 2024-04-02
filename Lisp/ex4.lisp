(defun vectSum (l1 l2)
  (cond
    ((null l1) l2)
    ((null l2) l1)
    (t (cons (+ (car l1) (car l2)) (vectSum (cdr l1) (cdr l2))))
  )
)