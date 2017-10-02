(use-package all-the-icons)
(use-package all-the-icons-dired
  :after all-the-icons
  :config (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package beacon
  :init (progn
	  (setq-default beacon-color "#657b83")
	  (setq-default beacon-size 30)
	  (setq-default beacon-blink-duration 0.1)
	  (setq-default beacon-blink-delay 0.05))
  :config (beacon-mode 1))

(use-package monokai-theme
  :config (load-theme 'monokai t))

(use-package focus)

(use-package highlight-indent-guides
  :init (setq-default highlight-indent-guides-method 'column)
  :config (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package nlinum
  :init (progn
	  (setq-default nlinum-format "%4d\u2502")
	  (setq-default nlinum-highlight-current-line 1))
  :config (global-nlinum-mode))


;; powerline
(use-package powerline)
(use-package spaceline
  :after powerline)
(use-package spaceline-all-the-icons
  :after spaceline
  :init (setq-default spaceline-all-the-icons-separator-type 'wave)
  :config (spaceline-all-the-icons-theme))


(use-package rainbow-mode)
