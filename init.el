;; Turn off mouse interface early in startup to avoid momentary display

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

(set-frame-parameter nil 'background-mode 'dark)

(add-to-list 'custom-theme-load-path "~/.Emacs.d/themes/")
(load-theme 'solarized t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(frame-background-mode (quote dark))
 '(package-selected-packages (quote (xah-lookup ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun myorg-update-parent-cookie ()
  (when (equal major-mode 'org-mode)
    (save-excursion
      (ignore-errors
        (org-back-to-heading)
        (org-update-parent-todo-statistics)))))

(defadvice org-kill-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(defadvice kill-whole-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Save frame position and size on desktop
(desktop-save-mode 1)

;; Set default starting directory
(setq default-directory "/Users/wgehr/Box Sync/Working_Documents/")

;; Spell checker (Aspell)
(setq ispell-program-name "/opt/local/bin/aspell")

; Flyspell mode - underline misspelled words in real time
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(define-key org-mode-map "\M-q" 'toggle-truncate-lines)

;; `with-eval-after-load' macro was introduced in Emacs 24.x
;; In older Emacsen, you can do the same thing with `eval-after-load'
;; and '(progn ..) form.
(with-eval-after-load 'org       
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  (add-hook 'org-mode-hook #'visual-line-mode))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; Let me type over selected text or delete it with the delete key
(delete-selection-mode 1)

;; Add scripts directory to load-path
(add-to-list 'load-path  "~/.emacs.d/scripts/")

;; Enable org-mouse
(require 'org-mouse)

;; Visual Line Mode
(global-visual-line-mode 1)

; Org indent mode for numbers and bullets, etc.
(add-hook 'org-mode-hook 'org-indent-mode)

;; Set org-mode directories for agendas
(setq org-agenda-files (list "~/Box Sync/Working_Documents/Outlines/"
                             ))
