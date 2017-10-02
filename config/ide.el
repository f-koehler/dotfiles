(use-package auto-complete
  :config (ac-config-default))
(use-package company
  :after org
  :config
  (add-hook 'org-mode-hook 'company-mode))

;; (use-package company
;;   :config
;;   (add-hook 'after-init-hook 'global-company-mode))

(use-package company-quickhelp :after company)

(use-package dashboard :config (dashboard-setup-startup-hook))

(use-package flycheck
  :init (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  :config (global-flycheck-mode))

(use-package projectile :config (projectile-mode))

(use-package yasnippet :config (yas-global-mode 1))

(use-package ggtags)
(use-package realgud)
(use-package whitespace-cleanup-mode
  :config (global-whitespace-cleanup-mode))
(use-package aggressive-indent
  :config (global-aggressive-indent-mode 1))
