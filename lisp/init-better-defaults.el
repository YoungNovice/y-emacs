(setq ring-bell-function 'ignore)
(global-auto-revert-mode 1)
(global-linum-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8yx" "yangxuan")
					    ("8github" "git@github.com:YoungNovice")
					    ))

(setq make-backup-files nil)
(setq auto-save-default nil)

(recentf-mode t)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'prog-mode-hook 'abbrev-mode)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))


(defun test-better-defaults ()
  (interactive)
  (message "test-autoload")
  )

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))
(fset  'yes-or-no-p 'y-or-n-p)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; c-x c-j open current file dired-mode
(require 'dired-x)
(setq dired-dwim-target t)

(provide 'init-better-defaults)
