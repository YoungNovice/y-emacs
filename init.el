(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

;; load-file and load
;; require

;;(autoload 'test-better-defaults "init-better-defaults")
;;(test-better-defaults)

;;(update-file-autoloads "~/.emacs.d/lisp/init-keybindings.el"
;;			    t "~/.emacs.d/lisp/init-keybindings-autoload.el")
;;(load "init-keybindings-autoload")
;;(test-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

