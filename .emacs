;; my info
(setq user-mail-address "lbs.lhc@gmail.com")
(setq user-full-name "Hongchao Liu")

;; load path
(add-to-list 'load-path "~/emacs-config")
(add-to-list 'load-path "~/lisp")
(add-to-list 'load-path "~/.emacs.d")

;; enable/disable the tool/menu bar
;; (tool-bar-mode 0)
(menu-bar-mode 0)

;; disable the scroll bar, too big
;; (scroll-bar-mode 0)
(set-face-attribute 'default nil :height 150)
(put 'scroll-left 'disabled nil)

;; enable ido mode
(ido-mode t)

;; turn on the transient mark mode
(transient-mark-mode t)

; turn on paren match highlighting
(show-paren-mode 1)

; highlight entire expression, the other option is to highlight 'parenthesis
; (setq show-paren-style 'expression)
(setq show-paren-style 'parenthesis)

;; display the ansi color in shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; red mode line
(set-face-background 'modeline "#cd0000")

;; search highlight
(setq search-highlight t)

;; underline the current line
(global-hl-line-mode)
(setq hl-line-face 'underline)

;; allow dired to be able to delete or copy a whole dir.
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote top))

;; load solarized theme
(add-to-list 'load-path "~/emacs-config/lib/solarized-emacs/")
(add-to-list 'custom-theme-load-path "~/emacs-config/lib/solarized-emacs/")
(load-theme 'solarized-dark t)

;; enable the global linum mode
;; (setq linum-format "%d")
;; (global-linum-mode)

;; autocomplete
;; take a look at 
;; http://cx4a.org/software/auto-complete/manual.html#Installation
;; for more info on installation.
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (ac-config-default)

;; w3m
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m/")
;; (require 'w3m-load)

;; emms music player
;; (add-to-list 'load-path "~/lisp/emms-3.0/")
;; (require 'emms-setup)
;; (emms-standard)
;; (emms-default-players)

; aliases goes in here
(defalias 'lml 'list-matching-lines)

;; keys definition goes here
(global-set-key (kbd "<f4>")  'erlang-align-arrows)
(global-set-key (kbd "<f5>")  'revert-buffer)
(global-set-key (kbd "<f6>")  'erlang-indent-region)
(global-set-key (kbd "<f7>")  'insert_current_time_string)
(global-set-key (kbd "<f8>")  'find-grep-dired)
(global-set-key (kbd "<f9>")  'diff-mouse-goto-source)
(global-set-key (kbd "<f11>") 'toggle-term-char-line-mode)
(global-set-key (kbd "<f12>") 'lookup_erldoc)
(global-set-key (kbd "\C-cl") 'org-store-link)
(global-set-key (kbd "\C-ca") 'org-agenda)
(global-set-key (kbd "M-g")   'goto-line)

;; easily move around the buffer
(global-set-key [C-left]  'windmove-left)
(global-set-key [C-right] 'windmove-right)
(global-set-key [C-up]    'windmove-up)
(global-set-key [C-down]  'windmove-down)

;; set the erc logs directory
(setq erc-log-channels-directory "~/.erc/logs/")
;; automatically save the log files
(setq erc-save-buffer-on-part nil
      erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)

;; setup the whitespace mode
(setq whitespace-style (quote
  (tab-mark lines)))

;; to always insert 8 spaces when inserting a tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq indent-line-function 'insert-tab)

;; load nyan mode
(add-to-list 'load-path "~/emacs-config/lib/nyan-mode/")
;; (require 'nyan-mode)

;; erlang mode setup
;; NOTE: use the proper OTP path
(setq load-path (cons "~/git/otp/lib/tools/emacs/" load-path))
(setq erlang-root-dir "~/git/otp/")
(setq exec-path (cons "~/git/otp/" exec-path))
(require 'erlang-start)

;; Some erlang mode customizations
(add-hook 'erlang-mode-hook
	  (lambda ()
	    ;; when starting an Erlang shell in Emacs, default in the node name
	    (setq inferior-erlang-machine-options '("-sname" "emacs"))
	    ;; add Erlang functions to an imenu menu
	    (imenu-add-to-menubar "imenu")))

(add-hook 'erlang-mode-hook '80whitespace_and_show_trailing_ws)
(add-hook 'erlang-mode-hook 'linum-mode)

;; edts
(add-to-list 'load-path "~/emacs-config/lib/edts/")
(require 'edts-start)

(setq edts-projects
      '(( ;; spider
         (name       . "")
         (root       . "")
         (node-sname . "")
         (lib-dirs   . ("lib")))))

;; hook 80 white space warning with org mode
(add-hook 'org-mode-hook '80whitespace_and_show_trailing_ws)

;; set the encoding
(setq default-buffer-file-coding-system 'iso-8859-1)
(prefer-coding-system 'iso-8859-1)
(set-language-environment "Latin-1")
(setq file-buffer-coding 'iso-8859-1)

;; start magit, the awesome emacs git tool
(require 'magit)

;; customize the diff color
(defun update-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute 'diff-added nil
                      :foreground "white" :background "darkgreen")
  (set-face-attribute 'diff-removed nil
                      :foreground "white" :background "darkred")
  (set-face-attribute 'diff-context nil
                      :foreground "white" :background "black")
  (set-face-attribute 'diff-changed nil
                      :foreground "white" :background "purple"))

(eval-after-load "diff-mode"
  '(update-diff-colors))

;; start the emacs server
;; (server-start)

;; some simple functions
(defun insert_current_time_string ()
  "insert the current time string"
  (interactive)
  (insert (concat "<" (current-time-string) ">")))

(defun toggle-term-char-line-mode ()
  "toggle the term-char-mode and term-line-mode in term-mode"
  (interactive)
  (if (member 'term-char-mode (setq temp minor-mode-list))
      (progn
        (term-line-mode)
        (message "enable term-line-mode")
        )
    (progn
      (term-char-mode)
      (message "enable term-char-mode")
      )
  ))

;; show the trailing whitespace
(defun 80whitespace_and_show_trailing_ws()
  (whitespace-mode t)
  (setq whitespace-line-column 80)
  (setq show-trailing-whitespace t))

;; function to lookup erldoc
(defun lookup_erldoc()
  "look up the word under cursor on the erldoc site"
  (interactive)
  (let (myStr url)
    (setq myStr (thing-at-point 'symbol))
    (setq myStr (concat
                 "http://erldocs.com/R14B03/stdlib/lists.html?i=0&search="
                 myStr))
    (message "querying %s" myStr)
    (setq url myStr)
    (browse-url url)
   )
)
