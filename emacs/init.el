;;; init.el --- Emacs Configuration -*- lexical-binding: t -*-
;;; Commentary:
;; This config start here

(defvar cfg--file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      file-name-handler-alist nil)

(defvar conf:cache-dir (concat user-emacs-directory "cache/"))
(unless (file-exists-p conf:cache-dir)
  (make-directory conf:cache-dir))

(setq nsm-settings-file (concat conf:cache-dir "network-security.data"))
(setq network-security-level 'high)


(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/"))
      package-archive-priorities '(("melpa" . 10)
                                   ("gnu" . 5)
                                   ("org" . 0)))

(defvar bootstrap-version)
(let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-check-for-modifications 'live)

(setq straight-enable-use-package-integration nil)

(straight-use-package 'el-patch)
(setq el-patch-enable-use-package-integration t)
;; avoid problems with files newer than their byte-compiled counterparts
;; it's better a lower startup than load an outdated and maybe bugged package
(setq load-prefer-newer t)
;; initialize the packages and create the packages list if not exists

(setq package-enable-at-startup nil
      package--init-file-ensured t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; install use-package if not exists
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package bind-key :ensure t)
(use-package diminish :ensure t)

(use-package package-utils
  :ensure t)

(use-package validate
  :ensure t)

(use-package async
  :defer t
  :ensure t
  :config (setq async-bytecomp-package-mode t))

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

(use-package literate-elisp
  :ensure t
  :config
  (literate-elisp-load (concat user-emacs-directory "README.org")))

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 16777216
      gc-cons-percentage 0.1
      file-name-handler-alist cfg--file-name-handler-alist)
    (message "Emacs ready in %s with %d garbage collections."
      (format "%.2f seconds"
        (float-time
          (time-subtract after-init-time before-init-time)))
      gcs-done)))
