(use-package ansible
  :straight t)

(use-package gitconfig-mode
  :straight t)

(use-package gitignore-mode
  :straight t)

(use-package go-mode
  :straight t)

(use-package graphviz-dot-mode
  :straight t)

(use-package haskell-mode
  :straight t)

(use-package julia-mode
  :straight t)

(use-package web-mode
  :straight t)
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

(use-package yaml-mode
  :straight t)

(use-package elpy
  :straight t
  :init
  (setq-default elpy-rpc-python-command "~/.local/opt/anaconda3/bin/python")
  :config
  (elpy-enable))

(if (file-directory-p "~/.local/opt/python-emacs")
    (pyvenv-activate "~/.local/opt/python-emacs")
  (if (file-directory-p "~/.local/opt/anaconda3/bin/python3")
      (setq-default elpy-rpc-python-command "~/.local/opt/anaconda3/bin/python3")))

(use-package latex-preview-pane
  :straight t)

(use-package htmlize
  :straight t)


; LaTeX
(add-hook 'LaTeX-mode-hook
          (setq-default evil-shift-width 2))


; F90
(setq-default f90-do-indent 4)
(setq-default f90-if-indent 4)
(setq-default f90-type-indent 4)
(setq-default f90-program-indent 4)
(setq-default f90-continuation-indent 4)
(setq-default f90-smart-end 'blink)
