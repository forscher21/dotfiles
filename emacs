;;; -*- mode: emacs-lisp; -*-

(load "~/.emacs.d/melpa")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/others")
(setq backup-directory-alist `(("." . "~/.emacs-saves")))

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
   "Load FILE from the .emacs directory."
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


(eval-when-compile
  (require 'use-package))

(use-package use-package-ensure-system-package
  :ensure t)
(use-package system-packages
  :ensure t
  :init
  (setq system-packages-use-sudo t))

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "Zathura")
     (output-pdf "Zathura")
     (output-html "xdg-open"))))
 '(package-selected-packages
   (quote
    (helm-lsp helm-rg company-lsp lsp-ui lsp-mode company-go yasnippet-snippets go-dlv go-eldoc go-rename go-guru racer cargo rust-mode nasm-mode idris-mode company-glsl glsl-mode toml-mode company-rtags flycheck-rust sudo-edit dockerfile-mode gitignore-mode vmd-mode yaml-mode json-mode markdown-preview-mode which-key company-quickhelp magit dash-functional web-beautify use-package-ensure-system-package tide tern-context-coloring tern-auto-complete sr-speedbar sourcemap sage-shell-mode py-autopep8 parsebib palette memoize markdown-mode indium helm-rtags helm-projectile helm-gtags helm-flycheck helm-company helm-ag git-timemachine ggtags flycheck-rtags flycheck-irony flycheck-css-colorguard evil-visual-mark-mode elpy dtrt-indent company-web company-irony auctex ac-js2 ac-html-csswatcher ac-html-bootstrap ac-html ac-helm)))
 '(tool-bar-mode nil))


(load "~/.emacs.d/helm")

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  ;; Use Company for completion
  (bind-key [remap completion-at-point] #'company-complete company-mode-map)
  
  (setq company-tooltip-align-annotations t
        ;; Easy navigation to candidates with M-<n>
        company-show-numbers t)
  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
;  (define-key company-active-map 'company-complete-common nil) ; disable TAB completion
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

  :diminish company-mode)

(use-package company-quickhelp          ; Documentation popups for Company
  :ensure t
  :hook (global-company-mode-hook . company-quickhelp-mode))

(load-user-file "config-lsp.el")
(load-user-file "config-visual.el")
(load-user-file "config-elpy.el")
;(load-user-file "config-cpp.el")
;(load-user-file "config-javascript.el")
(load-user-file "config-latex.el")
(load-user-file "config-rust.el")
(load-user-file "config-idris.el")
;(load-user-file "config-go.el")
(load-user-file "config-lsp.el")

(load-user-file "config-git.el")

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'")


;;(require 'sunrise-commander)


(use-package sudo-edit
  :ensure t
  :commands (sudo-edit))

(defun sudo-save ()
  (interactive)
  (if (not buffer-file-name)
      (write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
    (write-file (concat "/sudo:root@localhost:" buffer-file-name))))

