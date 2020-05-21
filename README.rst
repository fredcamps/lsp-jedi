========
lsp-jedi
========

A Emacs LSP client for Python Jedi Language Server
(a `lsp` client plugin for `lsp-mode` `Emacs` extension).

Features
--------
* Renaming/Refactoring
* Auto-completion
* Definitions
* References
* Document Highlight
* Document Symbols
* Hover Request
* Publish Diagnostics
* Signature Help
* Symbols

Install from repository
-----------------------
```
M-x package-install lsp-jedi
```

Configure
---------
.. code-block:: lisp
   :linenos:

   (use-package lsp-jedi
     :ensure t
     :pin melpa
     :config
     (with-eval-after-load "lsp-mode"
     (add-to-list 'lsp-enabled-clients 'jedi)))

License
-------
This project is licensed under the GNU GPL License version 3 - see the `LICENSE` file for details

.. _`Emacs`: https://www.gnu.org/software/emacs/
.. _`Jedi Language Server`: https://pypi.org/project/jedi-language-server/
.. _`lsp`: https://langserver.org/
.. _`lsp-mode`: https://github.com/emacs-lsp/lsp-mode
.. _`LICENSE`: https://github.com/fredcamps/lsp-jedi/blob/master/LICENSE
