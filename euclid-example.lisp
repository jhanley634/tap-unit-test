;;;-*- Mode: Lisp; Package: tap-unit-test -*-

#|
Copyright (c) 2011 John Hanley
See LICENSE.txt for permission details.
|#

(cl:defpackage :tap-euclid
  (:use :common-lisp :tap-unit-test)
  (:export #:gcd-nat))

(in-package :tap-euclid)

;;;  Example tests that exercise target (application) code.
;;;
;;;  Run with:
;;;    (tap-unit-test::run-all-tests :tap-euclid)

;;;
;;;  Application to be tested.
;;;
(defun gcd-nat (x y)
  "Computes Greatest Common Divisor of natural numbers by Euclid's method."
  (assert (>= x 0))
  (assert (>= y 0))
  (cond ((= 0 x) y)
	((= 0 y) x)
	((> x y) (gcd-nat y x))
	(t (gcd-nat x (- y x)))))

;;;
;;;  Tests.
;;;
(define-test gcd
  (assert-equal 7 (gcd-nat 21 28))
  (assert-equal 7 (gcd-nat 28 21)))

;(define-test neg-failure
;  (assert-equal 7 (gcd-nat 21 -7)))

(define-test simple-multiple
  (assert-equal 7 (gcd-nat 7 21))
  (assert-equal 7 (gcd-nat 21 7)))

(define-test relatively-prime
  (assert-equal 1 (gcd-nat 7 12))
  (assert-equal 1 (gcd-nat 12 7)))
