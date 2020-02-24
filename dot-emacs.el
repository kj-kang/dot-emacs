;;; dot-emacs.el --- kukjin's .emacs

;; Author: Kukjin Kang <kj.kang@daum.net>
;; Maintainer: Kukjin Kang <kj.kang@daum.net>
;; URL: http://github.com/kj-kang/my-dot-emacs

;;; Commentary:

;;; Code:

;; 사용자 이름과 이메일주소를 지정한다.
(setq user-full-name "Kukjin Kang")
(setq user-mail-address "kj.kang@daum.net")

;; 설정에 필요한 파일을 로드한다.
(load "~/.emacs.d/dot-emacs/base/package.el")
(load "~/.emacs.d/dot-emacs/fixed-font/package.el")
(load "~/.emacs.d/dot-emacs/checker/package.el")
(load "~/.emacs.d/dot-emacs/completion/auto-completion/package.el")
(load "~/.emacs.d/dot-emacs/lang/emacs-lisp/package.el")
(load "~/.emacs.d/dot-emacs/orgmode/package.el")

;;; dot-emacs.el ends here
