

(add-to-list 'load-path "~/.emacs.d")
(require 'key-chord)
(key-chord-mode 1)

(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
    (require 'evil)
    (evil-mode 1)
(key-chord-define evil-normal-state-map ";;" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ";;" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)
(key-chord-define evil-replace-state-map ";;" 'evil-normal-state)


(require 'package)
(add-to-list 'package-archives 
         '("melpa" . "http://melpa-stable.milkbox.net/packages/"))
(package-initialize)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(setq ghc-module-command "/Users/gkettler/Library/Haskell/bin/ghc-mod")
(setq ghc-check-command "/Users/gkettler/Library/Haskell/bin/ghc-mod check")
(setq ghc-interactive-command "/Users/gkettler/Library/Haskell/bin/ghc-modi")

(setenv "PATH" (concat (getenv "PATH") ":/Users/gkettler/bin"))
(setq exec-path (append exec-path '("/Users/gkettler/bin")))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


(define-key evil-normal-state-map (kbd "q") nil)
(global-unset-key (kbd "<up>"))
(define-key evil-normal-state-map (kbd "<up>") 'scroll-down)
(define-key evil-normal-state-map (kbd "<down>") 'scroll-up)
(define-key evil-normal-state-map (kbd "<left>") 'next-buffer)
(define-key evil-normal-state-map (kbd "<right>") 'previous-buffer)
(define-key evil-normal-state-map (kbd "C-/") 'comment-region)
(define-key evil-normal-state-map (kbd "C-?") 'uncomment-region)
(define-key evil-normal-state-map (kbd "{") 'shrink-window-horizontally)
(define-key evil-normal-state-map (kbd "}") 'enlarge-window-horizontally)

(set-face-attribute 'default nil :height 150)


(setq ring-bell-function 'ignore)

(add-to-list 'default-frame-alist '(font .  "DejaVu Sans Mono-14" ))
(set-face-attribute 'default t :font  "DejaVu Sans Mono-14")


(require 'color-theme)
;(color-theme-initialize)


;; Please set your themes directory to 'custom-theme-load-path
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "/Users/gkettler/.emacs.d/replace-colortheme"))
;(load-theme 'taylor-theme t t)
;(enable-theme 'taylor-theme)
;(color-theme-taylor)

(load-theme 'spacegray t)

 (desktop-save-mode 1)

(key-chord-define evil-normal-state-map "??" 'ghc-display-errors)


(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
    
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
