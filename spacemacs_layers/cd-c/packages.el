(setq cd-c-packages
      '(
		cc-mode
		(cc-styles :location built-in)
		never-comment
		))

(defun cd-c/init-never-comment ()
  (use-package never-comment
			:defer t
			:init
            (never-comment-init)))

(defun cd-c/post-init-cc-mode ()
  (dolist (mode '(c-mode c++-mode))
    (spacemacs/set-leader-keys-for-major-mode mode
      "os" 'c-set-style))
)

(defun cd-c/init-cc-styles ()
  (use-package cc-styles
	:defer t
	:config
	(progn
	  (c-add-style "cd"
				   '((indent-tabs-mode . t)
                     (c-tab-always-indent . t)
                     (tab-width . 4)
					 (c-basic-offset . 4)
					 (c-offsets-alist
                      (substatement-open . 0)
                      (inline-open . 0)
                      (statement-cont . c-lineup-assignments)
                      (inextern-lang . 0)
					  (innamespace . 0))))
	  (c-add-style "kernel"
				   '((indent-tabs-mode . t)
           (c-tab-always-indent . t)
					 (c-basic-offset . 8)
                     (tab-width . 8)
					 (c-offsets-alist
                      (substatement-open . 0)
                      (inline-open . 0)
                      (statement-cont . c-lineup-assignments)
                      (inextern-lang . 0)
					  (innamespace . 0))))
	  (push '(other . "cd") c-default-style))))
