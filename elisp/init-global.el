;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-
(setq default-directory "~/")

(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) 

;;display line number
(global-linum-mode t)
(setq linum-format "%3d  ")
(custom-set-faces
 '(linum ((t (:inherit(shadow default))))))

(keyboard-translate ?\C-h ?\C-?)
