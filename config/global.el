;; use tabs instead of whitespaces
(setq-default indent-tabs-mode nil)

;; disable the clunky interface
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; treat camelcase as individual words
(add-hook 'prog-mode-hook 'subword-mode)

;; make scripts executable on save
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; only run garbage collection every 64MB
(setq-default gc-cons-threshold 67108864)

;; determine how dired lists files
(setq-default dired-listing-switches "-lah")

;; do not ask yes/no but y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; turn on syntax highlighting whenever it is possible
(global-font-lock-mode t)

;; always reload files that change
(global-auto-revert-mode t)

;; show matching parentheses immediately
(show-paren-mode 1)
(setq-default show-paren-delay 0.0)

;; highlight current line
(require 'hl-line)
(global-hl-line-mode)

;; show whitespaces and newlines
(require 'whitespace)

;; clipboard
(setq-default select-enable-clipboard t)
(setq-default interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; change location of customizations and protect init.el
(setq-default custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; wind move for window navigation
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
