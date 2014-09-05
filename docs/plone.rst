=====
Plone
=====

:Author:    Jan Müller
:Date:      July 4, 2014


Installation for Production
===========================

Perform the installation with the custom Buildout files from https://github.com/nexiles/nexiles.docserver.buildout
You can also follow the steps at http://docs.plone.org/manage/deploying/production/ubuntu_production.html
Make sure to either perform the steps to :doc:`configure LDAP authentication <ldap-config>` or disable/comment out
the parts of the Buildout files that refer to the LDAP installation.

The plone.docs add-on is currently only available from https://github.com/nexiles/nexiles.plone.docs
and must be installed as development egg. After having put the files into the src directory
you can install the add-on using Plone Site Setup or the portal_quickinstaller in the ZMI.

Starting and Stopping
=====================

Use the process-control system Supervisor to start, restart and stop Plone::

    sudo supervisorctl
    > start plone4client1
    > start plone4server


After starting, you should be able to view the welcome page at http://localhost:8080/


Updating the Installation
=========================

To update your installation components, stop Plone, backup, edit your buildout.cfg file and run
from your zeocluster directory::

    sudo -u plone_buildout bin/buildout


Admin Login
===========

You find the password in ~/Plone/zeocluster/adminPassword.txt. If you have been asked for a password
during the installation this file is not created.

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
