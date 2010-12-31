;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname bettergcd) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; ###############################################
;; bettergcd.ss
;; Jesse McGinnis : 20296483
;; Assignment 9, Question 2c
;; ###############################################

;; ===============================================
;; Main Function
;; ===============================================

;; contract:    gcd-list3 : (listof num) -> num
;; description: consumes a list of numbers, and returns the gcd of 
;; the list by finding the gcd of neighbours
;; example:
(check-expect (gcd-list3 '(2 1)) 1)
(define (gcd-list3 alon)
  (local
    [(define (find-max alon num)
       (cond
         [(empty? alon) num]
         [(> (first alon) num) (find-max (rest alon) (first alon))]
         [else (find-max (rest alon) num)]))
     (define (find-min alon num)
       (cond
         [(empty? alon) num]
         [(< (first alon) num) (find-min (rest alon) (first alon))]
         [else (find-min (rest alon) num)]))]
    (cond
      [(or (= 1 (first alon)) (= 1 (second alon))) 1]
      [(empty? (rest (rest alon))) (gcd (first alon) (second alon))]
      [else (gcd (gcd (find-max alon 0)
                      (find-min alon 0))
                 (gcd-list3  (rest alon)))])))

;; test
(check-expect (gcd-list3 '(12 6 4 2)) 2)
(check-expect (gcd-list3 '(67760 94689641036863488 151536 565488)) 1232)
