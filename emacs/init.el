(require 'package)
(eval-and-compile
  (add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
  (package-initialize))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; add local path to emacs path
(setq exec-path (append exec-path '("~/.local/bin")))

;; set default directory for emacs generated backups
(setq backup-directory-alist '(("~/.emacs.d/saves")))
(global-unset-key (kbd "C-z"))

;; ---- org mode ----
(require 'org)
(require 'tempo)

(setq org-log-done t)
(setq org-agenda-files '("~/org/agenda.org"))
(setq org-default-notes-file '"~/org/agenda.org")
(setq org-agenda-tags-column -90)
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 9))))

(setq org-capture-templates
      '(("a" "Agenda item" entry (file+headline "~/org/agenda.org" "Tasks")
         "** TODO %? %^g\n  %U")
nnn        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)")))

(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c c") 'org-capture)

(use-package gnuplot
  :config
  (define-key org-mode-map "\C-\M-g" 'org-plot/gnuplot))

;; ---- other research related things ----
(use-package pdf-tools
  :config (progn
	    (pdf-loader-install)
	    (setq pdf-view-midnight-colors '("#010203" . "#e2be9f"))))

(use-package csv-mode)

;; ---- projects/ide ----
(use-package magit
  :bind ("C-x g" . magit))

(use-package ag)
(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-x C-p") 'projectile-command-map))

;; change buffer names to be project relative
(defun rename-project-relative ()
    (if (projectile-project-root)
	(rename-buffer  (file-relative-name buffer-file-name (projectile-project-root)))
      ))
(add-hook 'find-file-hook 'rename-project-relative)

;; ---- ccls as cquery replacement that works better ----
(use-package flycheck
  :hook (prog-mode-hook . flycheck-mode))
(use-package lsp-mode :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))
(setq lsp-prefer-flymake nil)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))

(bind-key "C-. C-c" 'compile)
(bind-key "C-. C-r" 'recompile)
(bind-key "C-. C-v" 'revert-buffer)

(use-package ace-window
  :bind ("M-o" . 'ace-window))

(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package yasnippet-snippets)

;; ---- visuals ----

(use-package base16-theme
  :config (load-theme 'base16-gruvbox-dark-pale t))
(use-package powerline
  :config (powerline-default-theme))


(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'latex-mode-hook 'linum-mode)
(menu-bar-mode 0)
(show-paren-mode 1)

(setq split-width-threshold 160)
(setq split-height-threshold nil)

;; ---- testing area ----

(defun custom-smart-compile () (interactive)
  (if (projectile-project-root)
      (if (boundp 'build-directory)
	  (let ((default-directory (concat (projectile-project-root) build-directory)))
	    (call-interactively #'compile))
	(message "No build directory defined, not compiling")
	)
    (message "Not in a projectile project, not compiling")
    )
)
(bind-key "<f7>" 'custom-smart-compile)

(defun custom-smart-run () (interactive)
       (if (and (projectile-project-root) build-directory main-file)
	   (let ((default-directory (concat (projectile-project-root) build-directory)))
	     (display-message-or-buffer (shell-command-to-string (concat (directory-file-name default-directory) "/" main-file))))
	 (message "Smart run not fully configured, exiting...")))
(bind-key "<f5>" 'custom-smart-run)

(bind-key "C-<f5>" 'gud-gdb)

(use-package transpose-frame
  :bind ("C-x p" . 'transpose-frame))

;; ---- custom ----
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(org-agenda-files
   (quote
    ("~/Projects/nn-sgx/project.org" "~/org/agenda.org")))
 '(package-selected-packages
   (quote
    (ccls transpose-frame transpase-frame lsp-ui company-lsp cquery emacs-cquery csv-mode gnuplot emacs-powerline base16-theme ace-window pdf-tools flycheck yasnippet-snippets lsp-mode projectile ag magit use-package)))
 '(safe-local-variable-values
   (quote
    ((main-file . "arm_simulator")
     (build-directory . "build")
     (build-directory eval
		      (concat
		       (projectile-project-root)
		       "build")))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "CTDB" :slant normal :weight normal :height 120 :width normal)))))
