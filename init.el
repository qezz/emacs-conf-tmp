;; -*- mode: emacs-lisp -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar running-windows (eq system-type 'windows-nt))
(defvar running-x (eq window-system 'x))
(defvar running-mac (eq window-system 'ns))

(when (and (file-exists-p "~/.emacs.d/site-start.el") (not (symbol-function 'update-all-autoloads)))
  (load "~/.emacs.d/site-start.el"))

(when (file-exists-p "~/.emacs.d/site-lisp/loaddefs")
  (load "~/.emacs.d/site-lisp/loaddefs"))

(load "cyrillic-without-yo.el")

(when running-mac
  (set-input-method 'russian-computer)
  (deactivate-input-method)
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH") ":/Library/TeX/texbin"))
  (setenv "RUST_SRC_PATH" "/Users/sergey-mishin/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src")
  (setq exec-path (append '("/usr/local/bin") exec-path '("/Library/TeX/texbin"))))

(when running-windows
  (set-input-method 'russian-computer)
  (deactivate-input-method)
  (setenv "PATH" (concat (getenv "PATH") ";C:\\texlive\\2014\\bin\\win32;C:\\MinGW\\bin;C:\\MinGW\\msys\\1.0\\bin"))
  (setq exec-path (append exec-path '("C:/texlive/2014/bin/win32" "C:/MinGW/bin" "C:/MinGW/msys/1.0/bin")))
  (prefer-coding-system 'windows-1251)
  (prefer-coding-system 'utf-8))

(when running-windows
  (set-default-font "DejaVu Sans Mono-11")
  (add-to-list 'default-frame-alist
               '(font . "DejaVu Sans Mono-11")))

(when running-mac
  (set-fontset-font t 'cyrillic (font-spec :name "Monaco")))


;;matlab
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

(require 'custom)
(when (file-exists-p "~/.emacs.d/themes")
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes"))

(load-theme 'spacemacs-light t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("xelatex shell-escaped" "xelatex --shell-escape -8bit %t" TeX-run-TeX nil t)
     ("xelatex shell-escaped-no-tabs" "xelatex --shell-escape %t" TeX-run-TeX nil t)
     ("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t t :help "Run mendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(c-cleanup-list
   (quote
    (scope-operator brace-else-brace brace-elseif-brace brace-catch-brace empty-defun-braces)))
 '(c-default-style
   (quote
    ((java-mode . "java")
     (awk-mode . "awk")
     (other . "bsd"))))
 '(c-echo-syntactic-information-p nil)
 '(c-hanging-braces-alist
   (quote
    ((block-close . c-snug-do-while)
     (statement-cont)
     (substatement-open after)
     (brace-list-open)
     (brace-entry-open)
     (extern-lang-open after)
     (namespace-open after)
     (namespace-close)
     (module-open after)
     (composition-open after)
     (inexpr-class-open after)
     (inexpr-class-close before)
     (arglist-cont-nonempty))))
 '(c-offsets-alist
   (quote
    ((arglist-intro . ++)
     (arglist-cont . 0)
     (arglist-cont-nonempty . ++)
     (inher-intro . ++)
     (member-init-cont . 0)
     (statement-cont . ++)
     (substatement-open . 0))))
 '(c-require-final-newline
   (quote
    ((c-mode . t)
     (c++-mode . t)
     (objc-mode . t)
     (java-mode . t)
     (erlang-mode . t)
     (haskell-mode . t)
     (html-mode . t))))
 '(column-number-mode t)
 '(compilation-read-command nil)
 '(custom-safe-themes
   (quote
    ("3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" "32ffeb13f3c152300d14757b431967e63da005f54712dad6a2f8b8b33fb94bac" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "2b8dff32b9018d88e24044eb60d8f3829bd6bbeab754e70799b78593af1c3aba" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" "6f441c0e5d8199f08eb4b73e9c697710282bcae95e5925b7649ddfa8cea2e24c" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "f9574c9ede3f64d57b3aa9b9cef621d54e2e503f4d75d8613cbcc4ca1c962c21" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "39ba912fe6f2540f7082bbd460c7c800bb2b4cc2350af913c0896c0bf12f4902" default)))
 '(fci-rule-color "#14151E")
 '(font-lock-mode t t (font-lock))
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(package-selected-packages
   (quote
    (groovy-mode yaml-mode dockerfile-mode puppet-mode glsl-mode company-racer sourcerer-theme eink-theme ample-theme airline-themes ahungry-theme afternoon-theme abyss-theme dracula-theme racket-mode rudel gh-md flymd auctex-lua auctex-latexmk auctex hindent ghci-completion ghc-imported-from ghc dante "spacemacs-theme" spacemacs-theme hy-mode ess-view ess-smart-underscore ess-smart-equals ess-R-object-popup ess-R-data-view ess erlang cider racer smart-tabs-mode slime matlab-mode markdown-mode)))
 '(pulse-flag (quote never))
 '(red "#ffffff")
 '(require-final-newline t)
 '(scroll-bar-mode (quote right))
 '(scroll-conservatively 1000000)
 '(scroll-preserve-screen-position 1)
 '(scroll-step 1)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(toolbar-visible-p nil)
 '(transient-mark-mode t)
 '(truncate-lines t)
 '(truncate-partial-width-windows nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil)
 '(visible-bell t)
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tex-verbatim ((t (:inherit nil)))))

(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(setq split-width-threshold most-positive-fixnum)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(if running-x
    (global-set-key [f13] 'toggle-input-method))

(icomplete-mode 99)

(windmove-default-keybindings 'meta)
(unless (or running-windows running-x)
  (global-set-key (kbd "ESC <left>") 'windmove-left)
  (global-set-key (kbd "ESC <right>") 'windmove-right)
  (global-set-key (kbd "ESC <down>") 'windmove-down)
  (global-set-key (kbd "ESC <up>") 'windmove-up))

(unless window-system
  (xterm-mouse-mode t))

;; Auto indent yanked code
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       ;latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(push '("<\\?xml\\b[^>]*\\bencoding=\"utf-8\"[^>]*\\?>" . utf-8) auto-coding-regexp-alist)

(when running-windows
  (defun insert-uuid ()
    "Insert UUID in upper case to current buffer using `uuidgen' for generation."
    (interactive)
    (save-excursion
      (if mark-active (kill-region (mark) (point)))
      (shell-command "uuidgen -c" t)
      (forward-char 36)
      (delete-char 1)))
  (define-key global-map "\C-cg" 'insert-uuid))

(delete-selection-mode t)

(require 'find-file)

(setq ff-other-file-alist
      '(("\\.cpp$" (".hpp" ".h"))
        ("\\.c$" (".h" ".hpp"))
        ("\\.hpp$" (".cpp" ".c"))
        ("\\.h$" (".cpp" ".c"))))
(put 'ff-search-directories 'safe-local-variable 'listp)

(setf completion-ignored-extensions
      (append completion-ignored-extensions
              '(".hi" ".pdf" ".o")))

(when (file-exists-p "~/.emacs.d/modes")
  (mapc #'load (directory-files "~/.emacs.d/modes" t "\\.el$")))

(when (locate-library "mmm-mode")
  (require 'mmm-mode)
  (setq mmm-global-mode 'maybe)
  (when (locate-library "php-mode")
    (mmm-add-mode-ext-class nil "\\.php3?\\'" 'html-php)
    (mmm-add-classes
     '((html-php
        :submode php-mode
        :front "<\\?\\(php\\)?"
        :back "\\?>"))))
  (mmm-add-classes
   '((embedded-erlang
      :submode erlang-mode
      :front "<erl>"
      :back "</erl>")))
  (set-variable 'mmm-global-classes '(universal embedded-erlang)))

(when (locate-library "delete-trailing-whitespace-mode")
  (require 'delete-trailing-whitespace-mode))

(when (locate-library "sgml-mode")
  (require 'sgml-mode))

(when (locate-library "gtags")
  (setq gtags-suggested-key-mapping t)
  (setq gtags-disable-pushy-mouse-mapping t))

(defun my-imenu-helper()
  (let (index-alist
        (result t)
        alist)
    ;; Create a list for this buffer only when needed.
    (while (eq result t)
      (setq index-alist (imenu--make-index-alist))
      (setq result (imenu--mouse-menu index-alist t))
      (and (equal result imenu--rescan-item)
           (imenu--cleanup)
           (setq result t imenu--index-alist nil)))
    result))

(defun my-imenu() (interactive) (imenu (my-imenu-helper)))

(defvar ff-search-directories-extra nil "Extra directories to search other files")
(make-variable-buffer-local 'ff-search-directories-extra)
(put 'ff-search-directories-extra 'safe-local-variable 'listp)

;; TODO: Improve handling by adding check for subdirs
(add-hook 'hack-local-variables-hook
          '(lambda ()
             (when ff-search-directories-extra
               (let ((current-list (if (symbolp ff-search-directories)
                                       (symbol-value ff-search-directories)
                                     ff-search-directories)))
                 (setq ff-search-directories (append ff-search-directories-extra current-list))))))

(when (locate-library "fic-mode")
  (require 'fic-mode)
  (add-hook 'prog-mode-hook 'fic-mode)
  (push '(fic-face . font-lock-warning-face) face-remapping-alist)
  (push "HACK" fic-highlighted-words))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (setq show-trailing-whitespace t)
             (delete-trailing-whitespace-mode 'clean)
             ))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (setq show-trailing-whitespace t)
             (delete-trailing-whitespace-mode 'clean)
             ))

(add-hook 'makefile-mode-hook
          '(lambda ()
             (local-set-key (kbd "<f7>") 'compile)
             (modify-syntax-entry ?_ "w")
             (delete-trailing-whitespace-mode 'clean)
             ))

(add-hook 'compilation-mode-hook
          '(lambda ()
             (local-set-key (kbd "<f7>") 'recompile)))

(add-hook 'python-mode-hook
          '(lambda ()
             (define-key python-mode-map (kbd "<RET>") 'newline-and-indent)
             (modify-syntax-entry ?_ "w")
             (setq show-trailing-whitespace t)
             (delete-trailing-whitespace-mode 'clean)
             ))

(add-hook 'haskell-mode-hook
          '(lambda ()
             (define-key haskell-mode-map [?\C-c ?\C-r] 'inferior-haskell-reload-file)
             (setq show-trailing-whitespace t)
             (delete-trailing-whitespace-mode 'clean)
             ))

(add-hook 'erlang-mode-hook
          '(lambda ()
             (define-key erlang-mode-map (kbd "<RET>") 'newline-and-indent)
             (setq show-trailing-whitespace t)
             (delete-trailing-whitespace-mode 'clean)
             ))

(add-hook 'rust-mode-hook
          '(lambda ()
             (setq show-trailing-whitespace t)
             (delete-trailing-whitespace-mode 'clean)
             (racer-mode)
             ))

;; (add-hook 'racer-mode-hook
;;           #'eldoc-mode)

(add-hook 'racer-mode-hook
          '(lambda ()
             (company-mode)))

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") '(lambda () (interactive) (company-indent-or-complete-common)))
(setq company-tooltip-align-annotations t)

(setq auto-mode-alist
      (append
       '(("\\.h$" . c++-mode))
       '(("\\.[wW][xX][sS]\\'" . xml-mode))
       '(("\\.[mM][aA][kK]\\'" . makefile-gmake-mode))
       '(("[mM][aA][kK][eE][fF][iI][lL][eE]\\'" . makefile-gmake-mode))
       '(("\\.[hg]s$"  . haskell-mode))
       '(("\\.hi$"     . haskell-mode))
       '(("\\.l[hg]s$" . literate-haskell-mode))
       '(("/COMMIT_EDITMSG$" . text-mode))
       '(("/TAG_EDITMSG$" . text-mode))
       '(("\\.org$" . org-mode))
       '(("\\.yaws$" . html-mode))
       '(("\\.php3?$" . html-mode))
       '(("\\.m$" . matlab-mode))
       auto-mode-alist))

(when (locate-library "template")
  (require 'template)
  (add-to-list 'template-find-file-commands 'ff-find-other-file)
  (setq template-expansion-alist '(("CPP_HEADER_GUARD" (insert (let ((dir (car (reverse (split-string (car template-file) "/" t)))))
                                                                 (if (/= 0 (length dir))
                                                                     (setq dir (concat dir "_")))
                                                                 (let ((filename (concat dir (nth 2 template-file) (nth 4 template-file))))
                                                                   (do ((index (- (length filename) 1) (- index 1))
                                                                        (result nil)
                                                                        (need-separator nil))
                                                                       ((< index 0) (apply 'string result))
                                                                     (let ((case-fold-search nil))
                                                                       (cond ((string-match-p "[[:upper:]]" (substring filename index (+ index 1)))
                                                                              (push (aref filename index) result)
                                                                              (if (/= 0 index)
                                                                                  (setq need-separator t)))
                                                                             ((char-equal ?. (aref filename index))
                                                                              (push ?_ result)
                                                                              (setq need-separator nil))
                                                                             ((char-equal ?_ (aref filename index))
                                                                              (push ?_ result)
                                                                              (setq need-separator nil))
                                                                             (t
                                                                              (if need-separator
                                                                                  (push ?_ result))
                                                                              (push (upcase (aref filename index)) result)
                                                                              (setq need-separator nil)))))))))))
  (template-initialize))

(when (locate-library "haskell-mode")
  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  (setq haskell-font-lock-symbols t))

(when (locate-library "org-install")
  (require 'org-install)
  (setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)" "CANCELLED(c@/!)"))))

  (setq org-agenda-files '("~/agenda"))

  (add-hook 'org-mode-hook
            '(lambda ()
               (flyspell-mode t)
               ))
  ;;(setq org-log-done 'time)
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb))

;; Bookmarks
(global-set-key [f2] 'bookmark-jump)
(global-set-key [C-f2] 'bookmark-set)
(global-set-key [M-f2] 'bookmark-bmenu-list)
(setq bookmark-save-flag nil)

(defvar gud-run-args ""
  "Arguments for running program inside GDB")

(defvar gud-run-args-history nil
  "History for arguments for running program inside GDB")

(add-hook 'gdb-mode-hook
          '(lambda ()
             (global-set-key (kbd "<f10>") 'gud-next)
             (global-set-key (kbd "<f11>") 'gud-step)
             (global-set-key (kbd "<f5>") 'gud-cont)
             (global-set-key (kbd "C-<f5>") '(lambda ()
                                               (interactive)
                                               (switch-to-buffer gud-comint-buffer)
                                               (let ((args (if current-prefix-arg
                                                               (read-shell-command "Run with args: " gud-run-args
                                                                                   (if (equal (car gud-run-args-history) gud-run-args)
                                                                                       '(gud-run-args-history . 1)
                                                                                     'gud-run-args-history))
                                                             gud-run-args)))
                                                 (unless (equal args gud-run-args)
                                                   (setq gud-run-args args))
                                                 (gud-call (concat "run " args)))))
             (global-set-key (kbd "S-<f5>") 'gud-finish)))


(when (locate-library "w3m")
  (require 'w3m-load))

(when (or (locate-library "slime") (locate-library "~/quicklisp/slime-helper"))
  (when (locate-library "~/quicklisp/slime-helper")
    (load "~/quicklisp/slime-helper"))
  (require 'slime)
  (when running-windows
    (add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))
    (add-to-list 'slime-lisp-implementations '(ketos ("~/sources/ketos/target/release/ketos")))
    (setq slime-default-lisp 'sbcl))
  (when running-mac
    (add-to-list 'slime-lisp-implementations '(ccl ("ccl64" "-K" "utf8")))
    (add-to-list 'slime-lisp-implementations '(sbcl ("sbcl"))) ;'(ccl ("ccl64" "-K" "utf8")))
    (add-to-list 'slime-lisp-implementations '(ketos ("~/sources/ketos/target/release/ketos")))
    (setq slime-default-lisp 'ccl))
  (slime-setup '(slime-fancy slime-asdf))
  (when (locate-library "closure-template-html-mode")
    (add-to-list 'auto-mode-alist
                 '("\\.tmpl$" . closure-template-html-mode)))
  (setq common-lisp-hyperspec-root "file:///home/alexey/docs/lisp/HyperSpec/")
  (when (locate-library "w3m")
    (require 'hyperspec)
    (defun hyperspec-lookup (&optional symbol-name)
      (interactive)
      (let ((browse-url-browser-function 'w3m-browse-url))
        (if symbol-name
            (common-lisp-hyperspec symbol-name)
          (call-interactively 'common-lisp-hyperspec)))))
  (add-hook 'slime-mode-hook
            '(lambda ()
               (local-set-key (kbd "<RET>") 'newline-and-indent)
               (delete-trailing-whitespace-mode 'clean)
               ;;(unless (slime-connected-p)
               ;;  (save-excursion (slime)))))
               )))

(when (locate-library "mof-mode")
  (require 'mof-mode))

(when (locate-library "closure-template-html-mode")
  ;;(autoload 'closure-template-html-mode "closure-template-html-mode" "Major mode for editing Closure Templates" t)
  (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . closure-template-html-mode))
  (add-hook 'closure-template-html-mode-hook
            '(lambda ()
               (define-key closure-template-html-mode-map (kbd "C-c C-l") 'closure-template-compile)
               (setq show-trailing-whitespace t)
               (delete-trailing-whitespace-mode 'clean)
               )))

(when (locate-library "uniquify")
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'reverse)
  (setq uniquify-separator "/")
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-ignore-buffers-re "^\\*")
  (setq post-forward-angle-brackets 'post-forward-angle-brackets))

(when running-mac
  ;;% CLI matlab from the shell:
  ;;% /Applications/MATLAB_R2016a.app/bin/matlab -nodesktop
  ;;%
  ;;% elisp setup for matlab-mode:
  (setq matlab-shell-command "/Applications/MATLAB_R2016a.app/bin/matlab")
  (setq matlab-shell-command-switches (list "-nodesktop")))


(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(5 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time'))


(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line



;; use python3
;;(setf python-shell-interpreter "python")
(require 'python)

(when running-mac
  (defun python-shell-parse-command ()
    "Return the string used to execute the inferior Python process."
    "/usr/local/bin/python3 -i")
  (setq python-shell-interpreter "python3")
  (setq python-shell-prompt-detect-failure-warning nil)
  )

;; Fix for "native completion" warning when using python3
(defun python-shell-completion-native-try ()
  "Return non-nil if can trigger native completion"
  (with-eval-after-load 'python
    '(let ((python-shell-completion-native-enable t)
           (python-shell-completion-native-output-timeout
            python-shell-completion-native-try-output-timeout))
       (python-shell-completion-native-get-completions
        (get-buffer-process (current-buffer))
        nil "_")))
  )

;; HACK
;; Make Python think Emacs uses UTF8 (it is really)
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")


;; Make remote editing greate again
(setq tramp-default-method "ssh")
;; Usage: [C-x C-f] /method:user@remotehost:filename


(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/tmp/savehist")

;; R config
(when (and
       (locate-library "ess")
       (locate-library "ess-view")
       (locate-library "ess-s-l"))
  (require 'ess)
  ;; (require 'ess-R-data-view)
  ;; (require 'ess-R-object-popup)
  ;; (require 'ess-smart-underscore)
  ;; (require 'ess-smart-equals)
  (require 'ess-view)
  (require 'ess-s-l)
  (ess--unset-smart-S-assign-key)       ; explicitly unset smart assign key
  )


(defun switch-theme (theme)
  "Disable currently enables themes and load provided one"
  (interactive
   (list
    (intern (completing-read "Switch to custom theme: "
			     (mapcar 'symbol-name
				     (custom-available-themes))))
    ;;nil nil))
    ))
  (mapcar 'disable-theme custom-enabled-themes)
  (load-theme theme)
  (message "Theme %s" theme))

(defun useless-fn (arg)
  "Prints arg to minibuffer"
  (interactive "MWrite something: ")
  (message "Input: %s" arg))



;;(setq package-list '())
(defvar new-packages-list nil)

(if (package-installed-p 'spacemacs-theme)
    (switch-theme 'spacemacs-light)
  (add-to-list 'new-packages-list 'spacemacs-theme))

;; update elpa cache
(unless package-archive-contents
  (package-refresh-contents))

;; install new packages
(dolist (package new-packages-list)
  (unless (package-installed-p package)
    (package-install package)))


(put 'downcase-region 'disabled nil)



;; Auctex
(setq LaTeX-verbatim-environments
      '("verbatim" "verbatim*" "lstlisting" "minted" "rframe" "cxxframe" "bashframe" "codeframe"))
