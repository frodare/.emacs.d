;;; package --- Summary
;;; Commentary:
;;;
(require 'package)

;;; Code:
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(setq package-archive-priorities
      '(("melpa-stable" . 20)
        ("marmalade" . 20)
        ("gnu" . 10)
        ("melpa" . 0)))

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(company flycheck magit))

;; (setq package-list '(company
;;                      flx-ido
;;                      flycheck
;;                      markdown-mode
;;                      magit
;;                      projectile
;;                      react-snippets
;;                      readline-complete
;;                      web-mode
;;                      yaml-mode
;;                      yasnippet
;;                      )
;; )


;; Install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
	(package-install package)))

(setq-default

 tab-width 4

 ;; js2-mode
 js2-basic-offset 4

 ;; json-mode
 js-indent-level 4

 ;; web-mode
 css-indent-offset 4
 web-mode-markup-indent-offset 4
 web-mode-css-indent-offset 4
 web-mode-code-indent-offset 4
 web-mode-attr-indent-offset 4
 )

(setq-default indent-tabs-mode t)

;; Make web-mode come up for certain file types: html, js, react jsx, json
;; cf: http://web-mode.org/
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '(".*\\.js[x]?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '(".*\\.json?\\'" . web-mode))

;; Set up flycheck with eslint.
;; cf: http://www.flycheck.org/en/latest/user/quickstart.html#enable-flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-show-dot-for-dired t)

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set up magit
;; cf: https://magit.vc/manual/magit/Getting-started.html#Getting-started
;; and quick tutorial here:
;; http://jr0cket.co.uk/2012/12/driving-git-with-emacs-pure-magic-with.html
;;
(global-set-key (kbd "C-x g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set up react yasnippets, cf https://github.com/johnmastro/react-snippets.el
;; 
;; (require 'react-snippets)
;; (add-hook 'after-init-hook #'yas-global-mode)
;; ;; Turn off yas in ansi-term though as it gets in the way of autocomplete,
;; ;; cf http://stackoverflow.com/questions/18278310/emacs-ansi-term-not-tab-completing
;; (add-hook 'term-mode-hook (lambda()
;;                 (yas-minor-mode -1)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit markdown-mode flycheck flx-ido company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'wombat t)

;;; init.el ends here
