;;; package.el --- Fixed Fonts
;;;
;;; Commentary:
;;;
;;; Code:

(use-package fixed-font
  :load-path "~/.emacs.d/dot-emacs/fixed-font/"
  :bind
  ("s-0" . fixed-font-set-height-default)
  ("s-=" . fixed-font-increase-height)
  ("s--" . fixed-font-decrease-height)
  :init
  (setq fixed-font-ascii-font "Source Code Pro")
  (setq fixed-font-hangul-font "D2Coding")
  (setq fixed-font-default-height 130)
  (fixed-font-set-height-default))

;;; package.el ends here
