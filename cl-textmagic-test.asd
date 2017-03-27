#|
  This file is a part of cl-textmagic project.
  Copyright (c) 2015 Trumae da Ilha (trumae@gmail.com)
|#

(defsystem "cl-textmagic-test"
  :author "Trumae da Ilha"
  :license "MIT"
  :depends-on ("cl-textmagic" "prove")
  :components ((:module "t"
                :components
                ((:test-file "cl-textmagic"))))
  :description "Test system for cl-textmagic"

  :defsystem-depends-on ("prove-asdf")
  :perform (test-op (o c) (symbol-call :prove-asdf :run-test-system c)))
