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

;;
;;use-packageをrequire の代わりに使う
(if (require 'use-package nil t)
    (setq use-package-verbose t)
  (message "Use-package is unavailable!")
  (defmacro use-package (&rest _args)))

;;add matlab_mode

;;ignore sounds
(setq ring-bell-function 'ignore)

;;define key bind
(define-key global-map (kbd "C-l") 'linum-mode)
(define-key global-map (kbd "C-e") 'end-of-buffer)
(define-key global-map (kbd "M-w") 'copy-region-as-kill)
(define-key global-map (kbd "C-w") 'kill-region)
(define-key global-map (kbd "C-u") 'undo )
(define-key global-map (kbd "C-t") 'beginning-of-buffer)


;;completion
(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-auto-expand t) ;; 1個目を自動的に補完
(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
(setq company-idle-delay 0) ; 遅延なしにすぐ表示
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の最後の次は先頭に戻る
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(global-set-key (kbd "M-S-i") 'company-complete)

;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map (kbd "C-h") nil) ;; C-hはバックスペース割当のため無効化
(define-key company-active-map (kbd "C-S-h") 'company-show-doc-buffer) ;; ドキュメント表示はC-S
  
;;load modes
(load "init-global") ;;共通の設定を記述
(load "markdown-mode")
(load "matlab")
;(load "cuda-mode")
;;(load "init-utility")
