(defvar prog-mode-hook nil)

(defun prog-mode-setup ()
  (run-hooks 'prog-mode-hook))

(add-hook 'c-mode-common-hook 'prog-mode-setup)
(add-hook 'emacs-lisp-mode-hook 'prog-mode-setup)
(add-hook 'python-mode-hook 'prog-mode-setup)
(add-hook 'ruby-mode-hook 'prog-mode-setup)

(provide 'init-programming)
