;;; package.el --- Completion / Helm
;;;
;;; Commentary:
;;;
;;; Code:

(use-package helm
  :ensure t
  :bind
  ("M-x"     . helm-M-x)
  ("C-x b"   . helm-mini)
  ("C-x C-b" . helm-buffers-list)
  ("C-x C-f" . helm-find-files)
  ("C-x r b" . helm-filtered-bookmarks)
  ("C-c h"   . helm-command-prefix)
  :config
  (setq helm-split-window-inside-p t)
  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-scroll-amount 8)
  (setq helm-echo-input-in-header-line t)
  (setq helm-autoresize-mode t)
  (setq helm-autoresize-max-height 40)
  :init
  (require 'helm-config))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

;;; package.el ends here
