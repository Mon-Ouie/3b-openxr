(in-package #:3b-openxr-wrappers)

;;; 11. Input and Haptics

;; 11.1. Action Overview

;; 11.2. Action Sets

(defun create-action-set (name &key (localized-name name) (priority 0))
  (with-action-set-create-info (asci :action-set-name name
                                     :localized-action-set-name localized-name
                                     :priority priority)
    (with-returned-handle (p %:action-set)
      (%:create-action-set *instance* asci p))))

(import-export %:destroy-action-set)

;; 11.3. Creating Actions

(defun create-action (action-set name atype &key (localized-name name)
                                              subaction-paths)
  (when subaction-paths
    (break "subaction paths not implemented yet"))
  (with-action-create-info (aci :action-name name
                                :localized-action-name localized-name
                                :action-type atype
                                :count-subaction-paths 0
                                :subaction-paths (cffi:null-pointer))
    (with-returned-handle (p %:action)
      (%:create-action action-set aci p))))

(import-export %:destroy-action)

;; 11.4. Suggested Bindings

(defun suggest-interaction-profile-bindings (profile
                                             action binding &rest more-bindings)
  (let* ((bindings (list* action binding more-bindings))
         (n (/ (length bindings) 2)))
    (cffi:with-foreign-object (p '(:struct %:action-suggested-binding) n)
      (loop for i below n
            for (a b) on bindings by #'cddr
            for p2 = (cffi:mem-aptr p '(:struct %:action-suggested-binding) i)
            do (setf (cffi:foreign-slot-value
                      p2 '(:struct %:action-suggested-binding) '%:action) a
                      (cffi:foreign-slot-value
                       p2 '(:struct %:action-suggested-binding) '%:binding) b))
      (with-interaction-profile-suggested-binding (ipsb
                                                   :interaction-profile profile
                                                   :suggested-bindings p
                                                   :count-suggested-bindings n)
        (check-result (%:suggest-interaction-profile-bindings *instance* ipsb))))))

(defun attach-session-action-sets (session action-sets-vector)
  (let ((n (length action-sets-vector)))
    (cffi:with-foreign-object (p '%:action-set n)
      (loop for i below n
            do (setf (cffi:mem-aref p '%:action-set i)
                     (aref action-sets-vector i)))
      (with-session-action-sets-attach-info (sasai
                                             :count-action-sets
                                             (length action-sets-vector)
                                             :action-sets p)
        (check-result (%:attach-session-action-sets session sasai))))))

(defun get-current-interaction-profile (session top-level-user-path)
  (with-interaction-profile-state (ips :%slots t)
    (check-result (%:get-current-interaction-profile
                   session top-level-user-path ips))
    %:interaction-profile))


;; 11.5. Reading Input Action State

;; fixme: should these return multiple values instead of plist?

(defun get-action-state-boolean (session action)
  (with-action-state-boolean (asb :%slots t)
    (with-action-state-get-info (agi :action action)
      (check-result (%:get-action-state-boolean session agi asb)))
    (list :current (not (zerop %:current-state))
          :changed (not (zerop %:changed-since-last-sync))
          :last-change-time %:last-change-time
          :active %:is-active)))

(defun get-action-state-float (session action)
  (with-action-state-float (asf :%slots t)
    (with-action-state-get-info (agi :action action)
      (check-result (%:get-action-state-float session agi asf)))
    (list :current %:current-state
          :changed (not (zerop %:changed-since-last-sync))
          :last-change-time %:last-change-time
          :active %:is-active)))

(defun get-action-state-vector-2f (session action)
  (with-action-state-vector-2f (asv :%slots t)
    (with-action-state-get-info (agi :action action)
      (check-result (%:get-action-state-float session agi asv)))
    (list :current %:current-state
          :changed (not (zerop %:changed-since-last-sync))
          :last-change-time %:last-change-time
          :active %:is-active)))

(defun get-action-state-pose (session action)
  (with-action-state-pose (asp :%slots t)
    (with-action-state-get-info (agi :action action)
      (check-result (%:get-action-state-float session agi asp)))
    (list :active %:is-active)))



;; 11.6. Output Actions and Haptics

(defun apply-haptic-feedback (session action &key amplitude duration frequency
                                               (subaction-path +null-path+))
  (with-haptic-vibration (hv :amplitude (float amplitude 1f0)
                             :duration duration
                             :frequency (float frequency 1f0))
    (with-haptic-action-info (hai :action action
                                  :subaction-path subaction-path)
      (check-result (%:apply-haptic-feedback session hai hv)))))


(defun stop-haptic-feedback (session action &key (subaction-path +null-path+))
  (with-haptic-action-info (hai :action action :subaction-path subaction-path)
    (check-result (%:stop-haptic-feedback session hai))))

;; 11.7. Input Action State Synchronization

(defun sync-actions (session active-action-sets-vector)
  (assert (= 1 (length active-action-sets-vector)))
  ;; todo: handle multiple active action sets
  (with-active-action-set (aas :action-set (aref active-action-sets-vector 0))
    (with-actions-sync-info (asi
                             :count-active-action-sets 1
                             :active-action-sets aas)
      (check-result (%:sync-actions session asi)))))

;; 11.8. Bound Sources

(defun enumerate-bound-sources-for-action (session action)
  (with-bound-sources-for-action-enumerate-info (bsfaei :action action)
    (with-two-call (i o p %:path)
      (%:enumerate-bound-sources-for-action session bsfaei i o p))))

(defun get-input-source-localized-name (session path
                                        &key (components '(:user-path
                                                           :interaction-profile
                                                           :component)))
  (with-input-source-localized-name-get-info (islngi
                                              :source-path path
                                              :which-components components)
    (with-two-call/string (i o p)
      (%:get-input-source-localized-name session islngi i o p))))
