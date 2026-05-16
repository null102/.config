;;; custom/functions.el --- Custom Emacs functions

;; Custom function to reload the configuration
(defun reload-emacs-config ()
  "Reload the Emacs configuration file."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

;; Custom function to quickly open the init file
(defun open-init-file ()
  "Open the Emacs init file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; Custom function to open a terminal in Emacs
(defun open-term ()
  "Open a terminal in Emacs."
  (interactive)
  (ansi-term "/bin/bash"))

