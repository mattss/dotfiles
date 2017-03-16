;;; package -- Matt Sital-Singh's custom emacs setup
;;;
;;; Commentary:
;;; Integrates with netsight-emacs.
;;

(setq visible-bell 1)

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

;; https://github.com/editorconfig/editorconfig-emacs
(require 'editorconfig)
(editorconfig-mode 1)

;; emmet a.k.a zencoding
;; https://github.com/smihica/emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes

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

;;; tide setup
;;; https://github.com/ananthakumaran/tide/blob/master/README.md
(require 'tide)

(defun setup-tide-mode ()
  "Set up tide mode."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1))

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
;;; end tide setup

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

(provide '.emacs-custom)
;;; .emacs-custom.el ends here
