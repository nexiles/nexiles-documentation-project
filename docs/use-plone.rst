=========
Use Plone
=========

Installation for Production
===========================

Perform the installation with the Unified Installer from http://plone.org/products/plone/releases/4.3.3
You should follow the steps on http://docs.plone.org/manage/deploying/production/ubuntu_production.html

Using the commandline
======================

Use the process-control system Supervisor to start, restart and stop Plone

After starting, you should be able to view the welcome page at::

http://localhost:8080/


Updating the installation
=========================

To update your installation components, stop Plone, backup, edit your buildout.cfg file and run:

 sudo -u plone_buildout bin/buildout
from your instance directory.


Admin Login
===========

You find the password in ~/Plone/zeocluster/adminPassword.txt. If you have been asked for a password
during the installation this file is not created.

Install Workflow Mangager
=========================

Add plone.app.workflowmanager to the eggs in buildout.cfg and update Plone.


Todo
====

- [x] create roles, groups & users

- [x] create/adapt workflows for documentation

- [x] make it accessible via the json api

- [ ] make it possible to upload via commandline tool
