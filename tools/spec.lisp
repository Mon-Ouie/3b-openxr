(in-package #:3b-openxr-parse-spec2)

;; parse xml data
(xpath:map-node-set->list #'parse (xpath:evaluate "/*" *xml*))

(defparameter *spec* (gethash :registry (slots *root-parser*)))
