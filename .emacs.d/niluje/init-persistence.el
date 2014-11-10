;; create backup files on a directory inside dotemacs
    (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Remember last edit positions
    (require-package 'saveplace)
    (setq save-place-file "~/.emacs.d/saveplace")
    (setq-default save-place t)

;; lots of recent files
    (require 'recentf)
    (setq recentf-save-file "~/.emacs.d/recentf"
          recentf-max-saved-items 1000
          recentf-max-menu-items 500)
    (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")
    (recentf-mode +1)
    (run-with-timer 1800 1800 'recentf-save-list)

(provide 'init-persistence)
