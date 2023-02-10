;; Keyboard-centric user interface
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

(recentf-mode 1)

(setq history-length 25)
(savehist-mode 1)

(save-place-mode 1)

(setq use-dailog-box nil)

(setq global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers 1)


(load-theme 'modus-vivendi t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-completing-read+

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    multi-term))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq dired-listing-switches "-alFh")

(set-face-attribute 'default nil :height 150)


(add-to-list 'load-path "~/.emacs.d/customizations")
(load "bindings.el")
(load "navigation.el")
(load "clojure.el")
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (seq-filter (lambda (font)					            ;;
;;               (when-let ((info (font-info font)))		  ;;
;;                 (string-match-p "spacing=100" (aref info 1)))) ;;
;;             (font-family-list))				  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

  ;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

(setq backup-directory-alist `(("." . "~/.saves")))

(setq global-display-line-numbers-mode t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cider-default-cljs-repl 'shadow))

;(load "server")
;(unless (server-running-p) (server-start))
