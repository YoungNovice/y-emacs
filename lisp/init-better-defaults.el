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

(delete-selection-mode t)

(provide 'init-better-defaults)
