#|
  This file is a part of cl-textmagic project.
  Copyright (c) 2015 Trumae da Ilha (trumae@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-textmagic-test-asd
  (:use :cl :asdf))
(in-package :cl-textmagic-test-asd)

(defsystem cl-textmagic-test
  :author "Trumae da Ilha"
  :license ""
  :depends-on (:cl-textmagic
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cl-textmagic"))))
  :description "Test system for cl-textmagic"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
