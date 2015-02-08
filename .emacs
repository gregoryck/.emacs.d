(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'key-chord)
(key-chord-mode 1)

(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
    (require 'evil)
    (evil-mode 1)
(key-chord-define evil-normal-state-map ";;" 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ";;" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)
(key-chord-define evil-replace-state-map ";;" 'evil-normal-state)
(key-chord-define evil-normal-state-map "zx" 'execute-extended-command)


(require 'package)
(add-to-list 'package-archives 
         '("melpa" . "http://melpa-stable.milkbox.net/packages/"))
(package-initialize)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(setq ghc-module-command "ghc-mod")
(setq ghc-check-command "ghc-mod check")
(setq ghc-interactive-command "ghc-modi")

(setenv "PATH" (concat (getenv "PATH") ":/home/vagrant/bin"))
(setq exec-path (append exec-path '("/home/vagrant/bin")))

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
(define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)
(define-key evil-normal-state-map (kbd "tt") 'find-tag-other-window)
(define-key evil-normal-state-map (kbd "") 'find-tag-other-window)
; and c-x u to enter visual redo tree

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

(global-undo-tree-mode)

;; (mc/execute-command-for-all-fake-cursors 'backward-char)
;; (mc/execute-command-for-all-fake-cursors 'evil-delete)
;; (mc/execute-command-for-all-fake-cursors 'evil-forward-char)
;; (mc/execute-command-for-all-fake-cursors 'evil-backward-char)
;; (mc/execute-command-for-all-fake-cursors ')
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "LightPink3")))))

(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)


;; (global-set-key (kbd "<backspace>") 'ignore)

; esca quites dammit
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(setq tramp-default-method "ssh")
