;;load-path
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(setq load-path (cons "~/.emacs.d/auto-java-complete" load-path))

;;helm-agpp
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq-default c-basic-offset 2)
;; set key-bind
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\9" 'delete-window)
(global-set-key "\C-x\1" 'delete-other-windows)
(global-set-key "\C-x\2" 'split-window)
(global-set-key "\C-x\3" 'split-window-vertically)
;(global-set-key "\C-x.\C-^" 'cua-set-rectangle-mark)
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

;;yasnippet
(require 'yasnippet)
;;auto-complete
(global-auto-complete-mode t)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))

;;realtime-preview
(autoload 'realtime-preview "realtime-preview" nil t)
(add-to-list 'auto-mode-alist '("\\.md$" . realtime-preview))

;;web-mode
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

;;php-mode
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-hook 'php-mode-hook
          '(lambda()
             (setq tab-width 2)
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 2)
             ))
;;php-complete
;;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;;direx, pop win
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;;json mode
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(require 'direx)
(setq direx:leaf-icon "  "
      direx:open-icon "🔻"
      direx:closed-icon "🔺")
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-d") 'direx:jump-to-directory-other-window)
;;(global-set-key (kbd "C-x C-r") 'direx:find-directory)

;;helm
(require 'helm-config)
(require 'quickrun)
(global-set-key (kbd "C-x C-r") 'quickrun)
(helm-mode 1)
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key global-map (kbd "C-x C-h") 'helm-recentf)
(define-key global-map (kbd "C-x C-m") 'helm-imenu-anywhere)
(global-ace-isearch-mode 1)
;;dirtree
(require 'dirtree)

;;eproject
(require 'eproject)
(defun ep-dirtree ()
  (interactive)
  (dirtree eproject-root t))

;;auto recent save
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))

;;indent
(setq-default tab-width 2 indent-tabs-mode nil)

;;recentf
(require 'recentf)
(recentf-mode 1)

(require 'undo-tree)
(global-undo-tree-mode t)

(global-set-key (kbd "C-x C-\\") 'undo-tree-redo)

(global-anzu-mode +1)

(require 'smartparens-config)

(smartparens-global-mode t)


;;(global-hl-line-mode)
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)

(show-paren-mode 1)
(setq show-paren-delay 0)


                                        ;(require 'multiple-cursors)
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-*")   'mc/mark-all-like-this)
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  '(("C-p"      . 'mc/mark-previous-like-this)
    ("C-n"      . 'mc/mark-next-like-this)
    ("u" . mc/unmark-next-like-this)
    ("U" . mc/unmark-previous-like-this)
    ("s" . mc/skip-to-next-like-this)
    ("S" . mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)))
(set-face-foreground 'mode-line "white")

(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(ahs-set-idle-interval 0.5)

;;(require 'rainbow-blocks)
;;(global-rainbow-blocks-mode t)
(menu-bar-mode 0)

(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

;;js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
 
(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode t)))
 
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))
(global-set-key (kbd "C-X C-J") 'mc/edit-lines)
 
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
 
;;pytho jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
 
;;(require 'swoop)
;;(global-set-key (kbd "C-o")   'swoop)
;;(global-set-key (kbd "C-x C-o") 'swoop-multi)
;;(global-set-key (kbd "M-o")   'swoop-pcre-regexp)
;;(global-set-key (kbd "C-S-o") 'swoop-back-to-last-position)
;;(global-set-key (kbd "H-6")   'swoop-migemo) ;; Option for Japanese match

;;farm-mode
(load-theme 'farmhouse-dark t)

;; ミニバッファ履歴リストの最大長：tなら無限
;;(setq history-length t)
;;;; session.el
;;;;   kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
;;(when (require 'session nil t)
;;  (setq session-initialize '(de-saveplace session keys menus places)
;;        session-globals-include '((kill-ring 50)
;;                                  (session-file-alist 500 t)
;;                                  (file-name-history 10000)))
;;  (add-hook 'after-init-hook 'session-initialize)
;;  ;; 前回閉じたときの位置にカーソルを復帰
;;  (setq session-undo-check -1))
;;;; minibuf-isearch
;;;;   minibufでisearchを使えるようにする
;;(require 'minibuf-isearch nil t)
;;(require 'migemo)
;;(setq migemo-command "cmigemo")
;;(setq migemo-options '("-q" "--emacs"))
;; 
;;;; Set your installed path
;;(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
;; 
;;(setq migemo-user-dictionary nil)
;;(setq migemo-regex-dictionary nil)
;;(setq migemo-coding-system 'utf-8-unix)
;;(load-library "migemo")
;;(migemo-init)
;;(global-company-mode t)
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;; 
(require 'tss)
 ;; キーバインド
(setq tss-popup-help-key "C-q")
(setq tss-jump-to-definition-key "C-.")
(setq tss-implement-definition-key "C-x i")
 
(tss-config-default)

;;(require 'tide)
;;(add-hook 'typescript-mode-hook
;;            (lambda ()
;;            (tide-setup)
;;            (flycheck-mode t)
;;            (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;            (eldoc-mode t)
;;            (company-mode-on)))

;;(require 'company)
;;;;; C-n, C-pで補完候補を選べるように
;;(define-key company-active-map (kbd "M-n") nil)
;;(define-key company-active-map (kbd "M-p") nil)
;;(define-key company-active-map (kbd "C-n") 'company-select-next)
;;(define-key company-active-map (kbd "C-p") 'company-select-previous)
;;;;; C-hがデフォルトでドキュメント表示にmapされているので、文字を消せるようにmapを外す
;;(define-key company-active-map (kbd "C-h") nil)
;;;;; 1つしか候補がなかったらtabで補完、複数候補があればtabで次の候補へ行くように
;;(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
;;;;; ドキュメント表示
;;(define-key company-active-map (kbd "M-d") 'company-show-doc-buffer)
;; 
;;(setq company-minimum-prefix-length 1) ;; 1文字入力で補完されるように
;; ;;; 候補の一番上でselect-previousしたら一番下に、一番下でselect-nextしたら一番上に行くように
;;(setq company-selection-wrap-around t)
;; 
;;;;; 色の設定。出来るだけ奇抜にならないように
;;(set-face-attribute 'company-tooltip nil
;;                    :foreground "black"
;;                    :background "lightgray")
;;(set-face-attribute 'company-preview-common nil
;;                    :foreground "dark gray"
;;                    :background "black"
;;                    :underline t)
;;(set-face-attribute 'company-tooltip-selection nil
;;                    :background "steelblue"
;;                    :foreground "white")
;;(set-face-attribute 'company-tooltip-common nil
;;                    :foreground "black"
;;                    :underline t)
;;(set-face-attribute 'company-tooltip-common-selection nil
;;                    :foreground "white"
;;                    :background "steelblue"
;;                    :underline t)
;;(set-face-attribute 'company-tooltip-annotation nil
;;                                        :foreground "red")
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         tabs           ; タブ
                         tab-mark
                         ))
(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)

(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key "\C-x\C-o" 'window-resizer)

;; setting for flymake
(require 'flymake)
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
(global-set-key (kbd "C-x C-n") 'flymake-goto-next-error) 
(global-set-key (kbd "C-x C-p") 'flymake-goto-prev-error) ;;
;;
;; 
;;;; Show error message under current line
;;(require 'popup)
;;(defun flymake-display-err-menu-for-current-line ()
;;  (interactive)
;;  (let* ((line-no (flymake-current-line-no))
;;         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no))))
;;    (when line-err-info-list
;;      (let* ((count (length line-err-info-list))
;;             (menu-item-text nil))
;;        (while (> count 0)
;;          (setq menu-item-text (flymake-ler-text (nth (1- count) line-err-info-list)))
;;          (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
;;                 (line (flymake-ler-line (nth (1- count) line-err-info-list))))
;;            (if file
;;                (setq menu-item-text (concat menu-item-text " - " file "(" (format "%d" line) ")"))))
;;          (setq count (1- count))
;;          (if (> count 0) (setq menu-item-text (concat menu-item-text "\n")))
;;          )
;;        (popup-tip menu-item-text)))))
;; 
;;;; If you don't set :height, :bold face parameter of 'pop-tip-face,
;;;; then seting those default values
;;(if (eq 'unspecified (face-attribute 'popup-tip-face :height))
;;    (set-face-attribute 'popup-tip-face nil :height 1.0))
;;(if (eq 'unspecified (face-attribute 'popup-tip-face :weight))
;;    (set-face-attribute 'popup-tip-face nil :weight 'normal))
;; 
;;(defun my/display-error-message ()
;;  (let ((orig-face (face-attr-construct 'popup-tip-face)))
;;    (set-face-attribute 'popup-tip-face nil
;;                        :height 1.5 :foreground "firebrick"
;;                        :background "LightGoldenrod1" :bold t)
;;    (unwind-protect
;;        (flymake-display-err-menu-for-current-line)
;;      (while orig-face
;;        (set-face-attribute 'popup-tip-face nil (car orig-face) (cadr orig-face))
;;        (setq orig-face (cddr orig-face))))))
;; 
;;(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
;;  (my/display-error-message))
;;(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
;;  (my/display-error-message))
;; 
;;(ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
;;(ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)
