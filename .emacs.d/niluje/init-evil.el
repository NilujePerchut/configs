(require 'evil)
(evil-mode t)
(global-evil-tabs-mode t) ; tabs (requires evil-tabs)
(require-package 'evil-surround)
(require-package 'evil-numbers)
(require-package 'evil-matchit)
(require-package 'evil-search-highlight-persist)

(global-evil-matchit-mode t)
(global-evil-surround-mode t)
(global-evil-search-highlight-persist t)

; Bind C-a to inc like vim
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)

; c-number switch to elscreen (tab) (I also have <leader>-number which I prefer, but these
; binding are useful in modes where the leader doesnt work)
(define-key evil-normal-state-map (kbd "C-0") (lambda() (interactive) (elscreen-goto 0)))
(define-key evil-normal-state-map (kbd "C-º") (lambda() (interactive) (elscreen-goto 0)))
(define-key evil-normal-state-map (kbd "C-1") (lambda() (interactive) (elscreen-goto 1)))
(define-key evil-normal-state-map (kbd "C-2") (lambda() (interactive) (elscreen-goto 2)))
(define-key evil-normal-state-map (kbd "C-3") (lambda() (interactive) (elscreen-goto 3)))
(define-key evil-normal-state-map (kbd "C-4") (lambda() (interactive) (elscreen-goto 4)))
(define-key evil-normal-state-map (kbd "C-5") (lambda() (interactive) (elscreen-goto 5)))
(define-key evil-normal-state-map (kbd "C-6") (lambda() (interactive) (elscreen-goto 6)))
(define-key evil-normal-state-map (kbd "C-7") (lambda() (interactive) (elscreen-goto 7)))
(define-key evil-normal-state-map (kbd "C-8") (lambda() (interactive) (elscreen-goto 8)))
(define-key evil-normal-state-map (kbd "C-9") (lambda() (interactive) (elscreen-goto 9)))

; Powerline & Powerline-evil
(require 'powerline)
(powerline-default-theme)
(require 'powerline-evil)

(provide 'init-evil)
