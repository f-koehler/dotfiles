(use-package org
  :init (progn
	  (setq-default org-highlight-latex-and-related '(latex script entities))
	  (setq-default org-src-fontify-natively t)
	  (setq-default org-latex-compiler "lualatex")
	  (setq-default org-export-latex-listings t)))

(use-package org-bullets
  :after org
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))
(use-package evil-org
  :after org)
