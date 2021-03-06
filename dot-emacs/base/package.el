;;; package.el --- Base
;;;
;;; Commentary:
;;;
;;; Code:

;; 시작 메시지는 보여주지 않는다.
(setq inhibit-startup-message nil)

;; 한글 환경을 지정한다.
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(setenv "LANG" "ko_KR.UTF-8")
(setq system-time-locale "ko_KR.UTF-8")

;; Custom 설정은 별도의 파일에 저장한다.
(setq custom-file "~/.emacs.d/custom.el")

;; 파일 편집시 자동으로 저장한다.
(setq auto-save-default t)

;; 파일 편집시 백업 파일은 생성하지 않는다.
(setq make-backup-files nil)

;; 문법에 따라 글꼴을 강조한다.
(global-font-lock-mode t)

;; 커서가 위치한 라인을 강조한다.
(transient-mark-mode t)

;; 질문에 대한 답변을 짧게 한다.
(defalias 'yes-or-no-p 'y-or-n-p)

;; 탭은 스페이스 3칸을 사용한다.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 윈도우 환경을 사용하는 경우 메뉴바, 스크롤바와 툴바를 제거한다.
(when (window-system)
  (progn
    (menu-bar-mode -1)
    (scroll-bar-mode -1)
    (tool-bar-mode -1)))

;; brew 에서 제공하는 PATH 를 지정한다.
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/bin" exec-path))

(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa"        . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade"    . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org"          . "https://orgmode.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package desktop
  :ensure t
  :config
  (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
  (add-to-list 'desktop-modes-not-to-save 'dired-mode)
  (add-to-list 'desktop-modes-not-to-save 'helm-mode)
  (desktop-save-mode t))

(use-package smartparens
  :ensure t
  :bind
  (:map smartparens-mode-map
        ("C-M-f"         . sp-forward-sexp)
        ("C-M-b"         . sp-backward-sexp)
        ("M-<delete>"    . sp-unwrap-sexp)
        ("M-<backspace>" . sp-backward-unwrap-sexp)
        ("C-<right>"     . sp-forward-slurp-sexp)
        ("C-<left>"      . sp-forward-barf-sexp)
        ("C-M-<right>"   . sp-backward-slurp-sexp)
        ("C-M-<left>"    . sp-backward-barf-sexp))
  :config
  (require 'smartparens-config)
  (setq sp-show-pair-delay 0.2
        sp-show-pair-from-inside t))

(use-package projectile
  :ensure t
  :bind
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  :init
  (setq magit-auto-revert-mode t))

(use-package magit-gitflow
  :ensure t
  :init
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(use-package move-dup
  :ensure t
  :bind
  ("M-<up>"   . md/move-lines-up)
  ("M-<down>" . md/move-lines-down))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-solarized-light t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-minor-modes t)
  (setq doom-modeline-project-detection 'project)
  (doom-modeline-mode 1))

(use-package treemacs
  :ensure t
  :bind
  ("C-x t t" . treemacs)
  ("M-)"     . treemacs-select-window)
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;;; package.el ends here
