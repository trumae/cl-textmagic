#|
  This file is a part of cl-textmagic project.
  Copyright (c) 2015 Trumae da Ilha (trumae@gmail.com)
|#

#|
  Author: Trumae da Ilha (trumae@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-textmagic-asd
  (:use :cl :asdf))
(in-package :cl-textmagic-asd)

(defsystem cl-textmagic
  :version "0.1"
  :author "Trumae da Ilha"
  :license ""
  :depends-on (:dexador
	       :cl-json
	       )
  :components ((:module "src"
                :components
                ((:file "cl-textmagic"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-textmagic-test))))
