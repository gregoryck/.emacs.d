(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)
(local-set-key (kbd "TAB") 'dabbrev-expand)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x b") 'helm-buffers-list)

(modify-syntax-entry ?_ "w")

(tool-bar-mode -1)

(setenv "PATH" (concat (getenv "PATH") 
                       ":"
                       (expand-file-name "~")
                       "/bin"))

(setq exec-path 
      (append exec-path (list (concat 
                               (expand-file-name "~")
                               "/bin"))))



(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'key-chord)
(key-chord-mode 1)

(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
(add-to-list 'load-path "~/.emacs.d/ghc-mod/elisp") ; only without ELPA/el-get
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

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


(define-key evil-normal-state-map (kbd "q") nil)
(define-key evil-normal-state-map (kbd "<up>") 'scroll-down)
(define-key evil-normal-state-map (kbd "<down>") 'scroll-up)
(define-key evil-normal-state-map (kbd "<left>") 'next-buffer)
(define-key evil-normal-state-map (kbd "<right>") 'previous-buffer)
(define-key evil-normal-state-map (kbd "zc") 'comment-region)
(define-key evil-normal-state-map (kbd "zv") 'uncomment-region)
(define-key evil-normal-state-map (kbd "{") 'shrink-window-horizontally)
(define-key evil-normal-state-map (kbd "}") 'enlarge-window-horizontally)
(define-key evil-normal-state-map (kbd "U") 'undo-tree-redo)
(define-key evil-normal-state-map (kbd "TT") 'find-tag-other-window) ;legacy
(define-key evil-normal-state-map (kbd "tt") 'icicle-find-tag)
(define-key evil-normal-state-map (kbd "ff") 'icicle-find-file-in-tags-table)
(define-key evil-normal-state-map (kbd "en") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "ep") 'flycheck-previous-error)
(define-key evil-insert-state-map (kbd "TAB") 'dabbrev-expand)
; and c-x u to enter visual redo tree

(set-face-attribute 'default nil :height 150)


(setq ring-bell-function 'ignore)

(add-to-list 'default-frame-alist '(font .  "DejaVu Sans Mono-11" ))
(set-face-attribute 'default t :font  "DejaVu Sans Mono-11")


(require 'color-theme)
;(color-theme-initialize)


;; Please set your themes directory to 'custom-theme-load-path
(add-to-list 'custom-theme-load-path
             (file-name-as-directory (concat 
                                      (expand-file-name "~")
                                      "/.emacs.d/replace-colortheme")))
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
 '(font-lock-comment-face ((t (:foreground "LightPink2")))))

(custom-set-faces '(font-lock-keyword-face ((t (:foreground "chocolate1")))))

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


; from
; http://stackoverflow.com/questions/5710334/how-can-i-get-mouse-selection-to-work-in-emacs-and-iterm2-on-mac
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e)) 
(setq mouse-sel-mode t)

(setq tramp-default-method "ssh")
;; (add-to-list 'load-path "~/.emacs.d/async")
;; (add-to-list 'load-path "~/.emacs.d/helm")
;; (require 'helm-config)

(add-hook 'python-mode-hook
          (function (lambda ()
                            (setq indent-tabs-mode nil
                                  tab-width 4))))


(add-hook 'python-mode-hook
          (lambda ()
            (setq electric-indent-chars (delq ?: electric-indent-chars))))


;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(global-set-key [C-f1] 'show-file-name)


(add-to-list 'load-path "/home/gkettler/.emacs.d/icicles")
(require 'icicles)
(icy-mode 1)

(column-number-mode 1)



(add-to-list 'load-path "/home/gkettler/.emacs.d/flycheck")
(require 'flycheck)
(add-to-list 'load-path "/home/gkettler/.emacs.d/flycheck-pyflakes")
(require 'flycheck-pyflakes)


(add-hook 'after-init-hook #'global-flycheck-mode)

(setq icicle-S-TAB-completion-methods-alist
      '(("scatter" . icicle-scatter-match)))
      
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(provide '.emacs)
;;; .emacs ends here
