;;; package.el --- Lang / Scala
;;;
;;; Commentary:
;;;
;;; Code:

(setenv "PATH" (concat "~/.emacs.d/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.emacs.d/bin" exec-path))

(use-package scala-mode
  :ensure t
  :mode "\\.\\(scala\\sbt\\)$"
  :bind
  ("M-*" . pop-tag-mark))

(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command)

(use-package lsp-mode
  :ensure t
  :hook
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t)

(use-package company-lsp
  :ensure t)

(use-package posframe
  :ensure t)

(use-package dap-mode
  :ensure t
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

(use-package lsp-treemacs
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))

;;; package.el ends here
