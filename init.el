;; this file will be replace with the actual config from init.org

;; make sure that org-mode is available
(require 'org)

;; load the init.org file
(find-file (concat user-emacs-directory "init.org"))

;; tangle (load all code blocks that do not specify ":tangle no"
(org-babel-tangle)

;; load the generated init.el file
(load-file (concat user-emacs-directory "init.el"))

;; byte-compile the init.el file
(byte-compile-file (concat user-emacs-directory "init.el"))
