(use-package helm
  :config (define-key evil-normal-state-map (kbd "C-p") 'helm-browse-project))

(use-package helm-ls-git :after helm)
(use-package helm-ls-hg :after helm)
(use-package helm-ls-svn :after helm)
(use-package helm-projectile :after helm)
(use-package neotree
  :after all-the-icons
  :init (setq-default neo-theme (if (display-graphic-p) 'icons 'arrow))
  :config (progn
	    (global-set-key [f8] 'neotree-toggle)
	    (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
	    (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
	    (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
	    (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)))
