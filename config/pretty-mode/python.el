(defun pretty-mode/add-greek ()
  " add prettified versions of greek letters"
  (setq prettify-symbols-alist
	(append prettify-symbols-alist
		'(("alpha"   . ?α)
		  ("beta"    . ?β)
		  ("gamma"   . ?γ)
		  ("delta"   . ?δ)
		  ("epsilon" . ?ε)
		  ("zeta"    . ?ζ)
		  ("eta"     . ?η)
		  ("theta"   . ?θ)))))

(defun pretty-mode/python ()
  "Prettify symbols in python mode."
  (progn
    (setq prettify-symbols-alist
	  '(("lambda" . ?λ)
	    ("def"    . ?ϝ)
	    ("!="     . ?≠)
	    ("<="     . ?≤)
	    (">="     . ?≥)
	    ("in"     . ?∈)
	    ("not in" . ?∉)
	    ("for"    . ?∀)
	    ("or"     . ?∨)
	    ("and"    . ?∧)))
    (pretty-mode/add-greek)))

(add-hook 'python-mode-hook 'pretty-mode/python)
