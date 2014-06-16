=========
Use Plone
=========
Foo
---------

Installation
============

install from here http://plone.org/products/plone/releases/4.3.2 and run the installer

Useing the commandline
======================

:start plone: ~/plonehome/ [ zinstance/bin/plonectl start

:stop plone: ~/plonehome/ [ zinstance/bin/plonectl stop

After starting, you should be able to view the welcome page at::

http://localhost:8080/


Updating the installation
=========================

To update your installation components, stop Plone, backup, edit your buildout.cfg file and run:

 bin/buildout
from your instance directory.


Admin Login
===========

You find the password in ~/plonehome/zinstance/adminPassword.txt. If you were ask while installation for a password this
file is not created.

Install Workflow Mangager
=========================

Add plone.app.workflowmanager to the eggs in buildout.cfg and updating plone.


Todo
====

- [ ] create rolls, groups

- [ ] create workflows for docs

- [ ] make it assesibible reading via json api

- [ ] make it possible to upload via commandline tool

