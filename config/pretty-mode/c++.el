(defun pretty-mode/c ()
  "Prettify symbols in C mode."
  (setq prettify-symbols-alist
	(append prettify-symbols-alist
		'(("!=" . ?≠)
		  ("<=" . ?≤)
		  (">=" . ?≥)
		  ("&&" . ?∧)
		  ("||" . ?∨)
		  ("<<" . ?≪)
		  (">>" . ?≫)))))

(defun pretty-mode/c++ ()
  "Prettify symbols in C++ mode."
  (pretty-mode/c))

(add-hook 'c-mode 'pretty-mode/c)
(add-hook 'c++-mode 'pretty-mode/c++)
