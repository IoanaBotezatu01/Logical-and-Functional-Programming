; C. Se consideră o listă neliniară. Să se scrie o funcţie LISP care să aibă ca rezultat
;  lista iniţială din care au fost eliminați toți atomii numerici multipli de 3.
;  Se va folosi o funcție MAP.

; Exemplu a) dacă lista este (1 (2 A (3 A)) (6)) => (1 (2 A (A)) NIL)
;         b) dacă lista este (1 (2 (C))) => (1 (2 (C)))


; removeElem(l, elem) = 
; = nil, if l is number and l % 3 == 0
; = list(l), if l is an atom
; = removeElem(l1, elem) U ... U removeElem(ln, elem), otherwise (l = l1l2...ln)

(defun removeElem(l)
  (cond
    ((and (numberp l) (equal (mod l 3) 0)) nil) 
    ((atom l) (list l))
    (t (list (mapcan #'removeElem l)))
  )
)


(defun main(l)
  (removeElem l)
)
; C. Un arbore n-ar se reprezintă în LISP astfel ( nod subarbore1 subarbore2 .....)
; Se cere să se înlocuiască nodurile de pe nivelurile impare din arbore cu o valoare e dată. Nivelul rădăcinii se consideră a fi
; 0. Se va folosi o funcție MAP.
; Exemplu pentru arborele (a (b (g)) (c (d (e)) (f))) şi e=h => (a (h (g)) (h (d (h)) (h)))


; replaceNodesFromLevel(l, elem, level) = 
; = elem, if l is an atom and level % 2 == 1
; = l, if l is an atom
; = replaceNodesFromLevel(l1, elem, level + 1) U ... U replaceNodesFromLevel(ln, elem, level + 1), otherwise where l = l1l2...ln


(defun replaceNodesFromLevel(l elem level)
  (cond
    ((and (atom l) (equal (mod level 2) 1)) elem)
    ((atom l) l)
    (t (mapcar #' (lambda (a) (replaceNodesFromLevel a elem (+ level 1))) l))
  )
)

(defun main(l elem)
  (replaceNodesFromLevel l elem -1)
)

;replaceK(l1...ln,k,h)=0,k=h
;               =l1,atom l1
;               =replaceK(l1,k,h+1)U replaceK(l2,k,h+1)U....UreplaceK(ln,k,h+1),otherwise

(defun replaceK(l k h)
(cond
((and(atom l)(= h k)) 0)
((atom l) l)
(t(mapcar #'(lambda(x)(replaceK x k (+ h 1))) l))
)
)
(defun mainK(l k)
(replaceK l k 0))