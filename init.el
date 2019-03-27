;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "yangxuan.org" user-emacs-directory))

;; load-file and load
;; require

;;(autoload 'test-better-defaults "init-better-defaults")
;;(test-better-defaults)

;;(update-file-autoloads "~/.emacs.d/lisp/init-keybindings.el"
;;			    t "~/.emacs.d/lisp/init-keybindings-autoload.el")
;;(load "init-keybindings-autoload")
;;(test-keybindings)
