(defun pretty-mode/emacs-lisp ()
  "Prettify symbols in Emacs Lisp mode."
  (setq prettify-symbols-alist
	'(("lambda" . ?λ)
	  ("defun"  . ?ϝ)
	  ("!="     . ?≠)
	  ("<="     . ?≤)
	  (">="     . ?≥))))

(add-hook 'emacs-lisp-mode-hook 'pretty-mode/emacs-lisp)
