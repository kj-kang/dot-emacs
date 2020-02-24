;;; package.el --- Checkers
;;;
;;; Commentary:
;;;
;;; Code:

(use-package flycheck
  :ensure t
  :init
  (progn

    (setq flycheck-global-modes nil)

    (when (fboundp 'define-fringe-bitmap)
      (define-fringe-bitmap 'my-flycheck-fringe-indicator
          (vector #b00000000
                  #b00000000
                  #b00000000
                  #b00000000
                  #b00000000
                  #b00000000
                  #b00000000
                  #b00011100
                  #b00111110
                  #b00111110
                  #b00111110
                  #b00011100
                  #b00000000
                  #b00000000
                  #b00000000
                  #b00000000
                  #b00000000)))

    (let ((bitmap 'my-flycheck-fringe-indicator))
      (flycheck-define-error-level 'error
	:serverity 2
	:overlay-category 'flycheck-error-overlay
	:fringe-bitmap bitmap
	:fringe-face 'flycheck-fringe-error)
      (flycheck-define-error-level 'warning
 	:serverity 1
	:overlay-category 'flycheck-warning-overlay
	:fringe-bitmap bitmap
	:fringe-face 'flycheck-fringe-warning)
      (flycheck-define-error-level 'info
 	:serverity 1
	:overlay-category 'flycheck-info-overlay
	:fringe-bitmap bitmap
	:fringe-face 'flycheck-fringe-info))))

(use-package flycheck-pos-tip
  :ensure t
  :if (not window-system)
  :init
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode)))

;;; package.el ends here
