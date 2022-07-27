;; cabrillo-mode.el -- major mode for editing Cabrillo Log files
;; -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2022, Paul Schulz <paul@mawsonlakes.org>

;; Author: Paul Schulz <paul@mawsonlakes.org>
;; Version: 0.0.1
;; Created: 27 Jul 2022
;; Keywords: amateur-radio
;; Homepage: https://github.com/PaulSchulz/cabrillo-mode

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the
;; terms of the GNU General Public License version 3.

;;; Commentary:

;; short description here

;; full doc on how to use here

;;; Code:

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq cabrillo-font-lock-keywords
      (let* (
             ;; define several category of keywords
             (x-structure '("START-OF-LOG"
                            "END-OF-LOG"))
             (x-category '("CATEGORY-OPERASTOR"
                           "CATEGORY-ASSISTED"
                           "CATEGORY-BAND"
                           "CATEGORY-POWER"
                           "CATEGORY-MODE"
                           "CATEGORY-TRANSMITTER"
                           "CATEGORY-OVERLAY"))
             (x-contest '("CALLSIGN"
                          "CONTEST"
                          "CLAIMED-SCORE"
                          "OPERATORS"))
             (x-info '("CLUB"
                       "LOCATION"
                       "CREATED-BY"
                       "NAME"
                       "ADDRESS"
                       "ADDRESS-CITY"
                       "ADDRESS-STATE-PROVINCE"
                       "ADDRESS-COUNTRY"))
             (x-comment '("SOAPBOX"))
             (x-qso '("QSO"))

             ;; generate regex string for each category of keywords
             (x-structure-regexp (regexp-opt x-structure 'words))
             (x-category-regexp (regexp-opt x-category 'words))
             (x-contest-regexp (regexp-opt x-contest 'words))
             (x-info-regexp (regexp-opt x-info 'words))
             (x-comment-regexp (regexp-opt x-comment 'words))
             (x-qso-regexp (regexp-opt x-qso 'words)))
        `(
          (,x-structure-regexp . 'font-lock-type-face)
          (,x-category-regexp . 'font-lock-constant-face)
          (,x-contest-regexp . 'font-lock-constant-face)
          (,x-info-regexp . 'font-lock-builtin-face)
          (,x-comment-regexp . 'font-lock-function-name-face)
          (,x-qso-regexp . 'font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

;;;###autoload
(define-derived-mode cabrillo-mode fundamental-mode "cabrillo mode"
  ;;  "Major mode for editing Cabrillo log files."

  ;; code for syntax highlighting
  (setq font-lock-defaults '((cabrillo-font-lock-keywords))))

;; add the mode to the `features' list
(provide 'cabrillo-mode)

;;; cabrillo--mode.el ends here

;; (setq cabrillo-highlights
;;      '(("^.*:" . 'font-lock-function-name-face)))

;; (define-derived-mode cabrillo-mode fundamental-mode "cabrillo"
;;  "Major mode for editing Cabrillo log files."
;;  (setq font-lock-defaults '(cabrillo-highlights)))
