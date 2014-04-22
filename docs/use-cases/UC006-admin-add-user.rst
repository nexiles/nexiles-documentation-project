.. _UC006:

======================
UC006: Admin adds User
======================

:Author:    Jan Müller
:Date:      2014-04-17
:State:     **draft**

Description
===========

An administrator adds a new user using the management interface of the web service. The user must be created and given the permissions to view certain documentation and, if the user is a developer, to push his documentation to the service.

Actors
======

**Fred**
    A new employee of Nexiles that needs access to the documentation system.

**Anton**
    A user having administrative privileges on the web service.

Rationale
=========

The administrator must be able to add a new user with specific permissions e.g. give a new developer only access to certain documentation and no permission to push public documentation to the service. In addition to that the interface must also provide a way to add a customer as a user that has only access to released documentation and no right to push documentation to the service.

Preconditions
=============

- Anton must be an administrator.

Invariants
==========

- The documentation and the meta data on the server is not changed.

Postcondition
=============

- Fred must have access to the documentation he requires and be able to push non public documentation to the web service.
- A key to grant the doc app of Fred access to the internal documentation can be generated.

Normal Flow
===========

Anton does not want to give Fred the default developer login credentials, so he adds a new user. He can access the management interface over his browser after he has logged in. He navigates to the management interface for users and a list of all existing users and their privileges is shown. On the top of the list new users can be added with a click on a button. A small configuration form for the new user is displayed beginning with options for the user group (administrator, internal, developer, end-user etc.) and more detailed options which permissions the user should be given. Non public documents that the user must be able to view can be added here or on the documentation management interface. Anton adds the new user to the developer group but chooses not to grant the permission to push public documentation to the web service. A default developer user can view all documentation on the service but Anton restricts the available documents to the ones Fred requires. Then Anton clicks on the button to add the user and gives the login credentials that he has set to Fred.

Notes
=====

None

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

