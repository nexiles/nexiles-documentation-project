.. _UC004:

=================================================
UC004: View internal Documentation on the Website
=================================================

:Author:    Jan Müller
:Date:      2014-04-17

Description
===========

A new developer wants to access a documentation over the website as he has not
yet the nexiles|starter on his system.

Actors
======

**Max**
    A developer working at Nexiles who wants to view a internal documentation.

Rationale
=========

Documentation must be accessible on the website because not everyone has the
doc app. The internal documents can only be accessed after the user has logged
in.

Preconditions
=============

- The documentation must be available on the front-end of the web service.
- Max must have valid login data.
- The user Max is using must be granted access to the documentation.

Invariants
==========

- Max can not change anything on the web service as he has only view
  permissions.

Postcondition
=============

None

Normal Flow
===========

Max navigates to the website in his web browser. On the website he can only
see public documentation, so he clicks on the login button in the upper right-
hand corner. A dynamically generated window opens where Max has to enter his
login data. After he has logged in, the list of documentation now shows the
internal documentation as well as the public. He clicks on one link and the
documentation, which looks exactly the same as in the doc app, is displayed.
After having found the information he was looking for, he clicks again on the
button in upper right-hand corner to log out.

Notes
=====

- The documentation files must be stored on the server as zip files and as
  unpacked HTML directories that can be accessed served to a browser.

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

