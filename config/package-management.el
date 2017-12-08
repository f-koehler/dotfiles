(eval-when-compile
  (add-to-list 'load-path "~/code/use-package")
  (require 'use-package))

;; add package sources
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)

;; install use-package
; (unless (package-installed-p 'use-package)
;   (package-refresh-contents)
;   (package-install 'use-package))
(setq-default use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

;; install paradox which enhances elpa
(use-package paradox
  :init (setq-default paradox-execute-asynchronously t)
  :config (paradox-enable))
