(if (string= "blupblup" (system-name))
    (setq user-full-name "cdebarge"
	  user-mail-address "cdebarge@nanoxplore.com"
	  org-directory "~/work/org"
	  projectile-project-search-path '("~/work/SVN_HOME"))
    (setq user-full-name "Niluje"
	  user-mail-address "debarge.cedric@nanoxplore.com"
	  org-directory "~/Work_local/org"
	  projectile-project-search-path '("~/Work_local")))

(setq doom-theme 'doom-one)

(menu-bar-mode 1)

(setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(use-package! whitespace
  :config
  (setq
    whitespace-style '(face tabs tab-mark spaces space-mark trailing
lines-tail newline newline-mark)
    whitespace-display-mappings '(
      (space-mark   ?\     [?\u00B7]     [?.])
      (space-mark   ?\xA0  [?\u00A4]     [?_])
      (newline-mark ?\n    [?¬ ?\n])
      (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t]))))

(defun niluje/turn-off-whitespace-mode ()
  "Unconditionally turn off Whitespace mode."
  (interactive)
  (setq-local whitespace-style nil))

(add-hook 'prog-mode-hook (global-whitespace-mode +1))

(map! :leader
      :nv "w -" nil
      :desc "Horizontal split"
      :n "w -" 'evil-window-split)

(map! :leader
      :nv "w /" nil
      :desc "Vertical split"
      :n "w /" 'evil-window-vsplit)

(map! :leader
      :nv "o n" nil
      :desc "Open treemacs pane"
      :n "o n" #'+treemacs/toggle)
(map! :leader
      :nv "f t" nil
      :desc "Open treemacs pane"
      :n "f t" #'+treemacs/toggle)

(when (> (display-color-cells) 16)         ;if not in CLI
  (setq x-select-enable-clipboard t
        interprogram-paste-function
        'x-cut-buffer-or-selection-value))

(delete-selection-mode 1)

(custom-set-variables
 '(verilog-align-ifelse t)
 '(verilog-auto-lineup (quote all))
 '(verilog-auto-newline nil)
 '(verilog-case-indent 2)
 '(verilog-cexp-indent 2)
 '(verilog-highlight-grouping-keywords t)
 '(verilog-highlight-modules t)
 '(verilog-indent-level 2)
 '(verilog-indent-level-behavioral 2)
 '(verilog-indent-level-declaration 2)
 '(verilog-indent-level-module 2)
 '(verilog-tab-to-comment t))

(add-hook 'verilog-mode-hook
  (function (lambda ()
          (setq evil-shift-width 2))))

(setq vhdl-basic-offset 2)
(setq vhdl-indent-tabs-mode t)

(defun niluje/setup-c-indent (n)
  "Sets c indent style for this buffer"
  (c-set-style "Linux")
  (setq c-basic-offset n
        c-indent-level n
        indent-tabs-mode t)
  (doom/set-indent-width n)
  )

(defun niluje/setup-c-indent-niluje-style ()
  "Sets c indent to niluje style (Linux + 4 spaces)"
  (interactive)
  (niluje/setup-c-indent 4)
  )

(defun niluje/setup-c-indent-linux-style ()
  "Sets c indent to linux style"
  (interactive)
  (niluje/setup-c-indent 8)
  )

(defun niluje/c-indent-guess ()
  "Guesses between 8 char per tab and 4 char per tab within Linux style"
  (interactive)
  (setq norl-path "~/.doom.d/tools/norl")
  (setq norl-cmd (concat norl-path " " buffer-file-name " 2>/dev/null"))
  (setq norl-ret (shell-command-to-string norl-cmd))
  (setq guessed-indent-style (replace-regexp-in-string "\r?\n\\'" "" norl-ret))
  (if (string-prefix-p "linux" guessed-indent-style)
       (niluje/setup-c-indent-linux-style)
       (niluje/setup-c-indent-niluje-style))
  )

(add-hook 'c-mode-hook 'niluje/c-indent-guess)

(after! evil-org
  (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))
)
(setq org-use-fast-todo-selection nil)

(setq org-log-done 'time)

(add-hook 'org-mode-hook #'niluje/turn-off-whitespace-mode)
