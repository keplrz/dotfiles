;;; emacs-init.el --- Emacs init file
;;; Commentary:
;;; Code:

(set-face-attribute 'default nil :height 120)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")))
(setq backup-by-copying t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 2)
(setq delete-old-versions t)

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)
(if (file-exists-p abbrev-file-name) (quietly-read-abbrev-file))

(setq browse-url-browser-function 'browse-url-chromium)
(setq show-trailing-whitespace t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(column-number-mode 1)

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

(if (require 'auto-complete nil 'noerror)
    (progn
      (global-auto-complete-mode t)
      (ac-flyspell-workaround)))

(when (package-installed-p 'flycheck)
  (add-hook 'after-init-hook #'global-flycheck-mode))
(when (package-installed-p 'flycheck-color-mode-line)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(when (package-installed-p 'magit)
  (progn
    (global-set-key (kbd "C-c g u") 'magit-diff-unstaged)
    (global-set-key (kbd "C-c g d") 'magit-diff-staged)
    (global-set-key (kbd "C-c g s") 'magit-status)))

(when (package-installed-p 'multiple-cursors)
  (progn
    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
    (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)))

(if (require 'projectile nil 'noerror)
    (projectile-global-mode))

(if (require 'rainbow-delimiters nil 'noerror)
    (global-rainbow-delimiters-mode))

(when (package-installed-p 'solarized-theme)
  (load-theme 'solarized-dark t))

(when (package-installed-p 'web-mode)
  (progn
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))))

(defun my-insert-date-time ()
  "Insert current date/time string in full ISO 8601 format."
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end)))
  (insert (concat
	   (format-time-string "%Y-%m-%dT%T")
	   ((lambda (x) (concat (substring x 0 3) ":" (substring x 3 5)))
	    (format-time-string "%z")))))

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-c C-b") 'ibuffer)
(global-set-key (kbd "C-c i d") 'my-insert-date-time)

;;; emacs-init.el ends here
