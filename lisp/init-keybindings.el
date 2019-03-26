(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
 
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-c a") 'org-mode)

;;copy region or whole line
(global-set-key "\M-w"
(lambda ()
(interactve)
(if mark-active
    (kill-ring-save (region-beginning)
    (region-end))
    (progn
    (kill-ring-save (line-beginning-position)
    (line-end-postion))
    (message "copyied line")))))

;; kill region or whole line
(global-set-key "\C-w"
(lambda ()
(interactive)
(if mark-active
    (kill-region (region-beginning)
    (region-end))
    (prop
    (kill-region (line-beginning-position)
    (line-end-position))
    (message "killed line")))))

(provide 'init-keybindings)
