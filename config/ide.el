(use-package company
  :straight t
  :config (progn
            (setq company-idle-delay 0)
            (delete 'company-clang company-backends)
            (global-company-mode)))

(use-package company-quickhelp
  :after company
  :straight t
  :config (company-quickhelp-mode 1))

(use-package dashboard
  :straight t
  :config (dashboard-setup-startup-hook))

(use-package flycheck
  :straight t
  :init (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :config (global-flycheck-mode))

(use-package projectile
  :straight t
  :config (projectile-mode))

(use-package yasnippet
  :straight t
  :config (yas-global-mode 1))

(use-package ggtags
  :straight t)
(use-package realgud
  :straight t)
(use-package whitespace-cleanup-mode
  :straight t
  :config (global-whitespace-cleanup-mode))
(use-package aggressive-indent
  :straight t
  :config (progn
            (add-hook 'emacs-lis-mode-hook #'aggressive-indent-mode)))


(use-package irony
  :straight t
  :config
  (progn
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))

(use-package company-irony
  :after company
  :straight t
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
  :after flycheck
  :straight t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package irony-eldoc
  :after irony
  :straight t
  :config
  (add-hook 'irony-mode-hook #'irony-eldoc))

(use-package cmake-mode
  :straight t)
(use-package cmake-font-lock
  :straight t
  :config
  (autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

(use-package clang-format
  :straight t)

(setq-default c-basic-offset 4)

(defun python-format-code ()
  (progn
    (elpy-autopep8-fix-code)
    (elpy-yapf-fix-code)))

(use-package ggtags
  :straight t)
