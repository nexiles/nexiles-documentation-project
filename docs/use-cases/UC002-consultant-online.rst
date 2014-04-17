.. _UC002:

============================================
UC002: Consultant views Documentation online
============================================

:Author:    Jan Müller
:Date:      2014-04-16
:State:     **draft**

Description
===========

A consultant wants to access a new documentation in the doc app. The documentation is not yet downloaded to the local app directory.

Actors
======

**Anton**
    A Nexiles consultant working in his own office. He wants to view a new documentation.

Rationale
=========

To view new documentation for their products the consultants can open the doc app and see which documentation is not yet downloaded into their local app directory. When they open the new documentation the files are automatically downloaded for offline use.

Preconditions
=============

- The app must have access to the internet.
- The documentation must exist on the web service.
- The login credentials must be stored in the app.
- Anton must have the permission to access the documentation.

Invariants
==========

- Older versions of the same project stored in the app must not be overwritten.

Postcondition
=============

- The HTML files and the zip file must be stored in a new subdirectory for the new version.
- The new version of the documentation must be viewable.
- The new version has the same icon as the other documents.

Normal Flow
===========

Anton starts the doc app from nexiles|starter clicking on its icon. The app opens up and shows all released documentations.
As Anton has also access to internal files he switches to a view of all latest documentation where he finds a new documentation. The icon of the new documentation indicates that he has not yet downloaded its files.
He clicks on the icon and the download of the documentation begins showing him a the progress of the download in a small indicator.
After the download has finished the documentation opens up in a new tab. The focus lies on this tab which fills the whole space of the app.
Anton takes a look at the contents of the documentation and navigates to some of the new parts.
Then he closes the documentation again by clicking on a close button in the tab bar.
He sees again the grid of icons where the documentation he just viewed now has the same icon as the other older documents.

Notes
=====

- The login credentials saved in the app are checked by the web service every time the index is updated or new files are downloaded.
- The index thus the information which apps to display is updated with the start of the app.

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

