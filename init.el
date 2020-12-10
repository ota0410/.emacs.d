;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-
;;repository
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))
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

;;do not create bakeup file
(setq make-backup-files t)

;;swap-buffer
(defun swap-buffers ()
  "Swapping buffers in two windows"
  (interactive)
  (let ((current-w (frame-selected-window))
	(current-b (window-buffer (frame-selected-window)))
	(other-w (get-lru-window))
	(other-b (window-buffer (get-lru-window))))
    (if (not (one-window-p))
	(progn
	  (select-window current-w)
	  (switch-to-buffer other-b)
	  (select-window other-w)
	  (switch-to-buffer current-b)
	  ))))
;;;swap-screenに倣ってf2/S-f2に割り当てる
(global-set-key [f2] 'swap-buffers-keep-focus)
(global-set-key [C-f2] 'swap-buffers)


;;use-packageをrequire の代わりに使う
(if (require 'use-package nil t)
    (setq use-package-verbose t)
  (message "Use-package is unavailable!")
  (defmacro use-package (&rest _args)))

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
(load "matlab")
;;(load "php-mode")
(load "cuda-mode")
;;(load "init-utility")
(put 'downcase-region 'disabled nil)
