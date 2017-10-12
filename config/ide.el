(use-package company
  :config (global-company-mode))

(use-package company-quickhelp
  :after company
  :config (company-quickhelp-mode 1))

(use-package dashboard
  :config (dashboard-setup-startup-hook))

(use-package flycheck
  :init (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :config (global-flycheck-mode))

(use-package projectile
  :config (projectile-mode))

(use-package yasnippet
  :config (yas-global-mode 1))

(use-package ggtags)
(use-package realgud)
(use-package whitespace-cleanup-mode
  :config (global-whitespace-cleanup-mode))
(use-package aggressive-indent
  :config (progn
            (add-hook 'emacs-lis-mode-hook #'aggressive-indent-mode)))


(use-package irony
  :config
  (progn
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))

(use-package company-irony
  :after company
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
  :after flycheck
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package irony-eldoc
  :after irony
  :config
  (add-hook 'irony-mode-hook #'irony-eldoc))

(use-package cmake-mode)
(use-package cmake-font-lock
  :config
  (autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

(use-package clang-format)

(setq-default c-basic-offset 4)

(defun python-format-code ()
  (progn
    (elpy-autopep8-fix-code)
    (elpy-yapf-fix-code)))
