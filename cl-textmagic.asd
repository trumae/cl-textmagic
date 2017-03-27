#|
  This file is a part of cl-textmagic project.
  Copyright (c) 2015 Trumae da Ilha (trumae@gmail.com)
|#

#|
  Author: Trumae da Ilha (trumae@gmail.com)
|#

(defsystem "cl-textmagic"
  :version "0.1"
  :author "Trumae da Ilha"
  :license "MIT"
  :depends-on ("dexador" "cl-json")
  :components ((:module "src"
                :components
                ((:file "cl-textmagic"))))
  :description "Common lisp implementation of TextMagic API to send SMS"
  ;; :long-description (read-file-string (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "cl-textmagic-test"))))
