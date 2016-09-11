
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

; ctrl-u for vim instead of emacs repeat
(setq evil-want-C-u-scroll t)

; Enable evil mode
(evil-mode 1)

(helm-mode 1)

(defun reload-user-init-file()
  (interactive)
  (load-file user-init-file))

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

; Set backup directory
(setq backup-directory-alist `(("." . "~/.saves")))


; Show line number
(setq linum-format "%d  ")
(setq-default left-fringe-width  10)
(setq-default right-fringe-width  0)
(set-face-attribute 'fringe nil :background "black")

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
 '(custom-safe-themes
   (quote
    ("c697b65591ba1fdda42fae093563867a95046466285459bd4e686dc95a819310" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "bf4226951ab37488d5631f2fc15416a557ea41a4629ff63a257ee7dcdf3f2fb9" "b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" default)))
 '(package-selected-packages
   (quote
    (nlinum-relative linum-relative atom-dark-theme relative-line-numbers darcula-theme helm web-mode web projectile pallet material-theme magit git-gutter+ flymake-php flymake-coffee evil elixir-mode color-theme-sanityinc-tomorrow circe auto-complete-auctex ac-php))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'tsdh-dark t)
