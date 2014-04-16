.. _requirements:

============
Requirements
============

:Author:    Jan Müller
:Date:      April 16, 2014

Abstract
========

Here we collect all high-level requirements as understood from the customer.

Assumptions and Prerequisites
=============================

**Target Platform**
  MAC OSX, Windows

* Documentation is generated in HTML files by Sphinx.

Requirements
============

**R001 Consistent Style for all Documentation**
    All documentation should use the same Sphinx theme.

Doc App Requirements
------------------------------

**R002 Display Documentation**
    The app must list all available documentation and display the previously generated HTML documents that contain the documentation.

**R003 Access to different Versions**
    The documentation for each version of a project must be available.

**R004 Tags Support**
    Tags must be supported as a way of filtering which documents are displayed e.g. only documentation tagged 'released' or 'latest' is shown. The default filter option should be setup to show only released documentation.

**R005 End-User Restrictions**
    End-users may only view documentation of released product versions.

**R006 Documentation stored locally**
    The documents that can be viewed in the app must be downloaded from the web service as a zip file before they are displayed. They are stored permanently in the app directory.

**R007 Directory Structure**
    The documentation must be stored in a predefined structure where each version of a project is stored in a subdirectory.

**R008 Offline Access**
    Documentation already downloaded may be viewed without an internet connection.

**R009 Update to new Versions**
    The user must be notified when a new version of a documentation is available having an option to download the new files.

**R010 Automatically update the Index**
    Whenever the app has access to the internet the index of available documentation should be updated.

**R011 Error Handling**
    The app must notify the user when it has no access to the internet.

**R012 Authentication**
    In order to access non public documentation the client must authenticate itself with a shared secret.

Web Service Requirements
------------------------

**R101 Host Documentation and Meta Data**
    The web service must host all documentation and the associated meta data.

**R102 A Way for Developers to push Documentation to the Service**
    There must be a place where all developers can push their documentation to.

**R103 Provide Information for Client App**
    The nexiles|starter doc app must have a way to query the service for the documentation zip files, the index and the meta data.

**R104 Create Index on the Fly**
    The server must create an index (for the client) on the fly when queried.

**R105 User and User Groups**
    The web service should support a privileges system with users and groups that have access to a certain set of documentation.

**R106 Management System with UI**
    The server must have a management system with a user interface.

**R107 User Administration**
    The management system must allow for the administration of users, groups and their permissions to view documentation.

**R108 Documentation Management**
    The management system should contain an interface for the management of all available documentation files and the server structure.

**R109 Possibility to build Documentation on the Server**
    It should be possible to integrate a build process of Sphinx documentation that runs directly on the server and that will possibly be implemented at a later time.


.. vim: set ft=rst tw=75 spell spelllang=en nocin nosi ai sw=4 ts=4 expandtab:

