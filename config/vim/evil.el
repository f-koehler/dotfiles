;; install evil
(use-package evil
  :straight t
  :init (progn
	  (setq-default evil-want-C-d-scroll t)
	  (setq-default evil-want-C-d-scroll t)
	  (setq-default evil-want-C-u-scroll t))
  :init (add-hook 'dired-mode-hook 'vinegar/init)
  :config (progn
	    (evil-mode 1)
	    (define-key evil-normal-state-map (kbd "-") 'dired-jump)))

(use-package evil-surround
  :after evil
  :straight t
  :config (global-evil-surround-mode 1))

;; setup vim-like keybindings in the package menu
(evil-add-hjkl-bindings package-menu-mode 'emacs
  (kbd "/") 'evil-search-forward
  (kbd "n") 'evil-search-next
  (kbd "N") 'evil-search-previous)

;; use escape to cancel
(define-key isearch-mode-map [escape] 'isearch-abort)
(define-key isearch-mode-map "\e" 'isearch-abort)
(global-set-key [escape] 'keyboard-escape-quit)

;; comment in and out like its vim
(use-package evil-commentary
  :straight t
  :config (evil-commentary-mode))
