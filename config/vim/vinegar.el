;; vinegar
(defun vinegar/top ()
  "Go to the top of the dired buffer"
  (interactive)
  (goto-char (point-min))
  (dired-next-line 1))

(defun vinegar/bottom ()
  "Go to the bottom of the dired buffer"
  (interactive)
  (goto-char (point-max))
  (dired-next-line -1))

(defun vinegar/up ()
  "Go one entry up in dired"
  (interactive)
  (dired-previous-line 1)
  (if (bobp) (dired-next-line 1)))

(defun vinegar/down ()
  "Go one entry down in dired"
  (interactive)
  (dired-next-line 1)
  (if (eobp) (dired-next-line -1)))

(defun vinegar/parent-dir (&optional window)
  "Jump to parent dir using dired"
  (interactive "P")
  (let* ((dir (dired-current-directory))
	 (orig (current-buffer))
	 (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
	(and (cdr dired-subdir-alist)
	     (dired-goto-subdir up))
	(progn
	  (kill-buffer orig)
	  (dired up)
	  (dired-goto-file dir)))))

(defun vinegar/init ()
  "Setup vim-vinegar like keybindings for dired"
  (define-key dired-mode-map (kbd "j") 'vinegar/down)
  (define-key dired-mode-map (kbd "k") 'vinegar/up)
  (define-key dired-mode-map (kbd "-") 'vinegar/parent-dir)
  ;; (define-key dired-mode-map (kbd "g g") 'vinegar/top)
  (define-key dired-mode-map (kbd "G") 'vinegar/bottom)
  (define-key dired-mode-map (kbd "d") 'dired-create-directory)
  (define-key dired-mode-map (kbd "% s") 'find-file))
