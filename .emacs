;;load-path
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;helm-agpp
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; set key-bind
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\9" 'delete-window)
(global-set-key "\C-x\1" 'delete-other-windows)
(global-set-key "\C-x\2" 'split-window)
(global-set-key "\C-x\3" 'split-window-vertically)
(global-set-key "\C-x\C-^" 'cua-set-rectangle-mark)
(global-set-key "\C-\\" 'undo)
(global-set-key "\C-x\j\l" 'goto-line)
(global-set-key "\C-x\C-c" 'save-buffers-kill-terminal)
(global-set-key "\C-i" 'indent-region)
(global-set-key "\C-x\C-i" 'indent-region)
;;
(cua-mode t)
(setq cua-enable-cua-keys nil)  ;
(setq auto-save-default nil)  ;
(setq make-backup-files nil)  ; (cua-mode t)  ; cua-mode

;;auto-complete
(global-auto-complete-mode t)

;;realtime-preview
(autoload 'realtime-preview "realtime-preview" nil t)
(add-to-list 'auto-mode-alist '("\\.md$" . realtime-preview))

;;web-mode
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook 'my-web-mode-hook)

;;php-mode
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;;php-complete
;;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;;direx, pop win
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(require 'direx)
(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-d") 'direx:jump-to-directory-other-window)

;;helm
(require 'helm-config)
(helm-mode 1)
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

