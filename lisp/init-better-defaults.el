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

(delete-selection-mode t)

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

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(defun test-better-defaults ()
  (interactive)
  (message "test-autoload")
  )

(provide 'init-better-defaults)
