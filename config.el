(tool-bar-mode -1)
(set-language-environment "UTF-8")

; Put backups if backup folder defined, otherwise do not make backups
(if backup-file-dir
    (setq backup-directory-alist `(("." . ,backup-file-dir)))
    (setq make-backup-files nil))

(use-package undo-tree
  :ensure t
  :defer nil
  :config
  (progn
    (global-undo-tree-mode)
    (if backup-file-dir
      (setq undo-tree-history-directory-alist `(("." . ,backup-file-dir)))
      (setq undo-tree-auto-save-history nil))))

;; Load evil
(use-package evil
	     :ensure t
	     :defer nil
	     :config
	     (evil-mode 1)
	     (evil-set-undo-system 'undo-tree))

(use-package company
  :ensure t
  :config (global-company-mode))

;(use-package corfu
;  :ensure t
;  :custom
;  (corfu-auto t))

(use-package lsp-mode :ensure t)

(use-package dired
  :config
  (define-key dired-mode-map [mouse-2] 'dired-mouse-find-file))

(use-package ada-mode :ensure t)
(use-package elixir-mode :ensure t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

(setq ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;(setq-default electric-indent-inhibit t)

; Stop Dired from spamming new buffers
(put 'dired-find-alternate-file 'disabled nil)

(defun disable-paren-highlight ()
  (show-paren-mode -1))

(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'shell-mode-hook 'disable-paren-highlight)
