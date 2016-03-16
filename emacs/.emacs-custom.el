;;; package -- Matt Sital-Singh's custom emacs setup
;;;
;;; Commentary:
;;; Integrates with netsight-emacs.
;;

;;; Code:
(setq custom-theme-directory (locate-user-emacs-file "themes"))

;; Dir for custom elisp
(defvar user-lisp-directory (expand-file-name "~/elisp")
  "Place to load local LISP code from.")

(require 'gist)
(require 'magit)
(require 'use-package)

(add-hook 'robot-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode nil)))

(setq gist-view-gist t)

(global-set-key (kbd "<left-fringe> <double-mouse-1>") 'py-insert-debug)

(defun py-handle-rst-docs ()
  "Handle rst docs nicely."
  (auto-fill-mode t))

(add-hook 'rst-mode #'py-handle-rst-docs)

(load-file "~/elisp/robot-mode.el")
(add-to-list 'auto-mode-alist '("\\.robot\\'" . robot-mode))

(setq tramp-auto-save-directory "/tmp")

; pylint
(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
;;(add-hook 'python-mode-hook 'pylint-add-key-bindings)

(provide '.emacs-custom)
;;; .emacs-custom.el ends here

