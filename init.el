;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

;; - install the package by the following steps ;;
;;     1. M-x package-list-packages
;;     2. Check the list of package registerd in some repos.
;;     3. Add "I" flag to the package you want to install.
;;     4. Press "x" to install packages you selected.
;;
;;
;; - init.el is built by the following command ;;
;;      emacs --batch -f batch-byte-compile init.el
;;   This helps launch of emacs rapid a little.

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
(setq make-backup-files nil)
;;set bg color
(set-face-background 'default "#303030")
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
(load "init-global") 
(load "markdown-mode")
(load "matlab")
(load "cuda-mode")
(load "go-mode")
(load "yaml-mode")

(put 'downcase-region 'disabled nil)
;;; package.el (repolist)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives  '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(markdown-mode leaf-tree leaf-convert hydra gptel el-get blackout)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Install the gptel and give API Key as a environment variable.
(use-package gptel
  :ensure t
  :config
  (setq gptel-api-key (getenv "OPENAI_API_KEY")))
