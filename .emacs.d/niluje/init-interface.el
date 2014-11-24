;; non jumpy scrolling
(setq scroll-margin 5
 scroll-conservatively 9999
 scroll-step 1)

;; Solarized theme
(load-theme 'solarized-dark t)

;; start scratch in text mode (usefull to get a faster Emacs load time
;; because it avoids autoloads of elisp modes)
(setq initial-major-mode 'text-mode)
;; scratch buffer empty
(setq initial-scratch-message nil)

(require 'linum-relative) ;; require-package ne fonctionne pas ici
(global-linum-mode 1)
(setq linum-relative-current-symbol "")

;; Change cursor color according to mode
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;; Highlight current line
(global-hl-line-mode)

;; Rainbow delimiters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Highlight matching parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

;; remove whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Tabs BSD coding style with 4 spaces
(setq-default c-basic-offset 4 c-default-style "bsd")
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default highlight-tabs t)

;; Auto indent lines after pressing return so I don't have to press TAB
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Neotree
(require-package 'neotree)

;; tabs
;;(require-package 'tabbar)
;;(tabbar-mode)
;;(global-set-key [M-j] 'tabbar-backward-tab)
;;(global-set-key [M-k] 'tabbar-forward-tab)
;;(global-set-key [M-J] 'tabbar-backward-group)
;;(global-set-key [M-K] 'tabbar-forward-group)

(provide 'init-interface)
