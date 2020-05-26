;;; lsp-jedi.el --- Jedi configuration               -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Fred Campos

;; Author: Fred Campos <fred.tecnologia@gmail.com>
;; Maintainer: Fred Campos
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1") (lsp-mode "6.0"))
;; Homepage: http://github.com/fredcamps/lsp-jedi
;; Keywords: language-server, tools, python, jedi, ide

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Jedi configuration

;;; Code:
(require 'lsp-mode)

(defgroup lsp-jedi nil
  "LSP support for Python, using Jedi Python Language Server."
  :group 'lsp-mode
  ;;:link '(url-link "https://github.com/fredcamps/lsp-jedi")
  :package-version '(lsp-mode . "6.1"))

(defcustom lsp-jedi-enable t
  "If non nill enable jedi-language-server."
  :type 'boolean
  :group 'lsp-jedi)

(defcustom lsp-jedi-executable-command "jedi-language-server"
  "Specify your jedi-language-server executable."
  :type 'boolean
  :group 'lsp-jedi)

(defcustom lsp-jedi-executable-args []
  "Specify the args list passed to your executable."
  :type '(repeat string)
  :group 'lsp-jedi)

(defcustom lsp-jedi-startup-message nil
  "If non nill enables jedi-language-server's message on startup.."
  :type 'bolean
  :group 'lsp-jedi)

(defcustom lsp-jedi-markup-kind-preferred nil
  "Type of markup."
  :type  '(choice (const :tag "plaintext" plaintext)
                  (const :tag "markdown" markdown)
                  (const :tag "none" nil))
  :group 'lsp-jedi)

(defcustom lsp-jedi-trace-server 'verbose
  "Trace server."
  :type '(choice (const :tag "off" nil)
                 (const :tag "messages" messages)
                 (const :tag "verbose" verbose))
  :group 'lsp-jedi)

(defcustom lsp-jedi-diagnostics-enable nil
  "If non nill enables diagnostics provided by Jedi."
  :type 'boolean
  :group 'lsp-jedi)

(defcustom lsp-jedi-diagnostics-did-open nil
  "When diagnostics are enabled, run on document open."
  :type 'boolean
  :group 'lsp-jedi)

(defcustom lsp-jedi-diagnostics-did-change nil
  "When diagnostics are enabled.
Run on in-memory document change (eg, while you're editing, without needing to save to disk)."
  :type 'boolean
  :group 'lsp-jedi)

(defcustom lsp-jedi-diagnostics-did-save nil
  "When diagnostics are enabled, run on document save (to disk)."
  :type 'boolean
  :group 'lsp-jedi)

(defcustom lsp-jedi-python-library-directories '("/usr/")
  "List of directories which will be considered to be libraries."
  :risky t
  :type '(repeat string)
  :group 'lsp-jedi
  :package-version '(lsp-mode . "6.1"))

(lsp-register-custom-settings
  '(("jedi.enable" lsp-jedi-enable)
    ("jedi.startupMessage" lsp-jedi-startup-message)
    ("jedi.markupKindPreferred" lsp-jedi-markup-kind-preferred)
    ("jedi.trace.server" lsp-jedi-trace-server)
    ("jedi.executable.command" lsp-jedi-executable-command)
    ("jedi.executable.args" lsp-jedi-executable-args)
    ("jedi.diagnostics.enable" lsp-jedi-diagnostics-enable)
    ("jedi.diagnostics.didOpen" lsp-jedi-diagnostics-did-open)
    ("jedi.diagnostics.didChange" lsp-jedi-diagnostics-did-change)
    ("jedi.diagnostics.didSave" lsp-jedi-diagnostics-did-save)))

(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection
                   (lambda () lsp-jedi-executable-command))
  :major-modes '(python-mode cython-mode)
  :priority -1
  :server-id 'jedi
  :library-folders-fn (lambda (_workspace) lsp-jedi-python-library-directories)
  :initialized-fn (lambda (workspace)
                    (with-lsp-workspace
                     workspace
                     (lsp--set-configuration (lsp-configuration-section "jedi"))))))

(provide 'lsp-jedi)
;;; lsp-jedi.el ends here
