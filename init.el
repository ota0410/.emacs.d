;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-
;;add load-path
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
;;add load path "elisp" "conf"
(add-to-load-path "elisp")

;;use-packageをrequire の代わりに使う
(if (require 'use-package nil t)
    (setq use-package-verbose t)
  (message "Use-package is unavailable!")
  (defmacro use-package (&rest _args)))

;(require 'wb-line-number)
;(wb-line-number-toggle)

;;ignore sounds
(setq ring-bell-function 'ignore)

;;define key bind
(define-key global-map (kbd "C-l") 'linum-mode)
(define-key global-map (kbd "C-e") 'end-of-buffer)
(define-key global-map (kbd "M-w") 'copy-region-as-kill)
(define-key global-map (kbd "C-w") 'kill-region)
(define-key global-map (kbd "C-u") 'undo)
(define-key global-map (kbd "C-t") 'beginning-of-buffer)

;;load modes
(load "init-global") ;;共通の設定を記述
(load "markdown-mode")
;;(load "cuda-mode")
;;(load "init-utility")
