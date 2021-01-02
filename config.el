;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Shijie Chen"
      user-mail-address "chrischen369@outlook.com")

;; (define-minor-mode my-keys-mode
;;   "Minor mode for my personal keybindings."
;;   :global t
;;   :keymap (make-sparse-keymap))
;; (define-key make-sparse-keymap)

;; Bind 'C-w' to kill a word, as with most linux/unix shells. Ajust kill-region to 'C-r'.
(global-set-key (kbd "C-r") 'backward-kill-word) ;
(global-set-key (kbd "C-w") 'kill-region)
(bind-keys* ("C-c ;" . iedit-mode) ;; "C-c ;" used to be 'org-toggle-comment'
            ("C-;" . flyspell-auto-correct-previous-word))

;; Configure ivy backend for swiper, org-ref, and the rest.
(setq ivy-re-builders-alist
      '((swiper-isearch . ivy--regex-plus)
        (org-ref-ivy-insert-cite-link . ivy--regex-ignore-order)
        (t . ivy--regex-fuzzy))) ;; use fuzzy matching.
(setq ivy-initial-inputs-alist nil);; Fuzzy all the way! Otherwise, start input with '^' for fuzzy mathcing.
(use-package ivy
  :init (setq ivy-use-virtual-buffers t)
  :config
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (ivy-mode 1))
(use-package counsel
  :config
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-s") 'swiper-isearch) ;; Use Swiper to replace isearch.
  (counsel-mode 1))

;; Lose UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq doom-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 20)
      doom-big-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 24))

;; Use slant font for comments and keywords.
(custom-set-faces!
  '(font-lock-keyword-face :slant italic)
  '(font-lock-comment-face :slant italic))

(setq user-full-name "Shijie Chen"
      user-mail-address "chrischen369@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one) ;; The default doom theme.
(setq doom-theme 'doom-oceanic-next)

;;(setq display-line-numbers-type nil)
;;      doom-line-numbers-style 'relative) ;; Use relative line number

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t
        display-line-numbers-type nil))

;; clashes with spell-fu mode.
(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))
(setq spell-fu-directory "~/+STORE/dictionary") ;; Please create this directory manually.
(setq ispell-personal-dictionary "~/+STORE/dictionary/.pws")
;; use apsell as ispell backend
(setq-default ispell-program-name "aspell")
;; use American English as ispell default dictionary
(ispell-change-dictionary "american" t)

;; Always highlight search result
(setq isearch-allow-scroll t)
(setq isearch-lazy-count t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Orgs/")
(after! org
  (setq org-directory "~/Documents/Orgs/"
        org-agenda-files '("~/Documents/Orgs/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))

)

;; Automatically tangle config.org on save.
(defun efs/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/.doom.d/config.org"))
    ;;Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))
(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'after-save-hook 'efs/org-babel-tangle-config)))

(add-hook 'org-mode-hook
          (lambda ()
            (make-local-variable 'display-line-numbers-type)
            (setq display-line-numbers-type t)))

(add-hook 'org-mode-hook
        (lambda ()
          (org-superstar-mode 1)))
(after! org
  (require 'org-bullets)  ; Nicer bullets in org-mode
  (setq
   org-ellipsis "⤵"
   org-log-done 'time
   ;;org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")
   org-superstar-headline-bullets-list '("⁖")
   org-superstar-item-bullet-alist

   ;;'((?- . ?☭)
   '((?- . ?➮)
     (?+ . ?⭐)
     (?* . ?•))
   org-hide-emphasis-markers t ;; /emphasis/ -> emphasis
   org-todo-keyword-faces
   '(("TODO" . org-warning)
     ("OUTLINE" . "#a6ba66"); Hint:google 'hex color' to use color picker~
     ("DRAFT" . "#d274db")
     ("REVIEW" . "#ff9e54")
     ("ACCEPTED" . "#5ba882")
     ("DONE" . "#23872d"))
   org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
   '((sequence "TODO(t)" "|" "DONE(d)")
     (sequence "OUTLINE(o)" "DRAFT(f)" "REVIEW(r)" "|" "ACCEPTED") ; for writing documents
     (sequence "|" "CANCELED(c)")))
   )
)

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))
(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;; TODO related settings.
;; Recursively summarize TODO status.
(defun org-summary-todo (n-done n-not-done)
      "Switch entry to DONE when all subentries are done, to TODO otherwise."
      (let (org-log-done org-log-states)   ; turn off logging
        (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(after! org
  (setq
   org-todo-keyword-faces
   '(("TODO" . org-warning)
     ("OUTLINE" . "#a6ba66"); Hint:google 'hex color' to use color  picker~
     ("DRAFT" . "#d274db")
     ("REVIEW" . "#ff9e54")
     ("ACCEPTED" . "#5ba882")
     ("DONE" . "#23872d"))
   org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
   '((sequence "TODO(t)" "|" "DONE(d)")
     (sequence "OUTLINE(o)" "DRAFT(f)" "REVIEW(r)" "|" "ACCEPTED") ; for writing documents
     (sequence "|" "CANCELED(c)"))))

;(sequence "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED") not for now~

;;          (sequence
;;           "TODO(t)"           ; A task that is ready to be tackled
;;           "BLOG(b)"           ; Blog writing assignments
;;           "GYM(g)"            ; Things to accomplish at the gym
;;           "PROJ(p)"           ; A project that contains other tasks
;;           "VIDEO(v)"          ; Video assignments
;;           "WAIT(w)"           ; Something is holding up this task
;;           "|"                 ; The pipe necessary to separate "active" states and "inactive" states
;;           "DONE(d)"           ; Task has been completed
;;           "CANCELLED(c)" ) ; Task has been cancelled

(defun org-export-latex-no-toc (depth)
    (when depth
      (format "%% Org-mode is exporting headings to %s levels.\n"
              depth)))
(setq org-export-latex-format-toc-function 'org-export-latex-no-toc)

;; PDF export settings. Using xelatex and bibtex.
(with-eval-after-load 'ox-latex
  (setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f")))
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

;; Ignore table of content
(setq org-export-latex-format-toc-function 'org-export-latex-no-toc)

;; Clean temporary files
(setq org-latex-logfiles-extensions (quote ("lof" "lot" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))

;; Add "acmart" document class

(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("acmart" "\\documentclass{acmart}
                 [NO-DEFAULT-PACKAGES]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ))
  (defun org-export-latex-no-toc (depth)
    (when depth
      (format "%% Org-mode is exporting headings to %s levels.\n"
              depth))))

(setq org-ref-completion-library 'org-ref-ivy-cite)
(require 'org-ref)
(setq org-ref-ivy-cite-re-builder nil)
;; Set org-ref path.
(setq reftex-default-bibliography "/Users/Chris/Documents/Zotero/My_Library.bib")
;; Setup writing in LaTeX.
;; ref:https://iflysib.unlp.edu.ar/tomas/en/blog/reference-management.html
(setq helm-bibtex-bibliography '("/Users/Chris/Documents/Zotero/My_Library.bib"))
(setq org-ref-default-bibliography '("/Users/Chris/Documents/Zotero/My_Library.bib"))
(after! org
  (define-key org-mode-map (kbd "C-c <C-i>") 'org-mark-ring-goto)
;;  (define-key org-mode-map (kbd "C-c C-;") 'org-ref-helm-insert-cite-link))
  (define-key org-mode-map (kbd "C-c C-;") 'org-ref-ivy-insert-cite-link))

(setq org-journal-date-prefix "#+TITLE:"
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")

(add-hook 'org-mode-hook 'org-roam)
(setq org-roam-directory "~/Documents/Orgs/roam")
(setq org-roam-completion-everywhere t)

(add-hook 'org-mode-hook 'turn-on-flyspell)

;; md-roam
(use-package! md-roam ; load immediately, before org-roam
  :config
  (setq md-roam-file-extension-single "md"))
  ;you can omit this if md, which is the default.

;; markdown setup
(setq markdown-enable-wiki-links t)
(setq markdown-enable-math t)

(add-hook 'TeX-mode-hook
          (lambda() (define-key TeX-mode-map "\C-ch" 'helm-bibtex)))

(setq bibtex-completion-bibliography '("/Users/Chris/Documents/Zotero/My_Library.bib"))
;; Path to Zotero pdfs. "file" is a field in zotero generated .bib files.
(setq bibtex-completion-pdf-field "file")
(setq bibtex-completion-pdf-symbol "⌘")
(setq bibtex-completion-notes-symbol "✎")
(setq bibtex-completion-additional-search-fields '(journal,booktitle))

(setq bibtex-completion-display-formats
    '((article       . "${=type=:3} ${year:4} ${title:125} ${author} ${journal:40}")
      (inbook        . "${=type=:3} ${year:4} ${title:125} ${author} Chapter ${chapter:32}")
      (incollection  . "${=type=:3} ${year:4} ${title:125} ${author} ${booktitle:40}")
      (inproceedings . "${=type=:3} ${year:4} ${title:125} ${author} ${booktitle:40}")
      (t             . "${=type=:3} ${year:4} ${title:125} ${author}")))
