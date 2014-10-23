(defvar prog-mode-hook nil)

(defun prog-mode-setup ()
  (run-hooks 'prog-mode-hook))

(add-hook 'c-mode-common-hook 'prog-mode-setup)
(add-hook 'emacs-lisp-mode-hook 'prog-mode-setup)
(add-hook 'python-mode-hook 'prog-mode-setup)
(add-hook 'ruby-mode-hook 'prog-mode-setup)
(add-hook 'vhdl-mode-hook 'prog-mode-setup)

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 4)
        (setq python-indent 4)))

(add-hook 'vhdl-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 2)
        (setq vhdl-indent 2)))

(provide 'init-programming)
