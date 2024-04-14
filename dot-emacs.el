;;; dot-emacs.el -- My Emacs Configuration
;;;
;;; Commentary:
;;;
;;; Code:

;;;
;;;
;;;

(setq inhibit-startup-message nil)
(setq delete-by-moving-to-trash t)
(setq custom-file (concat (file-name-as-directory user-emacs-directory) "custom.el"))
(defalias 'yes-or-no-p 'y-or-n-p)


;;;
;;; 편집 버퍼 환경을 설정한다.
;;;

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq visible-bell t)
(global-auto-revert-mode t)
(global-font-lock-mode t)
(global-hl-line-mode t)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)

(setq-default fill-column 80)


;;;
;;; 한국어 환경을 설정한다. 인코딩은 ko_KR.utf-8 로 지정한다.
;;;

(set-language-environment "Korean")
(set-locale-environment "ko_KR.utf-8")
(prefer-coding-system 'utf-8)


;;;
;;; 윈도우 환경에서 사용하는 경우 메뉴바, 툴바, 스크롤바는 제거한다.
;;;

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))


;;;
;;; fixed-font
;;;
;;
;; 고정폭 한글 글꼴과 영문 글꼴을 같이 사용할 수 있도록 한다.
;;
;; | 한글 | 테스트 |
;; | ABCD | TEST   |
;;

(unless (package-installed-p 'fixed-font)
  (package-vc-install "https://github.com/kj-kang/fixed-font"))

(use-package fixed-font
  :ensure t
  :if window-system
  :bind
  ("C-0" . fixed-font-default)
  ("C-+" . fixed-font-increase)
  ("C--" . fixed-font-decrease)
  :config
  (when (string= "10b-server" (system-name))
    (setq fixed-font-hangul-font "NanumGothicCoding")
    (setq fixed-font-ascii-font  "Fira Mono")
    (setq fixed-font-default-height 160))
  (when (string= "10B-NOTE" (system-name))
    (setq fixed-font-hangul-font "나눔고딕코딩")
    (setq fixed-font-ascii-font  "Source Code Pro")
    (setq fixed-font-default-height 100))
  :init
  (fixed-font-default))


;;;
;;;
;;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;;;
;;; use-package
;;;

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;;
;;; desktop
;;;

(use-package desktop
  :ensure nil
  :config
  (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
  (add-to-list 'desktop-modes-not-to-save 'dirs-mode)
  (add-to-list 'desktop-modes-not-to-save 'dired-mode)
  (desktop-save-mode t))

;;;
;;; theme
;;;

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (load-theme 'doom-one t))

;;;
;;; modeline ¼³Á¤
;;;

(use-package spaceline
  :ensure t
  :config
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode))

;;;
;;; company
;;;

(use-package company
  :ensure t
  :bind
  (:map company-active-map
  ("C-n" . company-select-next)
  ("C-p" . company-sleect-previous))
  :custom
  (company-idle-delay 0))

;;;
;;; move-text
;;;

(use-package move-text
  :ensure t
  :bind
  ("M-<up>" . move-text-up)
  ("M-<down>" . move-text-down))


;;;
;;; visual-fill-column
;;;

(unless (package-installed-p 'visual-fill-column)
  (package-vc-install "https://codeberg.org/joostkremers/visual-fill-column.git"))

(use-package visual-fill-column
  :ensure t)

;;;
;;; whitespace-cleanup-mode
;;;

(use-package whitespace-cleanup-mode
  :ensure t)


;;;
;;; magit
;;;

(use-package magit
  :ensure t)

;;
;; magit-gitflow
;;

(use-package magit-gitflow
  :ensure t)

;;;
;;; flycheck
;;;

(use-package flycheck
  :ensure t)

;;;
;;; projectile
;;;

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (projectile-mode))


;;;
;;; helm
;;;

(use-package helm
  :ensure t
  :bind
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-mini)
  ("M-x" . helm-M-x)
  :custom
  (helm-split-window-inside-p t)
  (helm-move-to-line-cycle-in-source t)
  (helm-scroll-amount 10))


;;;
;;; helm-projectile
;;;

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))


;;;
;;; org
;;;

(use-package org
  :ensure t
  :bind
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  ("C-c l" . org-store-links)
  :custom
  (org-agenda-files
   '("~/Writings/org/todo.org"))
  :config
  (require 'ox-md))

;;;
;;; markdown
;;;

(use-package markdown-mode
  :ensure t)

;;;
;;; for lisp
;;;

(use-package elisp-mode
  :ensure nil
  :bind
  (:map emacs-lisp-mode-map
  ("C-c C-b" . eval-buffer))
  :hook
  (emacs-lisp-mode . company-mode)
  (emacs-lisp-mode . display-line-numbers-mode)
  (emacs-lisp-mode . flycheck-mode)
  (emacs-lisp-mode . whitespace-cleanup-mode)
  (emacs-lisp-mode . show-paren-mode))


;;;
;;; for AutoHotKey
;;; https://github.com/punassuming/ahk-mode
;;;

(use-package ahk-mode
  :ensure t
  :if (eq system-type 'windows-nt)
  :mode "\\.ahk\\'"
  :hook
  (ahk-mode . company-mode)
  (ahk-mode . display-line-numbers-mode)
  (ahk-mode . whitespace-cleanup-mode))

;;
;; for JSON
;;

(use-package json-mode
  :ensure t
  :custom
  (js-indent-level 2)
  :hook
  (json-mode . display-line-numbers-mode)
  (json-mode . flycheck-mode)
  (json-mode . show-paren-mode)
  (json-mode . whitespace-cleanup-mode))


;;
;; for Typescript, Javascript
;;

(use-package tide
  :ensure t
  :pin melpa
  :bind
  (:map tide-mode-map
        ("C-c d" . tide-documentation-at-point)
        ("C-c f" . tide-fix))
  :custom
  (tide-format-options '(:indentSize 2 :tabSize 2)))

(use-package typescript-mode
  :ensure t
  :mode ("\\.js\\'" "\\.jsx\\'" "\\.ts\\'" "\\.tsx\\'")
  :hook
  (typescript-mode . company-mode)
  (typescript-mode . display-line-numbers-mode)
  (typescript-mode . flycheck-mode)
  (typescript-mode . show-paren-mode)
  (typescript-mode . whitespace-cleanup-mode)
  :custom
  (typescript-indent-level 2))

;;
;; for Web (html, jsx, tsx, ...)
;;

(use-package web-mode
  :ensure t
  :pin melpa
  :mode ("\\.jsx\\'" "\\.ts\\'" "\\.tsx\\'" "\\.html\\'")
  :hook
  (web-mode . (lambda ()
                (when (member (file-name-extension buffer-file-name) '("jsx" "ts" "tsx"))
                  (tide-setup))))
  (web-mode . company-mode)
  (web-mode . display-line-numbers-mode)
  (web-mode . flycheck-mode)
  (web-mode . show-paren-mode)
  (web-mode . whitespace-cleanup-mode)
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-block-padding 2)
  (web-mode-comment-style 2)
  (web-mode-enable-css-colorization t)
  (web-mode-enable-auto-closing t)
  (web-mode-enable-current-element-highlight t)
  (web-mode-enable-auto-closing t))

;; Local Variabels:
;;
;; End:
;;; dot-emacs.el ends here
