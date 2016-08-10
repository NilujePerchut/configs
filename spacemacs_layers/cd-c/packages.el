(setq cd-c-packages
      '(cc-mode))

(defun cd-c/post-init-cc-mode ()
  (setq-default c-default-sytle "linux"
    c-basic-offset 8)
  (setq-default tab-width 8)
  (setq-default indent-tabs-mode t))
