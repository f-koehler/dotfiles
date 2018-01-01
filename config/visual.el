(use-package all-the-icons
  :straight t)
(use-package all-the-icons-dired
  :after all-the-icons
  :straight t
  :config (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package beacon
  :straight t
  :init (progn
	  (setq-default beacon-color "#657b83")
	  (setq-default beacon-size 30)
	  (setq-default beacon-blink-duration 0.1)
	  (setq-default beacon-blink-delay 0.05))
  :config (beacon-mode 1))

(use-package monokai-theme
  :straight t
  :config (load-theme 'monokai t))

(use-package focus
  :straight t)

(use-package highlight-indent-guides
  :straight t
  :init (setq-default highlight-indent-guides-method 'column)
  :config (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package nlinum
  :straight t
  :init (progn
	  (setq-default nlinum-format "%4d\u2502")
	  (setq-default nlinum-highlight-current-line 1))
  :config (global-nlinum-mode))


;; powerline
(use-package powerline
  :straight t)
(use-package spaceline
  :after powerline
  :straight t)
(use-package spaceline-all-the-icons
  :after spaceline
  :straight t
  :init (setq-default spaceline-all-the-icons-separator-type 'wave)
  :config (spaceline-all-the-icons-theme))


(use-package rainbow-mode
  :straight t)
