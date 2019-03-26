(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(require 'cl)
(defvar young/packages '(
			 company
			 monokai-theme
			 zenburn-theme
			 hungry-delete
			 smex
			 counsel
			 swiper
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 ) "Default packages")


(defun young/packages-installed-p ()
  (loop for pkg in young/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (young/packages-installed-p)
				   (message "%s" "Refreshing package database..." )
				   (package-refresh-contents)
				   (dolist (pkg young/packages)
				     (when (not (package-installed-p pkg))
				       (package-install pkg))))

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-mode)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(require 'nodejs-repl)
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(setq auto-mode-alist (append  '(("\\.js\\'" . js2-mode)) auto-mode-alist))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)


(require 'smex)
(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)

(setq package-selected-packages young/packages)
(require 'hungry-delete)
(global-hungry-delete-mode 1)
(global-auto-revert-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-company-mode t)
;;(setq-default cursor-type 'bar)
(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(global-hl-line-mode t)
(load-theme 'zenburn t)


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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(package-selected-packages (quote (company monokai-theme hungry-delete smex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
