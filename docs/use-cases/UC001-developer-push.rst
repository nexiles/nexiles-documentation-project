.. _UC001:

===============================
UC001: Push Documentation Files
===============================

:Author:    Jan Müller
:Date:      2014-04-17
:State:     **draft**

Description
===========

This use case describes how a developer pushes a newly generated documentation to the web service using a script from the build-tools.

Actors
======

**Anton**
    A software developer at Nexiles who finished a new release of a project.

Rationale
=========

The developer has written a documentation and finished the work on the project. Now he wants to publish his documentation somehow to finish the release of his project. The documentation then has to be accessible to his customer, other developers, consultants etc. but not in every case the documentation should be public.

Preconditions
=============

- The documentation files are setup with Sphinx and the Nexiles Theme.
- Build-tools contain a script to build and publish documentation.
- Anton knows how to use the scripts.
- Anton knows which login credentials he has to use for the connection to the web service.
- Anton possesses valid login credentials.

Invariants
==========

- Older versions of the same project stored on the web service are not changed.

Postcondition
=============

- The new documentation has to lay in the correct directory.
- The documentation files have to be available on the website and to the app users.
- Access is restricted by the permissions required to view the document.
- Multiple versions of one project have to be ordered correctly in subdirectories.
- The meta data must be available to the management interface and to the accessing users i.e. to the app and to the website.

Normal Flow
===========

Anton executes the build scripts for his project and its documentation. The HTML files of the documentation are automatically built using the pre-installed Nexiles Theme for Sphinx. Then he executes the script to publish the documentation files which connects to the web service with the login credentials provided by Anton. The developer can choose whether to make the documentation public or not. If the documentation must not be public, the documentation is only accessible internally and can be made available to customers on the management platform of the web service. Anton worked on a project that only his customer should see, so he chooses not to make the documentation public. After he has pushed the files to the web service Anton opens the doc app from the nexiles|starter where his documentation is shown as released. For his customer to be able to access the documentation, too, the customer has to be given access to the documentation using the management interface of the web service. Anton logs in on the website and navigates to the system for documentation management. As he has already released several versions of this project to his customer, he can easily add the existing user to the users allowed to view his new documentation.

Notes
=====

- The Nexiles Theme is installable as a package and can then be imported into the conf.py file of the Sphinx project.

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

