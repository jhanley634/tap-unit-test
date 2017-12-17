;;;; tap-unit-test.asd

(asdf:defsystem :tap-unit-test
  :serial t
  :description "Test Anything Protocol reporting for Chris Riesbeck's excellent and very simple lisp-unit package."
  :author "Chris Riesbeck, <c-riesbeck@northwestern.edu>, http://www.cs.northwestern.edu/~riesbeck"
  :license "MIT license"
  :components ((:file "package")
               (:file "tap-unit-test")))

