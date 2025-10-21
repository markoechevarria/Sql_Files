;;; LISP Tutorial 1: Basic LISP Programming

;; Alt-x portacle-configure -> portacle initial configure
;; C-x C-f -> open a new file
;; Alt-x make-directory <path> -> create a new directory
;; C-c C-c -> compile the file
;; C-x C-s -> save the file
;; C-x b -> navigate buffers


(defun fib (n)
  "Return the nth Fibonacci number."
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2))
         )
      ))

(defun many (n)
  (values n (* n 2) (* n 3) ))

(defun triple (x)
  (* 3 x))

(defun negate (x)
  "Negate the value of X"
  (- x))

(defun factorial (n)
  "Compute the factorial of n."
  (if (= n 1)
      1
      (* n (factorial ( - n 1)))))
(defun triangular (n)
  "Compute the nth triangular number"
  (if (= n 1)
      1
      (+ n (triangular ( - n 1)))))


;; Write down a recursive definition of B^E (assuming that both B and E are non-negative integers).
;; Then implement a linearly recursive function (power B E) that computes B^E.
;; Enter your function definition into a text file. Then load it into LISP. Trace the execution of (power 2 6).

(defun tothepowerof (a b)
  "Calculate a to the power of b"
  (if ( = b 0)
      1
      ( * a (tothepowerof a (- b 1)) )))

(defun fibonacci (n)
  (if (or (= n 1) (= n 0))
      1
      ( + (fibonacci (- n 1)) (fibonacci (- n 2)))))

;; (1+ x) -> (+ x 1)
;; (1- x) -> (- x 1)
;; (zerop x) -> (= x 0)
;; (plusp x) -> (> x 0)
;; (minusp x) -> (< x 0)
;; (evenp x) -> (= (rem x 2) 0)
;; (oddp x) -> (/= (rem x 2) 0)

;; (or x y)
;; (and x y)
;; (not x)

(defun binomialcoefficient (n r)
  (if (or (= r 0) (= r n))
      1
      ( + (binomialcoefficient (- n 1) (- r 1)) (binomialcoefficient ( - n 1 ) r))))

(defun binomialcoefficient2 (n r)
  (if (or ( = r 0 ) ( = r n ))
      1
      (let (
            (F1 ( binomialcoefficient2 ( - n 1 ) ( - r 1 ) ))
            (F2 ( binomialcoefficient2 ( - n 1 ) r )))
        (+ F1 F2 ))))
;; (cons 1 (cons 2 nil))
;; (quote (2 3 5 7 11 13 17 19))
;; '(2 3 5 7 11 13 17 19)
;; (first '(2 4 8))
;; (rest '(2 4 8))

;; (null nil)
;; (null '(1 2 3))
;; (consp nil)
;; (consp '(1 2 3))

;; (list-length '(2 3 5 7 11 13 17 19))

(defun recursive-list-length (L)
  (if (null L)
      0
      ( 1+ ( recursive-list-length ( rest L )))))

(defun sum (L)
  (if (null L)
      0
      ( + (first L) (sum (rest L)) )))

(defun my-list-nth (N L)
  (if (null L)
      nil
      (if (zerop N)
          (first L)
          (my-list-nth (1- N) (rest L)))))
  
(defun my-list-last (L)
  (if (null L)
      nil
      (if ( null (consp (rest l)) )
          (first L)
          (my-list-last (rest L)))))

(defun my-list-nth-2 (N L)
  (cond
    ((null L)   nil)
    ((zerop N)  (first L))
    (t          (my-list-nth-2 (1- N) (rest L)))))

(defun my-list-member (E L)
  "Test if E is a member of L."
  (cond
    ((null L)          nil)   
    ((eq E (first L))  t)     
    (t                 (my-list-member E (rest L))))) 

;; (= x y)	True if x and y evaluate to the same number.
;; (eq x y)	True if x and y evaluate to the same symbol.
;; (eql x y)	True if x and y are either = or eq.
;; (equal x y)	True if x and y are eql or if they evaluate to the same list.
;; (equalp x y)	To be discussed in Tutorial 4.

(defun list-append (L1 L2)
  "Append L1 by L2."
  (if (null L1)
      L2
      (cons (first L1) (list-append (rest L1) L2))))

;; LISP defines a function (butlast L) that returns a list containing the same elements in L except for the last one. Implement your own version of butlast using linear recursion. You may assume that (butlast nil) returns nil.

(defun my-butlast (L)
  (if (null (rest L))
      nil
      (cons (first L) (my-butlast (rest L)) )))

(defun list-intersection (L1 L2)
  "Return a list containing elements belonging to both L1 and L2."
  (cond
    ((null L1) nil)
    ((member (first L1) L2) 
     (cons (first L1) (list-intersection (rest L1) L2)))
    (t (list-intersection (rest L1) L2))))

;; Give a linearly recursive implementation of union and difference.

(defun list-union (L1 L2)
  (cond
    ((null L1) L2)
    ((null L2) L1)
    ((not (member (first L2) L1))
     (cons (first L2) (list-union L1 (rest L2))))
    (t (list-union L1 (rest L2))  )))
