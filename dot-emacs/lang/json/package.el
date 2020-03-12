;;; package.el --- Lang / Json
;;;
;;; Commentary:
;;;
;;; Code:

(use-package json-mode
  :ensure t
  :mode ("\\.json$" . json-mode)
  :init
  (setq json-reformat:indent-width 2)
  (setq json-reformat:pretty-string? nil)
  (add-hook 'json-mode-hook
            (lambda ()
              (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
  (add-hook 'json-mode-hook #'smartparens-mode)
  (add-hook 'json-mode-hook #'flycheck-mode))

;;; package.el ends here
