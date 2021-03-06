(deftheme my-modus
  "Created 2021-01-06.")

(custom-theme-set-variables
 'my-modus
 '(org-src-block-faces nil))

(custom-theme-set-faces
 'my-modus
 '(cursor ((t (:background "#000000"))))
 '(fixed-pitch ((t (:family "SauceCodePro Nerd Font Mono" :foundry "nil" :width normal :height 200 :weight normal :slant normal))))
 '(variable-pitch ((t (:family "Ubuntu" :foundry "nil" :width normal :height 200 :weight normal :slant normal))))
 '(escape-glyph ((t (:foreground "#8b1030"))))
 '(homoglyph ((t (:foreground "#702f00"))))
 '(minibuffer-prompt ((t (:foreground "#005a5f"))))
 '(highlight ((t (:inherit (modus-theme-subtle-blue)))))
 '(region ((t (:extend t :foreground "#000000" :background "#bcbcbc"))))
 '(shadow ((t (:foreground "#505050"))))
 '(secondary-selection ((t (:extend t :inherit (modus-theme-special-cold)))))
 '(trailing-whitespace ((t (:background "#ff8892"))))
 '(font-lock-builtin-face ((t (:foreground "#8f0075" :inherit (modus-theme-bold)))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:slant italic :foreground "#505050" :inherit (modus-theme-slant)))))
 '(font-lock-constant-face ((t (:foreground "#0000c0"))))
 '(font-lock-doc-face ((t (:foreground "#2a486a" :inherit (modus-theme-slant)))))
 '(font-lock-function-name-face ((t (:foreground "#721045"))))
 '(font-lock-keyword-face ((t (:slant italic :foreground "#5317ac" :inherit (modus-theme-bold)))))
 '(font-lock-negation-char-face ((t (:foreground "#813e00" :inherit (modus-theme-bold)))))
 '(font-lock-preprocessor-face ((t (:foreground "#a0132f"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#654d0f" :inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#8b1030" :inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "#2544bb"))))
 '(font-lock-type-face ((t (:foreground "#005a5f" :inherit (modus-theme-bold)))))
 '(font-lock-variable-name-face ((t (:foreground "#00538b"))))
 '(font-lock-warning-face ((t (:foreground "#702d1f" :inherit (modus-theme-bold)))))
 '(button ((t (:underline (:color foreground-color :style line) :foreground "#0000c0"))))
 '(link ((t (:inherit (button)))))
 '(link-visited ((t (:foreground "#5317ac" :inherit (button)))))
 '(fringe ((t (:foreground "#000000" :background "#ffffff"))))
 '(header-line ((t (:foreground "#2a2a2a" :background "#e5e5e5"))))
 '(tooltip ((t (:foreground "#000000" :background "#dde3f4"))))
 '(mode-line ((t (:box (:line-width 1 :color "#505050" :style nil) :foreground "#0a0a0a" :background "#d7d7d7"))))
 '(mode-line-buffer-id ((t (:inherit (bold)))))
 '(mode-line-emphasis ((t (:foreground "#0030b4" :inherit (bold)))))
 '(mode-line-highlight ((t (:box (:line-width -1 :color nil :style pressed-button) :inherit (modus-theme-active-blue)))))
 '(mode-line-inactive ((t (:box (:line-width 1 :color "#bcbcbc" :style nil) :foreground "#404148" :background "#efefef"))))
 '(isearch ((t (:inherit (modus-theme-intense-green bold)))))
 '(isearch-fail ((t (:inherit (modus-theme-refine-red)))))
 '(lazy-highlight ((t (:inherit (modus-theme-refine-cyan)))))
 '(match ((t (:inherit (modus-theme-special-calm)))))
 '(next-error ((t (:inherit (modus-theme-subtle-red)))))
 '(query-replace ((t (:inherit (modus-theme-intense-yellow bold)))))
 '(org-block ((t (:inherit fixed-pitch :extend t :background "#eeeeee" :foreground "#555555"))))
 '(org-block-begin-line ((t (:inherit fixed-pitch :extend t :background "#eeeeee" :foreground "#184034"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line :extend t))))
 '(default ((t (:family "SauceCodePro Nerd Font Mono" :foundry "nil" :width normal :height 200 :weight normal :slant normal :underline nil :overline nil :extend nil :strike-through nil :box nil :inverse-video nil :foreground "#000000" :background "#ffffff" :stipple nil :inherit nil)))))

(provide-theme 'my-modus)
