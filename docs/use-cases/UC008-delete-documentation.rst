.. _UC008:

===========================
UC008: Delete Documentation
===========================

:Author:    Jan Müller
:Date:      2014-04-17

Description
===========

A developer deletes a documentation using the web interface for the
documentation management.

Actors
======

**Anton**
    A developer having management privileges on the web service.

Rationale
=========

A developer must be able to delete documentation that is no longer needed or
has to be replaced. This can be done with the documentation management
interface of the web service.

Preconditions
=============

- The developer must have the permission to delete documents on the web
  service.

Invariants
==========

None

Postcondition
=============

- The documentation files and meta data are deleted.
- The empty directories have been removed.

Normal Flow
===========

Anton accesses the documentation management interface over the website where
he has to log in to continue. All available documentation is listed in the
management interface with different versions of the same project grouped
together. A documentation can be deleted by clicking on a small trash icon and
confirming the deletion in the pop-up that is shown.

After the deletion the documentation is no longer shown in the management
interface. Anton returns to the list of links to all documentation files where
the removed documentation is not displayed either.

Notes
=====

None

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

