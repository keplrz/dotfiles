;;; emacs-init.el --- Emacs init file
;;; Commentary:
;;; Code:

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")))
(setq backup-by-copying t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 2)
(setq delete-old-versions t)

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)
(if (file-exists-p abbrev-file-name) (quitely-read-abbrev-file))

(setq browse-url-browser-function 'browse-url-chromium)
(setq show-trailing-whitespace t)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(when (and (fboundp 'winner-mode) (not winner-mode))
  (winner-mode 'toggle))

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize)

(require 'ido)
(ido-mode t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-c r") 'recentf-open-files)

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-c C-b") 'ibuffer)

;;; emacs-init.el ends here
