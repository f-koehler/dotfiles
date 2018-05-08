(use-package org
  :straight t
  :init (progn
	  (setq-default org-highlight-latex-and-related '(latex script entities))
	  (setq-default org-src-fontify-natively t)
	  ;; (setq-default org-latex-compiler "lualatex")
	  (setq-default org-export-latex-listings t)
          (setq-default org-latex-pdf-process '("latexmk -lualatex -shell-escape %f"))))

(use-package org-bullets
  :after org
  :straight t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))
(use-package evil-org
  :after org
  :straight t)

(require 'ox-latex)
(defvar latex-definitions
  (mapconcat 'identity
             '(
               ;; "\\DeclareDocumentCommand\\diff{o}{\\IfNoValueTF{#1}{\\symup{d}}{\\symup{d}^{#1}}}"
               )
             " "))

(add-to-list 'org-latex-classes
             '("scrartcl"
               "\\documentclass{scrartcl}\n[PACKAGES]\n[EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation, smaller\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

(setq-default org-latex-default-packages-alist
              '(
                ("" "amsmath" t)
                ("" "hyperref" t)
                ("" "braket" t)
                ("" "unicode-math" t)
                ("" "xfrac" t)
                ("" "xparse" t)
                ))
(setq-default org-latex-listings 'minted)
