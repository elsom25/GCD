;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname gcd) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; ###############################################
;; gcd.ss
;; Jesse McGinnis : 20296483
;; Assignment 9, Question 2ab
;; ###############################################

;; ===============================================
;; Main Function (a)
;; ===============================================

;; contract:   gcd-list1 : (listof num) -> num
;; description: consumes a list of numbers, and returns the gcd of the list
;; example:
(check-expect (gcd-list1 '(1 2)) 1)
(define (gcd-list1 alon)
  (foldr gcd 0 alon))

;; Tests
(check-expect (gcd-list1 '(12 6 3)) 3)
(check-expect (gcd-list1 '(67760 151536 565488)) 1232)

;; ===============================================
;; Main Function (b)
;; ===============================================

;; contract:    gcd-list1 : (listof num) -> num
;; description: consumes a list of numbers, and returns the gcd of 
;; the list by finding the gcd of neighbours
;; example:
(check-expect (gcd-list2 '(2 1)) 1)
(define (gcd-list2 alon)
  (local
    [(define (gcd-neighbors alon)
       (cond 
         [(empty? alon) empty]
         [(empty? (rest alon)) (cons (first alon) empty)]
         [else (cons (gcd (first alon) (second alon))
                     (gcd-neighbors (rest (rest alon))))]))]
    (cond
       [(empty? (rest (rest alon))) (gcd (first alon) (second alon))]
       [else (gcd (first (gcd-neighbors alon))
         (second (gcd-neighbors alon)))])))

;; test
(check-expect (gcd-list2 '(12 6 4 2)) 2)
(check-expect (gcd-list2 '(67760 94689641036863488 151536 565488)) 1232)
