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

(add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)

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

(provide 'init-interface)
