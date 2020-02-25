;;; package.el --- Language / Emacs Lisp
;;;
;;; Commentary:
;;;
;;; Code:

(add-hook 'emacs-lisp-mode-hook #'company-mode)
(add-hook 'emacs-lisp-mode-hook #'display-line-numbers-mode)
(add-hook 'emacs-lisp-mode-hook #'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)

;;; package.el ends here
