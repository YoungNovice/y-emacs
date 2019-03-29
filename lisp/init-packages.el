(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)


  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(require 'cl)

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
			 reveal-in-osx-finder
			 web-mode
			 js2-refactor
			 expand-region
			 iedit
			 evil
			 evil-leader
			 window-numbering
;;			 powerline
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
;; 在lisp下‘不成对生成
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(setq auto-mode-alist (append  '(("\\.js\\'" . js2-mode)
				 ("\\.html\\'" . web-mode))
			       auto-mode-alist))

(global-company-mode t)

;; config for web-mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map "jk" 'evil-normal-state)
;; 默认的leader key 是,
(global-evil-leader-mode)

(setq evil-leader/leader ",")
(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "k" 'kill-buffer
 "0" 'select-window-0
 "1" 'select-window-1
 "2" 'select-window-2
 "3" 'select-window-3
 "w/" 'split-window-right
 "w-" 'split-window-below
 ":" 'counsel-M-x
 "wm" 'delete-other-windows
 )

(window-numbering-mode 1)
(require 'powerline)
(powerline-default-theme)

(provide 'init-packages)
;;(require 'hungry-delete)
;;(require 'smartparens-config)
