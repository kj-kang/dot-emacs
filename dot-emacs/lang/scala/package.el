;;; package.el --- Lang / Scala
;;;
;;; Commentary:
;;;
;;; Code:

(setenv "PATH" (concat "~/.emacs.d/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.emacs.d/bin" exec-path))

(use-package scala-mode
  :ensure t
  :mode ("\\.\\(scala\\sbt\\)$" . scala-mode)
  :bind
  ("M-*" . pop-tag-mark)
  :hook
  (scala-mode . smartparens-mode)
  (scala-mode . company-mode)
  (scala-mode . (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace))))

(require 'smartparens-scala)

(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command
  :bind
  ("C-c C-c" . dot-emacs:run-scala)
  :config
  (defun dot-emacs:run-scala (&optional step)
    (interactive)
    (setq buffer "*sbt*<~/Projects/tutorials/scala-tutorials/>")
    (setq min (point-at-bol))
    (setq max (point-at-eol))
    (setq cmd (buffer-substring min max))
    (message cmd)
    (with-current-buffer buffer
      (insert cmd)
      (comint-send-input)))
  )

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
  (lsp-metals-treeview-enable nil)
  (setq lsp-metals-treeview-show-when-views-received nil))

;;; package.el ends here
