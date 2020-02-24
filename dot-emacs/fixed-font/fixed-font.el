;;; fixed-font.el --- 고정폭 글꼴 설정
;;;
;;; Commentary:
;;;
;;; | 한글 | 한글 |
;;; | ABCD | ABCD |
;;;
;;; Code:


(defvar fixed-font-ascii-font "Envy Code R")

(defvar fixed-font-hangul-font "D2Coding")

(defvar fixed-font-default-height 140)

(defvar fixed-font-rescale-alist
  (list
   `("Envy Code R" "D2Coding" 100 1.00)
   `("Envy Code R" "D2Coding" 110 1.10)
   `("Envy Code R" "D2Coding" 120 1.00)
   `("Envy Code R" "D2Coding" 130 1.10)
   `("Envy Code R" "D2Coding" 140 1.15)
   `("Envy Code R" "D2Coding" 150 1.10)
   `("Envy Code R" "D2Coding" 160 1.15)
   `("Envy Code R" "D2Coding" 170 1.10)
   `("Envy Code R" "D2Coding" 180 1.15)
   `("Envy Code R" "D2Coding" 190 1.10)
   `("Envy Code R" "D2Coding" 200 1.10)
   `("Envy Code R" "D2Coding" 200 1.10)
   `("Source Code Pro" "D2Coding" 100 1.20)
   `("Source Code Pro" "D2Coding" 110 1.30)
   `("Source Code Pro" "D2Coding" 120 1.20)
   `("Source Code Pro" "D2Coding" 130 1.30)
   `("Source Code Pro" "D2Coding" 140 1.15)
   `("Source Code Pro" "D2Coding" 150 1.20)
   `("Source Code Pro" "D2Coding" 160 1.25)
   `("Source Code Pro" "D2Coding" 170 1.20)
   `("Source Code Pro" "D2Coding" 180 1.25)
   `("Source Code Pro" "D2Coding" 190 1.20)
   `("Source Code Pro" "D2Coding" 200 1.20)
   `("Source Code Pro" "D2Coding" 200 1.10)
   ))

(defun fixed-font--get-rescale (ascii hangul height)
  "ASCII HANGUL HEIGHT."
  (let ((matched
	 (seq-filter
	  (lambda (alist)
	    (and (string= ascii  (car alist))
		 (string= hangul (car (cdr alist)))
		 (eq      height (car (cdr (cdr alist))))))
	  fixed-font-rescale-alist)))
    (if (> (length matched) 0)
	(car (cdr (cdr (cdr (car matched)))))
      -1)))

(defun fixed-font--set-height (height)
  "HEIGHT."
  (let ((rescale (fixed-font--get-rescale fixed-font-ascii-font fixed-font-hangul-font height)))
    (if (> rescale 0)
	(progn
	  (message "ascii: %s, hangul: %s, height: %d, scale: %.2f" fixed-font-ascii-font fixed-font-hangul-font height rescale)
	  (set-face-attribute 'default nil :family fixed-font-ascii-font)
	  (set-fontset-font t 'hangul (font-spec :family fixed-font-hangul-font))
	  (setq face-font-rescale-alist `((,fixed-font-hangul-font . ,rescale)))
	  (set-face-attribute 'default nil :height height))
      (message "Can't find rescale - ascii: %s, hangul: %s, height: %d, scale: %.2f" fixed-font-ascii-font fixed-font-hangul-font height rescale))))

;;;###autoload
(defun fixed-font-set-height-default ()
  "."
  (interactive)
  (fixed-font--set-height fixed-font-default-height))

;;;###autoload
(defun fixed-font-increase-height ()
  "."
  (interactive)
  (let ((height (+ (face-attribute 'default :height) 10)))
    (fixed-font--set-height height)))

;;;###autoload
(defun fixed-font-decrease-height ()
  "."
  (interactive)
  (let ((height (- (face-attribute 'default :height) 10)))
    (fixed-font--set-height height)))

(provide 'fixed-font)
;;; fixed-font.el ends here
