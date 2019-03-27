(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(defvar young/packages '(
			 company
			 popwin
			 monokai-theme
			 zenburn-theme
			 hungry-delete
			 counsel
			 swiper
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 ) "Default packages")

(setq package-selected-packages young/packages)

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

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-hungry-delete-mode 1)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(setq auto-mode-alist (append  '(("\\.js\\'" . js2-mode)) auto-mode-alist))

(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
;;(require 'hungry-delete)
;;(require 'smartparens-config)
