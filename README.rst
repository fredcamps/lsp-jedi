========
lsp-jedi
========

A `Emacs`_  client for Python `Jedi Language Server`_
(`LSP`_ client plugin for `lsp-mode`_  `Emacs`_ extension).

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

.. code-block::

   M-x package-install lsp-jedi


Configure
---------

.. code-block:: emacs-lisp

  (use-package lsp-jedi
    :ensure t
    ;; Uncomment followings if you've installed python-lsp-server, 
    ;; which is the Language Sever for pyls.
    ; :config
    ; (with-eval-after-load "lsp-mode"
    ;  (add-to-list 'lsp-disabled-clients 'pyls))
    )


Virtual Environment Settings (built-in venv module)
---------------------------------------------------

.. code-block:: emacs-lisp

   (setq lsp-jedi-workspace-extra-paths
     (vconcat lsp-jedi-workspace-extra-paths
              ["/home/me/src/my-project/.venv/lib/python3.10/site-packages"]))


License
-------
This project is licensed under the GNU GPL License version 3 - see the `LICENSE`_ file for details

.. _`Emacs`: https://www.gnu.org/software/emacs/
.. _`Jedi Language Server`: https://pypi.org/project/jedi-language-server/
.. _`LSP`: https://langserver.org/
.. _`lsp-mode`: https://github.com/emacs-lsp/lsp-mode
.. _`LICENSE`: https://github.com/fredcamps/lsp-jedi/blob/master/LICENSE
