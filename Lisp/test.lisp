;mountain(l1...ln k)=true,if the element we check is the last one and k=1(the "mountain" was decreasing)
;                   =nil,if the element we check is the last one and k=0(the"mountain" was increasing)
;                   =mountain(l2...ln 0),l1<l2 and k=0
;                   =mountain(l2...ln 1),l1>l2  and k=0
;                   =mountain(l2...ln 1),l1>l2 and k=1
;                   =nil,l1<l2 and k=1

;k-is used to check if the sequence is increasing or decreasing
;k=0=>increasing
;k=1=>decreasing
(defun mountain(l k)
(cond 
    ((and (null (cdr l))(= k 1)) t)
    ((and (null (cdr l))(= k 0)) nil)
    ((and(<=(car l)(cadr l))(= k 0))(mountain(cdr l) 0)) 
    ((and(>=(car l)(cadr l))(= k 0))(mountain (cdr l) 1))
    ((and(>=(car l) (cadr l))(= k 1))(mountain (cdr l) 1))
    (t nil)
))

;mainMountain(l1..ln)=nil,if l is null
;                   =nil,if n=1
;                   =nil,if n=2
;                   =mountain(l1...ln 0)

(defun mainMountain(l)
(cond
((null l) nil)
((null (cdr l)) nil)
((null (caddr l)) nil) ;if a 3-rd number doesn't exist,it can't be a mountain 
(t(mountain l 0))
))