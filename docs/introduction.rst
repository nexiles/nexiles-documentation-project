============
Introduction
============

:Author:    Jan Müller
:Date:      April 16, 2014


Problem Statement
=================

The documentation of Nexiles projects is not easy to access and not everybody knows where to find the documentation for a specific project. The documentation for all projects is currently hosted by an external provider and can be found on **docs.nexiles.com**. The HTML-documents containing the documentation are generated with Sphinx locally and published with a custom build script. The documents lack a unified appearance due to the use of different Sphinx-Themes. There are multiple versions of each documentation which are not all released projects and therefore distinguished between public and internal documentation. Furthermore each documentation is either a project documentation thus internal, a (public) end-user documentation or a set of tutorials for internal and external use. The website has no system with users and no management interface. Therefore it is not possible to make certain internal project documentation available to a single customer.
The documentation can also be accessed by a **nexiles|starter** doc app but not all documentation can be viewed without Internet connection as the app does not download the documents from docs.nexiles.com for offline use. Nexiles consultants often have no Internet access when they are at the customers' offices and thus need all documentation to be viewable offline. The process of publishing documentation is cumbersome as there are two locations (public and internal) the documentation can be pushed to by the developers.
The project must improve on the way documentation can be managed, accessed and published.

Goals
=====

To streamline the process of accessing, managing and submitting documentation for projects and to provide a solution that can be used both internally and externally. This contains the following goals:

* Improving the documentation app for nexiles|starter to provide offline access to the documentation. It should automatically download new or not already downloaded documentation.

* A better web service that manages the documentation files, their meta data, the users and groups with specified privileges. The app has to be able to query this service and download the documentation including its meta data.

* A simple way for the developers to push documentation to the web service.

Non Goals
=========

* The documentation will still be built locally so no Sphinx implementation on the server is needed.

* The client will not be rewritten from the ground up but be based on the existing documentation app.

Participants
============

**Stefan Eletzhofer, nexiles GmbH, se@nexiles.de**
  *Product Owner*

**Jan Börner, nexiles GmbH, jan.boerner@nexiles.com**
  *Project Leader*

**Jan Müller, nexiles GmbH, jan.mueller@nexiles.com**
  *Team*

**Jan Börner, nexiles GmbH, jan.boerner@nexiles.com**
  *Team*

Project Time Tracking
=====================

We use the following codes to track time:

    :Mite project name: Nexiles Documentation Project

