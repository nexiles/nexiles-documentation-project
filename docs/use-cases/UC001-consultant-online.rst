.. _UC001:

============================================
UC001: Consultant views Documentation online
============================================

:Author:    Jan Müller
:Date:      2014-04-16

Description
===========

A consultant wants to access a new documentation in the doc app. The
documentation is not yet downloaded to the local app directory.

Actors
======

**Karl**
    A Nexiles consultant working in his own office. He wants to view a new
    documentation.

Rationale
=========

To view new documentation for their products the consultants can open the doc
app and see which documentation is not yet downloaded into their local app
directory. When they open the new documentation the files are automatically
downloaded for offline use.

Preconditions
=============

- The app must have access to the web service.
- The requested documentation must exist on the web service.
- An authentication key must be stored in the app.
- Karl must have the permission to access the documentation.

Invariants
==========

- Older versions of the same project stored in the app must not be
  overwritten.

Postcondition
=============

- The HTML files and the zip file must be stored in a new subdirectory for the
  new version or the new project.
- The new documentation must be viewable in the app.
- The new documentation's icon no longer indicates that the document is not
  stored locally.

Normal Flow
===========

Karl starts the doc app from nexiles|starter by clicking on its icon. The app
opens up and shows all released documentation.

As Karl has also access to internal files he switches to a view of all latest
documentation where he finds the new documentation. The icon of the new
documentation indicates that he has not yet downloaded its files.

He clicks on the icon and the download of the documentation begins showing him
a the progress of the download in a small indicator.

After the download has finished the documentation opens up in a new tab. The
focus lies on this tab which fills the whole space of the app. Karl takes a
look at the contents of the documentation and navigates to some of the new
parts. Then he closes the documentation again by clicking on a close button in
the tab bar.

He sees again the grid of icons where the documentation he just viewed is
represented by its regular icon indicating that the document is now stored
locally.

Notes
=====

- The login credentials saved in the app are checked by the web service every
  time the index is updated or new files are downloaded.

- The index and thus the information which documents are displayed is updated
  with the start of the app.

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

