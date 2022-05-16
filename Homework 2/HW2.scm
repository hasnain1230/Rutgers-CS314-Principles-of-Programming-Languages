; 0. Define the function (pickInd lst index). This function should resolve to the index-th element  of the list, lst. For example: (pickInd '(a b c d) 2) resolves to 'c.

(define pickInd
  (lambda (lst index)
    ; (define x 0)
    (if (null? lst) ; If list is empty.
        -1
        (if (eq? index 0) ; If we are at the right index.
            (car lst)
            (pickInd (cdr lst) (- index 1)) ; If we are not at the right index, subtract one and keep going.
            )
            
    )
  )
)

(pickInd '(1 2 3 4) 6) ; Returns -1
(pickInd '(1 2 3 4) 2) ; Returns 3
(pickInd '(1 2 3 4) 0) ; Returns 1

;1. Define the function (siftNum lst). This function should resolve to all the numbers in the  list, lst. For example: (siftNum '(a 8 2 1 m l 90 p 2)) resolves to '(8 2 1 1 90 2).
(define (siftNum lst)
  (if (null? lst)
      '()
      (if (symbol? (car lst))
          (siftNum (cdr lst))
          (cons (car lst) (siftNum (cdr lst))))))

(siftNum '(a 8 2 1 m l 90 p 2))
(siftNum '(a b c d e f g h 1 2 3 4 5 6 7 9 0 i j k l m n o p))




;2. Define the function (zipLst lst0 lst). This function should assemble two lists in ascending  order in to a single list, mainting the sorted order.
;For example: (zipLst '(1 6 8) '(2 3 7)) resolves to '(1 2 3 6 7 8).

(define (zipLst lst0 lst1)
  (cond ((null? lst0)
         lst1) ; If lst0 is null, return lst1 or vice versa.
        ((null? lst1)
         lst0)
        (else
         (let ((head0 (car lst0))
              (head1 (car lst1)))
          (if (<= head0 head1) ; Compare the two elements.
              (cons head0 (zipLst (cdr lst0) lst1)) ; Append first head to the next appropriate place in the list
              (cons head1 (zipLst lst0 (cdr lst1)))))))) ; Append second head to the appropriate place in the list.



(zipLst '(1 6 8) '(2 3 7))

;3. Define the function (bubbleLst lst). This function should resolve to a list of sublists, where each sublist holds a single element from lst.
;
;For example: (bubbleLst '( 1 2 (3 4)) ) resolves to '((1) (2) ((3 4))).

(define (bubbleLst lst)
  (cond ((null? lst)
        lst)
        (else
         (cons (list (car lst)) (bubbleLst (cdr lst))))))

(bubbleLst '( 1 2 (3 4)) )
(bubbleLst '(1 2 3 4))

;4. Define the function (doubleBubbleLst lst). This function should resolve to a list of sublists, where each sublist holds a single element from lst and all sublists from lst  are also bubbled, so that every list and sublist has no atoms. This is the deep  recursion version of bubbleLst.
;
;For example: (doubleBubbleLst '(1 2 (3 4)) ) resolves to '((1) (2) (( (3) (4) ))).

(define (doubleBubbleLst lst)
  (cond ((null? lst)
        lst)
        ((list? (car lst))
         (cons (list (doubleBubbleLst (car lst))) (doubleBubbleLst (cdr lst)))) ; List the inner list which lists the inner inner lists because recursion.           
        (else
         (cons (list (car lst)) (doubleBubbleLst (cdr lst)))))) ; Basically the same thing as bubbleLst.))) ; And get rid of that old list and proceed. 

(doubleBubbleLst '(1 2 (3 4)) )


;5. Define the function (checkVals fn lst). This function should resolve to #t if every element in lst is true for the function fn, and #f otherwise.
;
;For example: (checkVals (lambda (x) (= x 1)) '(1 1 1 1 2)) resolves to #f.

(define (checkVals fn lst)
  (cond ((null? lst)
         #t) ; This means we've reached the end of the recursion... So, return true because everything in fn passed.
        ((fn (car lst)) ; So far, so true.
             (checkVals fn (cdr lst))) ; Recurse

        (else
         #f))) ; Well, it was a good run.

(checkVals (lambda (x) (= x 1)) '(1 1 1 1 2))
(checkVals even? '(2 4 8 6 10))
(checkVals odd? '(1 3 5 7 9 11 12))