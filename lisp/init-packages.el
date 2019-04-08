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
			 evil-nerd-commenter
			 evil-escape
			 window-numbering
			 which-key
			 command-log-mode
			 key-chord
			 use-package
			 nodejs-repl
			 pallet
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
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
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
 "4" 'select-window-4
 "w/" 'split-window-right
 "w-" 'split-window-below
 ":" 'counsel-M-x
 "wm" 'delete-other-windows
 )

(window-numbering-mode 1)
(evilnc-default-hotkeys)

(dolist (mode '(ag-mode flycheck-error-list-mode git-rebase-mode 2048-mode))
  (add-to-list 'evil-emacs-state-modes mode))

(add-hook 'occur-mode-hook (lambda () (evil-add-hjkl-bindings occur-mode-map 'emacs
					(kbd "/" 'evil-search-forward)
					(kbd "n" 'evil-search-next)
					(kbd "N" 'evil-search-previous)
					(kbd "C-d" 'evil-scroll-down)
					(kbd "C-u" 'evil-scroll-up)
					)))
;; 好用得不得了
(which-key-mode 1)
(setq which-key-side-window-location 'right)

(add-hook 'python-mode-hook (lambda() (set (make-local-variable 'company-backends) '(company-anaconda))))

(require 'command-log-mode)
(global-command-log-mode)

(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

(provide 'init-packages)
