;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-
(setq default-directory "~/")

;;display line number
(global-linum-mode t)
(setq linum-format "%3d  ")
(custom-set-faces
 '(linum ((t (:inherit(shadow default))))))

(keyboard-translate ?\C-h ?\C-?)
