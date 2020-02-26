;;; package.el --- Lang / Javascript
;;;
;;; Commentary:
;;;
;;; Code:

(use-package js2-mode
  :ensure t
  :mode "\\.js")


(defun javascript-jsx-file-p ()
  "Detect React in the file."
  (and buffer-file-name
       (string= (file-name-extension buffer-file-name) "js")
       (re-search-forward "\\(^\\import React\\)" magic-mode-regexp-match-limit t)
       (progn (goto-char (match-beginning 1))
              (not (sp-point-in-string-or-comment)))))

(use-package rjsx-mode
  :ensure t
  :init
  (add-to-list 'magic-mode-alist '(javascript-jsx-file-p . rjsx-mode))
  (add-hook 'rjsx-mode-hook
            (lambda ()
              (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
  (add-hook 'rjax-mode-hook #'smartparens-mode))

(use-package tide
  :ensure t
  :bind
  ("M-*" . pop-tag-mark)
  :hook
  ((type-script-mode . tide-setup)))

;;; package.el ends here
