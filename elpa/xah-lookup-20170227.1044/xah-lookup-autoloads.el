;;; xah-lookup-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "xah-lookup" "xah-lookup.el" (0 0 0 0))
;;; Generated autoloads from xah-lookup.el

(autoload 'xah-lookup-google "xah-lookup" "\
Lookup current word or text selection in Google Search.
Version 2017-02-09

\(fn &optional *WORD)" t nil)

(autoload 'xah-lookup-wikipedia "xah-lookup" "\
Lookup current word or text selection in Wikipedia.
Version 2017-02-09

\(fn &optional *WORD)" t nil)

(autoload 'xah-lookup-word-definition "xah-lookup" "\
Lookup definition of current word or text selection in URL `http://www.thefreedictionary.com/curlicue'.
Version 2017-02-09

\(fn &optional *WORD)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xah-lookup" '("xah-lookup-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; xah-lookup-autoloads.el ends here
