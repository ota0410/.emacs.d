;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-
(setq default-directory "~/")

;;display line number
(require 'linum)		;; Display the number of line in the left side.
(global-linum-mode t)      ;; Enable linum-mode by default
(setq linum-format "%3d ") ;; make rooms after the line number
(line-number-mode t)	   ;; Display the number in the bottom of bar
