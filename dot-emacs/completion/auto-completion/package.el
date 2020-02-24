;;; package.el --- Completion / Auto Completion
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package company
  :ensure t
  :bind
  (:map company-active-map
	("C-n" . company-select-next)
	("C-p" . company-select-previous))
  :init
  (progn
    (setq company-idle-delay 0.2
	  company-minimum-prefix-length 2)))

;;; package.el ends here

