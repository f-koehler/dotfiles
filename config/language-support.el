(use-package ansible)

(use-package gitconfig-mode)

(use-package gitignore-mode)

(use-package go-mode)

(use-package graphviz-dot-mode)

(use-package haskell-mode)

(use-package julia-mode)

(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (setq-default evil-shift-width 2)
            (setq indent-tabs-mode nil)
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 2)
            (setq web-mode-code-indent-offset 2)))

(use-package yaml-mode)

(use-package elpy
  :config
  (elpy-enable))

(use-package latex-preview-pane)

(use-package htmlize)


; F90
(setq-default f90-do-indent 4)
(setq-default f90-if-indent 4)
(setq-default f90-type-indent 4)
(setq-default f90-program-indent 4)
(setq-default f90-continuation-indent 4)
(setq-default f90-smart-end 'blink)
