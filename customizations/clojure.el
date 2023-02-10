;;;;
;; Clojure
;;;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; (put-clojure-indent 'ui-accordion 1)
;; (put-clojure-indent 'ui-accordion-panel 1)
;; (put-clojure-indent 'ui-accordion-title 1)
;; (put-clojure-indent 'ui-accordion-content 1)

(defun symbol-append (&rest symbols) 
  (intern (apply #'concatenate 'string 
                 (mapcar #'symbol-name symbols))))

(defun replicate-with-prefix (input-list input-symbol)
  (append input-list (mapcar (lambda (x) (symbol-append input-symbol x)) input-list)))

(defvar cutom-indent-dom-patterns
  '(h1 h2 h3 h4 span button
       svg path div label form a p nav ul li aside section))

(defvar custom-indent-flowbite-patterns
  '(ui-accordion ui-accordion-panel ui-accordion-title ui-accordion-content
                 ui-card ui-navbar ui-navbar-brand ui-dropdown ui-dark-theme-toggle
                 ui-dropdown-header ui-dropdown-divider ui-dropdown-item
                 ui-list-group ui-list-group-item ui-button ui-dropdown
                 ui-table ui-table-head ui-table-body ui-table-row ui-table-cell
                 ui-timeline ui-timeline-item ui-timeline-body ui-timeline-point
                 ui-rating ui-rating-star
                 ui-breadcrumb ui-breadcrumb-item
                 ui-button-group ui-flowbite))

(defvar custom-indent-blueprint-patterns
  '(ui-modal))

(defvar custom-indent-fulcro-patterns
  '(action))

(defvar custom-indent-patterns
  (append (replicate-with-prefix cutom-indent-dom-patterns 'dom/)
          (replicate-with-prefix custom-indent-flowbite-patterns 'f/)
          (replicate-with-prefix custom-indent-blueprint-patterns 'bp/)
          custom-indent-fulcro-patterns))

(dolist (p custom-indent-patterns)
  (put-clojure-indent p 1))




















;; ;; syntax hilighting for midje
;; (add-hook 'clojure-mode-hook
;;           (lambda ()
;;             (setq inferior-lisp-program "lein repl")
;;             (font-lock-add-keywords
;;              nil
;;              '(("(\\(facts?\\)"
;;                 (1 font-lock-keyword-face))
;;                ("(\\(background?\\)"
;;                 (1 font-lock-keyword-face))))
;;             (define-clojure-indent (fact 1))
;;             (define-clojure-indent (facts 1))
;;             (rainbow-delimiters-mode)))

;; ;;;;
;; ;; Cider
;; ;;;;

;; ;; provides minibuffer documentation for the code you're typing into the repl
;; (add-hook 'cider-mode-hook 'eldoc-mode)

;; ;; go right to the REPL buffer when it's finished connecting
;; (setq cider-repl-pop-to-buffer-on-connect t)

;; ;; When there's a cider error, show its buffer and switch to it
;; (setq cider-show-error-buffer t)
;; (setq cider-auto-select-error-buffer t)

;; ;; Where to store the cider history.
;; (setq cider-repl-history-file "~/.emacs.d/cider-history")

;; ;; Wrap when navigating history.
;; (setq cider-repl-wrap-history t)

;; ;; enable paredit in your REPL
;; (add-hook 'cider-repl-mode-hook 'paredit-mode)

;; ;; Use clojure mode for other extensions
;; (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojurescript-mode))
;; (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))


;; ;; key bindings
;; ;; these help me out with the way I usually develop web apps
;; (defun cider-start-http-server ()
;;   (interactive)
;;   (cider-load-current-buffer)
;;   (let ((ns (cider-current-ns)))
;;     (cider-repl-set-ns ns)
;;     (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
;;     (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))


;; (defun cider-refresh ()
;;   (interactive)
;;   (cider-interactive-eval (format "(user/reset)")))

;; (defun cider-user-ns ()
;;   (interactive)
;;   (cider-repl-set-ns "user"))

;; (eval-after-load 'cider
;;   '(progn
;;      (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
;;      (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
;;      (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
;;      (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))
