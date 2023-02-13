;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Keybindings

;; buffer and window switching and management
; switch windows forwards with CTRL-{ or CTRL-}
(defun prev-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-{") 'prev-window)
(global-set-key (kbd "C-}") 'other-window)

; tabs
(global-set-key (kbd "C-x t ESC") 'centaur-tabs-mode)
(global-set-key (kbd "C-x t n") 'centaur-tabs--create-new-tab)
(global-set-key (kbd "C-x t w") 'centaur-tabs--kill-this-buffer-dont-ask)

;switch tabs forward with CTRL-TAB and backwards with CTRL-SHIFT-TAB
(global-set-key (kbd "C-<tab>") 'centaur-tabs-forward-tab)
(global-set-key (kbd "C-<iso-lefttab>") 'centaur-tabs-backward-tab)

; move tabs around with META-{ or META-}
(global-set-key (kbd "M-{") 'centaur-tabs-move-current-tab-to-left)
(global-set-key (kbd "M-}") 'centaur-tabs-move-current-tab-to-right)


(defun shrink-horisontal-ten ()
  (interactive)
  (let ((current-prefix-arg 10)) ;; emulate C-u
    (call-interactively 'shrink-window-horizontally) ;; invoke align-regexp interactively
  )
  )
(defun enlarge-horisontal-ten ()
  (interactive)
  (let ((current-prefix-arg 10)) ;; emulate C-u
    (call-interactively 'enlarge-window-horizontally) ;; invoke align-regexp interactively
  )
  )
(defun shrink-vertical-ten ()
  (interactive)
  (let ((current-prefix-arg 10)) ;; emulate C-u
    (call-interactively 'shrink-window) ;; invoke align-regexp interactively
  )
  )
(defun enlarge-vertical-ten ()
  (interactive)
  (let ((current-prefix-arg 10)) ;; emulate C-u
    (call-interactively 'enlarge-window) ;; invoke align-regexp interactively
  )
)

; increase curr window vertically or horisontally
(global-set-key (kbd "M-<") 'shrink-vertical-ten)
(global-set-key (kbd "M->") 'enlarge-vertical-ten)
(global-set-key (kbd "C-<") 'shrink-horisontal-ten)
(global-set-key (kbd "C->") 'enlarge-horisontal-ten)

(global-set-key (kbd "C-<up>")    (kbd "C-u 5 <up>"))
(global-set-key (kbd "C-<down>")  (kbd "C-u 5 <down>"))
(global-set-key (kbd "C-<left>")  'left-word)
(global-set-key (kbd "C-<right>") 'right-word)

;; neotree
(global-set-key (kbd "C-b") 'neotree-toggle)
(setq neo-window-fixed-size nil)

;; minimap
(global-set-key (kbd "C-x m") 'minimap-mode)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; ide stuff
; go to definition and look up references
(global-set-key (kbd "<f12>") '+lookup/definition)
(global-set-key (kbd "<f9>") '+lookup/references)
(global-set-key (kbd "S-<f9>") '+lookup/implementations)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-ir-black)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
