;;; package -- Matt Sital-Singh's custom emacs setup
;;;
;;; Commentary:
;;; Integrates with netsight-emacs.
;;

;;; Code:
(setq custom-theme-directory (locate-user-emacs-file "themes"))

;; Material theme
(load-theme 'material t)

;; Dir for custom elisp
(defvar user-lisp-directory (expand-file-name "~/elisp")
  "Place to load local LISP code from.")

(require 'gist)
(require 'magit)
(require 'use-package)

(setq gist-view-gist t)

;; Click fringe for pdb
(global-set-key (kbd "<left-fringe> <double-mouse-1>") 'py-insert-debug)

;; Better rst support
(defun py-handle-rst-docs ()
  "Handle rst docs nicely."
  (auto-fill-mode t))
(add-hook 'rst-mode #'py-handle-rst-docs)

;; Fix auto-save support for tramp
(setq tramp-auto-save-directory "/tmp")

; pylint support
(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
;;(add-hook 'python-mode-hook 'pylint-add-key-bindings)

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

Found at http://emacsredux.com/blog/2013/04/21/edit-files-as-root/

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(provide '.emacs-custom)
;;; .emacs-custom.el ends here

