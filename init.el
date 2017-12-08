
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst user-config-dir "~/.emacs.d/config/")
(defun load-config (relpath)
  (interactive "f")
  (load-file (expand-file-name relpath user-config-dir)))

(load-config "global.el")
(load-config "package-management.el")
(load-config "vim/vinegar.el")
(load-config "vim/evil.el")
(load-config "vcs.el")
(load-config "pretty-mode/c++.el")
(load-config "pretty-mode/emacs-lisp.el")
(load-config "pretty-mode/latex.el")
(load-config "pretty-mode/python.el")
(load-config "playerctl.el")
(load-config "helm.el")
(load-config "org.el")
(load-config "language-support.el")
(load-config "visual.el")
(load-config "ide.el")

(set-face-attribute 'default nil :height 90)
