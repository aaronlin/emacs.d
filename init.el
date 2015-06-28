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

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(require 'evil)
(evil-mode 1)

(setq linum-format "%d ")
(global-linum-mode 1)

(setq auto-save-default nil)
