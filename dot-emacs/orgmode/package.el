;;; package.el --- Org mode
;;;
;;; Commentary:
;;;
;;; Code:

(use-package org
  :ensure t
  :bind
  ("C-c a" . org-agenda)
  ("C-c b" . org-switchb)
  ("C-c c" . org-capture)
  ("C-c l" . org-store-link)
  :config
  (setq org-todo-keywords
	'((sequence "TODO(t)" "WAIT(w@/!)" "STARTED(s)" "|" "DONE(d)" "CANCELLED(c@)")))
  (setq org-agenda-files
	'("~/.org/inbox.org"
	  "~/.org/home.org"
	  "~/.org/works.org"
	  "~/.org/study.org"
	  "~/.org/kakao-data.org")))

;;; package.el ends here
