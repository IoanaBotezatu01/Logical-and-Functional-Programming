; 1. Write a function to check if an atom is member of a list (the list is non-liniar)

; checkExistence(l elem) = 
; = true, if l = elem and l is an atom
; = false, if l != elem and l is an atom
; = checkExistence(l1 elem) or checkExistence(l2 elem) or ... or checkExistence(ln elem) , otherwise


(defun checkExistence(l elem)
  (cond
    ((and (atom l) (equal l elem)) t)
    ((atom l) nil) ;already checked if it is equal with elem
    (t (some #'identity (mapcar #'(lambda (a) (checkExistence a elem)) l)))
  )
)