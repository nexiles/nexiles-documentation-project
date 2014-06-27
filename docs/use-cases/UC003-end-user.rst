.. _UC003:

==================================
UC003: End-User views Documentaion
==================================

:Author:    Jan Müller
:Date:      2014-04-17

Description
===========

A customer of Nexiles wants to view the documentation for a product he uses.

Actors
======

**Anton**
    A Nexiles developer who just finished a new release.

**Otto**
    A customer working at his office with internet access.

Rationale
=========

The doc app can be used by end-users to find tutorials and documentation for
their products. When new versions of these products become available the user
must have access to the new documentation, too. The user must be given the
choice to download the new version.

Preconditions
=============

- The app must have access to the web service.
- Anton has pushed a new version of the documentation accessed by Otto to the
  web service.
- Anton or another administrator of the web service has granted Otto's company
  the permission to view this documentation.
- The app that Otto uses must have stored the right authentication key for his
  company.

Invariants
==========

- Older versions of the same project stored in the app must not be
  overwritten.

Postcondition
=============

- The HTML files and the zip file must be stored in a new subdirectory for the
  new version.
- The new version of the documentation must be viewable.
- The new version has the same icon as the other documents.

Normal Flow
===========

From the nexiles|starter Otto opens the doc app which shows all released
documentation that is available for his company. He clicks on a documentation
that Anton has published some time ago and receives a message saying that a
new version of the documentation is available. He has the option to download
the new version or continue opening the old one. He chooses to download the
new documentation. A small progress bar shows that the download has started.
When the download finishes the new documentation opens up in a new tab. The
new documentation looks the same as the old one but some new parts of
documentation have been added to the document.

Notes
=====

- The end-user has only access to public documentation and documentation that
  a Nexiles administrator has granted the customer access to.

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

