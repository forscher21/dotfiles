;;; my-emacs.d-file --- Summary

;;; Commentary:

;;; Code:

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


(package-initialize)


(load "~/.emacs.d/melpa")
(load "~/.emacs.d/helm")


(load-user-file "config-visual.el")
(load-user-file "config-elpy.el")

(load-user-file "config-javascript.el")
(load-user-file "config-latex.el")

(load-user-file "config-git.el")




(setq sage-shell:use-prompt-toolkit t)

(require 'sunrise-commander)




;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(TeX-view-program-list (quote (("Zathura" "zathura %o"))))
;;  '(TeX-view-program-selection
;;    (quote
;;     (((output-dvi style-pstricks)
;;       "dvips and gv")
;;      (output-dvi "Evince")
;;      (output-pdf "Zathura")
;;      (output-html "xdg-open")))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
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
    (palette helm-ag sr-speedbar helm-projectile projectile markdown-mode flycheck flycheck-css-colorguard helm-flycheck web-beautify ac-helm ac-html ac-html-bootstrap ac-html-csswatcher ac-js2 tern tern-auto-complete tern-context-coloring sage-shell-mode py-autopep8 parsebib magit helm git-timemachine f evil-visual-mark-mode elpy auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




