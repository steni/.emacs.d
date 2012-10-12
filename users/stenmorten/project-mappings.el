(defmacro project-specifics (name &rest body)
  `(progn
     (add-hook 'find-file-hook
             (lambda ()
               (when (string-match-p ,name (buffer-file-name))
                 ,@body)))
     (add-hook 'dired-after-readin-hook
             (lambda ()
               (when (string-match-p ,name (dired-current-directory))
                 ,@body)))))

;; Emacs

(defun custom-persp/emacs ()
  (interactive)
  (custom-persp "emacs"
                (find-file "~/.emacs.d/init.el")))

(project-specifics ".emacs.d"
                   (ffip-local-excludes "swank")
                   (ffip-local-patterns "*.el" "*.md" "*.org"))

(define-key persp-mode-map (kbd "C-x p e") 'custom-persp/emacs)

;; cia

(defun custom-persp/cia ()
  (interactive)
  (custom-persp "cia"
                (find-file "~/Code/cia/")))

(project-specifics "Code/cia"
                   (setq clj-project-name "cia"))

(define-key persp-mode-map (kbd "C-x p c i a") 'custom-persp/cia)


;; pleasurebook

(defun custom-persp/pleasurebook ()
  (interactive)
  (custom-persp "pleasurebook"
                (find-file "~/Code/pleasurebook/")))

(project-specifics "Code/pleasurebook"
                   (setq clj-project-name "pleasurebook"))

(define-key persp-mode-map (kbd "C-x p l e") 'custom-persp/pleasurebook)

;; oiiku

(defun custom-persp/oiiku ()
  (interactive)
  (custom-persp "oiiku"
                (find-file "~/Code/oiiku/")))

(project-specifics "Code/oiiku"
                   (setq clj-project-name "oiiku"))

(define-key persp-mode-map (kbd "C-x p o k") 'custom-persp/oiiku)


;; CLJEmacs

(defun custom-persp/cljemacs ()
  (interactive)
  (custom-persp "cljemacs"
                (find-file "~/Code/cljemacs/")))

(project-specifics "Code/cljemacs"
                   (setq clj-project-name "cljemacs"))

(define-key persp-mode-map (kbd "C-x p c l j") 'custom-persp/cljemacs)

;; Org

(defun custom-persp/org ()
  (interactive)
  (custom-persp "org")
  (find-file "~/Dropbox/org/"))

(define-key persp-mode-map (kbd "C-<f6>") 'custom-persp/org)
