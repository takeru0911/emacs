;;; minibuf-isearch-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "minibuf-isearch" "minibuf-isearch.el" (21971
;;;;;;  58055 678011 605000))
;;; Generated autoloads from minibuf-isearch.el

(defvar minibuf-isearch-fire-keys '("") "\
*Executing keys of minibuf-isearch.")

(custom-autoload 'minibuf-isearch-fire-keys "minibuf-isearch" t)

(defvar minibuf-isearch-reverse-fire-keys '("\362") "\
*Executing keys of minibuf-isearch with prefix argument.")

(custom-autoload 'minibuf-isearch-reverse-fire-keys "minibuf-isearch" t)

(autoload 'minibuf-isearch-backward-reverse "minibuf-isearch" "\
Start backward incremental searching on minibuffer history with prefix.

\(fn &optional ARGS)" t nil)

(autoload 'minibuf-isearch-backward "minibuf-isearch" "\
Start backward incremental searching on minibuffer history.

\(fn &optional ARGS)" t nil)

(mapcar (lambda (keymap) (mapcar (lambda (key) (define-key keymap key 'minibuf-isearch-backward)) minibuf-isearch-fire-keys) (mapcar (lambda (key) (define-key keymap key 'minibuf-isearch-backward-reverse)) minibuf-isearch-reverse-fire-keys)) (delq nil (list (and (boundp 'minibuffer-local-map) minibuffer-local-map) (and (boundp 'minibuffer-local-ns-map) minibuffer-local-ns-map) (and (boundp 'minibuffer-local-completion-map) minibuffer-local-completion-map) (and (boundp 'minibuffer-local-must-match-map) minibuffer-local-must-match-map))))

;;;***

;;;### (autoloads nil nil ("gmhist.el" "minibuf-isearch-pkg.el")
;;;;;;  (21971 58055 692349 52000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; minibuf-isearch-autoloads.el ends here
