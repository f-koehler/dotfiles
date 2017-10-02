(use-package org)
(use-package org-bullets
  :after org
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))
(use-package evil-org
  :after org)
(setq-default org-highlight-latex-and-related '(latex script entities))
(setq-default org-src-fontify-natively t)
