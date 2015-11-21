;;; pcst-apil --- pcst-apil -*- lexical-binding: t; coding: utf-8; -*-

;;; Commentary:

;;; Code:

(require 'cl)
(require 'json)
(require 'url)
(require 'glof)

(cl-defun pcst-api-init (&key host port)
  (cl-letf ((host (or host "localhost"))
            (port (or port "7144")))
    (glof:plist
     :url (concat
           "http://" host ":" port "/api/1")
     :host host
     :port port)))

(cl-defun pcst-api-request (api method)
  (cl-letf* ((json-string
              (json-encode-list
               (glof:plist
                :jsonrpc "2.0"
                :method method
                :id (random t)
                :x-requested-with "XMLHttpRequest")))
             (url-request-method "POST")
             (url-request-data
              json-string))
    (with-current-buffer
        (url-retrieve-synchronously
         (glof:get api :url))
      (goto-char (point-min))
      (re-search-forward "\n\n")
      (json-read))))


(provide 'pcst-api)


;;; pcst-apil.el ends here
