(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

; ctrl-u for vim instead of emacs repeat
(setq evil-want-C-u-scroll t)

; Enable evil mode
(evil-mode 1)

; Backup file in ~/.saves
(setq backup-directory-alist `(("." . "~/.emacs.d/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;php mode for php file
(eval-after-load 'php-mode
  '(require 'php-ext))
(add-hook 'php-mode-hook
	  '(lambda ()
	     (auto-complete-mode t)
	     (require 'ac-php)
	     (setq ac-sources  '(ac-source-php ) )
	     (yas-global-mode 1)
	     (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
	     (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
	     ))

; Hide menue
(menu-bar-mode -1)

; Remove Welcome screen
(setq inhibit-startup-message t)

; Set Font
(set-frame-font "Fira Code-11")

; Hide Menu and Scroll
(when (window-system)
(scroll-bar-mode -1)
(tool-bar-mode -1))

;Yes or No alias
(defalias 'yes-or-no-p 'y-or-n-p)

(projectile-global-mode)

; Show line number
(global-linum-mode 1)
(setq linum-format "%2d \u2502 ")

;Git Gutter +
(global-git-gutter+-mode)

; Support for unicode character for terminal
(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

;; terminal short cut
(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
       (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
   (switch-to-buffer-other-window "*ansi-term*")))
(global-set-key (kbd "C-c t") 'visit-term-buffer)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
