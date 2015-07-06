;; if you're new to the MELPA package manager, just include
;; this entire snippet in your `~/.emacs` file and follow
;; the instructions in the comments.
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	 '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Restart emacs and do `M-x package-install [RETURN] ensime [RETURN]`
;; To keep up-to-date, do `M-x list-packages [RETURN] U x [RETURN]`

;; If necessary, make sure "sbt" and "scala" are in the PATH environment
;; (setenv "PATH" (concat "/path/to/sbt/bin:" (getenv "PATH")))
;; (setenv "PATH" (concat "/path/to/scala/bin:" (getenv "PATH")))
;;
;; On Macs, it might be a safer bet to use exec-path instead of PATH, for instance: 
;; (setq exec-path (append exec-path '("/usr/local/bin")))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
    (with-current-buffer
            (url-retrieve-synchronously
                     "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
                (goto-char (point-max))
                    (eval-print-last-sexp)))

(setq my:el-get-packages
    '(el-get               ; el-get is self-hosting
      evil
      evil-leader
      evil-nerd-commenter
      fiplr
      ensime
      git-gutter))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync my:el-get-packages)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General settings for Emacs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq linum-format "%d ")
(global-linum-mode 1)

(recentf-mode 1)  ; keep a list of recently opened files

;;;;;;;;;;;;;;;;;;;;;;
;; Package settings ;;
;;;;;;;;;;;;;;;;;;;;;;

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(electric-indent-mode 0)
(add-hook 'scala-mode-hook '(lambda ()
   (local-set-key (kbd "RET") (lambda () (interactive) (newline) (indent-relative-maybe)))))

(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(require 'fiplr)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "e" 'fiplr-find-file
  "x" 'execute-extended-command
  "ll" 'evilnc-comment-or-uncomment-lines
  "o" 'recentf-open-files)

(require 'evil)
(evil-mode 1)

(require 'git-gutter)
(global-git-gutter-mode +1)
(custom-set-variables
  '(git-gutter:update-interval 2))
