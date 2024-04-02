; ex1.a) Write a function to return the n-th element of a list, or NIL if such an element does not exist

;getPos(l1..ln pos cnt)=l1,if pos=cnt
;                      =getPos(l2..ln pos cnt+1),otherwise

(defun getPos(l pos cnt)
(cond
    ((null l) nil)
    ((equal cnt pos) (car l))
    (t(getPos (cdr l) pos (+ 1 cnt)))
))

;Main(l1 ...ln pos)=getPos(l pos 1)

(defun Main(l pos)
    (cond
    (t (getPos l pos 1))
    )
)

;ex 11 a)Determine the least common multiple of the numerical values of a nonlinear list
;cmmdc(a b)=cmmdc(a, b-a),b>a
;          =cmmdc(a-b,b),a>b
;          =a,a=b

(defun cmmdc(a b)
(cond
    ((= a b) a)
    ((> a b) (cmmdc (- a b) b))
    (t( cmmdc a (- b a)))
)
)


;cmmmc(a b)=a*b/cmmdc(a b)
(defun cmmmc (a b)
  (cond
    (t (/ (* a b) (cmmdc a b)))
  )
)


;cmmmcAll(l1...ln)=cmmmc( l1,cmmmd(l2...ln))
(defun cmmmcAll(l)
(cond
((null l )nil)
((null (cdr l))(car l))
 (t (cmmmc (car l) (cmmmcAll (cdr l))))
)
)
;9 a) merge sort-with duplicates
;(defun merge (l1 l2)
 ; (cond
  ;  ((and (null l1) (null l2)) nil)
   ; ((null l1) l2)
    ;((null l2) l1)
   ; ((<=(car l1) (car l2)) (cons (car l1) (merge (cdr l1) l2)))
    ;(t (cons (car l2) (merge l1 (cdr l2))))
 ; )
;)

;4.a) Write a function to return the sum of two vectors.
;vectSum(l1...ln,p1...pm)=p,if l null
;                        =l,is p null
;/*                        = (l1+p1 vectSum(l2...ln,p2...pm)),otherwise
(defun vectSum (l1 l2)
  (cond
    ((null l1) l2)
    ((null l2) l1)
    (t (cons (+ (car l1) (car l2)) (vectSum (cdr l1) (cdr l2))))
  )
)

(defun addvector (l1 l2)
  (cond
   ((and(null l1) (null l2)) nil)
   ((null l1) (cons (car l2) (addvector l1 (cdr l2))))
   ((null l2) (cons (car l1) (addvector (cdr l1) l2)))
   (t(cons(+(car l1) (car l2)) (addvector (cdr l1) (cdr l2))))
)
)


;b) Write a function to get from a given list the list of all atoms, on any 
 ;level, but on the same order. Example:
; (((A B) C) (D E)) ==> (A B C D E)

;formList(l1...ln)=nil,if l is null
;                 ={l1} U formList(l2...ln),if l1 is not a list
;                 =cons(formList(l1) formlist(l2...ln))

(defun formList (l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (formList (car l)) (formList (cdr l))))
    (t (cons (car l) (formList (cdr l))))
  )
)
;myAppend(l1...ln,p1...pm)=l1 U myAppend(l2...ln,p1...pm)
;                          =p1...pm,if l is  
(defun myAppend (l1 l2)
  (cond
    ((null l1) l2)
    (t (cons (car l1) (myAppend (cdr l1) l2)))
  )
)

;b) Write a function to get from a given list the list of all atoms, on any 
 ;level, but reverse order. Example:
 ;(((A B) C) (D E)) ==> (E D C B A)

(defun formListB (l)
  (cond
    ((null l) nil)
    ((listp (car l)) (myAppend (formList (cdr l)) (formList (car l))))
    (t (cons (formListB (cdr l)) (car l)))
  )
)

;5.a) Write twice the n-th element of a linear list. Example: for (10 20 30 40 50) and n=3 will produce (10 20 30 30 40 50).
;findPosMain(l pos)=findPos(l pos 1)
(defun findPosMain(l pos)
(cond
    (t( findPos l pos 1))
)
)
;findPos(l1...ln pos cnt)= nil,if l is null
;                       ={l1} U {l1} U (l2..ln),cnt==pos
;                       ={l1} U (l2...ln),otherwise

(defun findPos(l pos cnt)
(cond
((null l)nil)
((= cnt pos) (cons (car l)(cons (car l) (cdr l))))
(t(cons (car l) (findPos (cdr l) pos (+ 1 cnt))))
)
)
;b) Write a function to return an association list with the two lists given as parameters. 
 ;Example: (A B C) (X Y Z) --> ((A.X) (B.Y) (C.Z)).

 (defun createAssociation (l1 l2)
 (cond
    ((null l1) nil)
    ((null l2) nil)
    (t(cons (cons (car l1) (car l2)) (createAssociation (cdr l1) (cdr l2))))
 )
 )

;6.a) Write a function to test whether a list is linear.

;checkLinear(l1..ln)=true,if l is null
;                   =false,if l1 is list
;                   =checkLinear(l2...ln),otherwise

(defun  checkLinear(l)
(cond
((null l)1)
((listp(car l)) 0)
(t(checkLinear (cdr l)))
)
)

;b) Write a function to replace the first occurence of an element E in a given list with an other element O.
;replace(l1...ln e o)=o U (l2...ln),l1=e
;                    = l1 U replace(l2...ln e o),otherwise(l1!=e)
;                    =nil,if l is null

(defun replacel(l e o)
(cond
    ((null l) nil)
    ((= (car l) e) (cons o (cdr l)))
    (t(cons (car l) (replacel (cdr l) e o)))
))

;8.
;c) Write a function to return the list of the first elements of all list elements of a given list with an odd 
;number of elements at superficial level. Example:
; (1 2 ( 3 (4 5) (6 7)) 8 (9 10 11)) => (1 3 9).

;createListFirstElem(l1...ln)=nil,l is null
;                            =l1 U createListFirstElem(l2...ln),l1 is the first elem
;                            =car l1 U createListFirstElem,l1 is a list

(defun createListFirstElem(l)
(cond
    ((null l)nil)
    ((listp (car l)) (cons (car(car l)) (createListFirstElem (cdr l))) )
    (t(createListFirstElem (cdr l)))
)
)
(defun mainCreateList(l)
(cond
    (t(cons (car l) (createListFirstElem (cdr l))))
)
)

;3.a) Write a function that inserts in a linear list a given atom A after the 2nd, 4th, 6th, ... element

;insertAtom(l1...ln e pos)=l1 U insertAtom(l2...ln,e,pos+1),pos%2==1
;                         =l1 U e U insertAtom(l2...ln,e,pos+1),pos%2==0
;                         =nil,l is null

(defun insertAtom(l e pos)
(cond
  ((null l)nil)
  ((oddp pos) (cons (car l) (insertAtom (cdr l) e (+ 1 pos))))
  (t(myAppend (cons (car l) e) (insertAtom(cdr l) e (+ 1 pos))))
))
;mainAtoms(l e)=inserAtom(l e 1)
(defun mainAtoms(l e)
(cond(t(insertAtom l e 1))))