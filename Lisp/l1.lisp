;a) Write a function to return the product of two vectors. https://en.wikipedia.org/wiki/Dot_product

; dotProduct(l1l2...ln, k1k2...km) = 
; = 0 , if n = 0
; = l1*k1 + dotProduct(l2...ln, k2...km) , otherwise

(defun dotProduct(l k)
(
    cond ((null l) 0)
          (t (+ (* (car l) (car k)) (dotProduct (cdr l) (cdr k))))
)
)

;b) Write a function to return the depth of a list. Example: the depth of a linear list is 1.


; myMax(a, b) = 
; = a , if a > b
; = b ,  otherwise


(defun myMax (a b)
  (cond
    ((> a b) a)
    (t b)
  )
)


; findDepth(l1l2...ln, c) = 
; = c , if n = 0
; = myMax(findDepth(l1,c+1), findDepth(l2...ln, c)) , if l1 is a list
; = findDepth(l2...ln, c) , otherwise


(defun findDepth (l c)
  (cond
    ((null l) c)
    ((listp (car l)) (myMax (findDepth (car l) (+ c 1)) (findDepth (cdr l) c)))
    (t (findDepth (cdr l) c))
  )
)

; mainDepth(l1l2...ln) = 
; = findDepth(l1l2...ln, 1)

(defun mainDepth(l)
  (cond
    (t (findDepth l 1))
  )
)

;c) Write a function to sort a linear list without keeping the double values.

; insert(l1l2...ln, elem) =
; = list(elem) , if n = 0
; = l1l2...ln , if l1 = elem
; = {elem} U l1l2...ln, if elem < l1
; = {l1} U insert(l2...ln, elem)

(defun insert (l elem)
  (cond
    ((null l) (list elem))
    ((= (car l) elem) l)
    ((< elem (car l)) (cons elem l))
    (t (cons (car l) (insert (cdr l) elem)))
  )
)

;sorting(l1...ln)=
;=nil,if n=0
;=insert(sorting(l2...ln),l1),otherwise

(defun sorting(l)
(cond
    ((null l) nil)
    (t (insert (sorting (cdr l)) (car l)))
))

;d) Write a function to return the intersection of two sets.

;contains(l1...ln,elem)=
;=nil,if n=0
;=true,if l1=elem
;=constains(l2..ln,elem),otherwise

(defun contains(l elem)
(cond
    ((null l) nil)
    ((equal(car l) elem) t)
    (t(contains elem (cdr l)))
)
)

;intersection(l1..ln,k1..km)=
;=nil,n=0
;=nil,m=0
;={l1} U intersection(l2...ln,k1...km),contains(l1,k2...km)=true
;=intersection(l2...ln,k1....km),otherwise

(defun intersection(l k)
(cond ((null l) nil)
      ((null k) nil)
      ((contains k ( car l)) (cons (car l)(intersection (cdr l) k)))
      (t(intersection (cdr l) k))
))