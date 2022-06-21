; Put backups if backup folder defined, otherwise do not make backups
(if backup-file-dir
    (setq backup-directory-alist `(("." . ,backup-file-dir)))
    (setq make-backup-files nil))

;; Load evil
(use-package evil
	     :ensure t
	     :defer nil
	     :init
	     :config
	     (evil-mode 1))
