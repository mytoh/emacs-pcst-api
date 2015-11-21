;;; pcst-api-tests --- pcst-api-tests -*- lexical-binding: t; coding: utf-8; -*-

;;; Commentary:

;;; Code:

(ert-deftest pcst-api-test-get-channels
    (cl-letf ((api (pcst-api-init :host "peca2.koti")))
      (pcst-api-request api "getChannels" )))

;;; pcst-api-tests.el ends here
