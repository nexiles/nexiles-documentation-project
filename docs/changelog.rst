.. _changelog:

==========
Change Log
==========

plone.docs
==========

0.2.1 - unreleased
------------------

**backend version**
    0.2.1

**frontend version**
    0.7

**Enhancements**

- https://github.com/nexiles/nexiles.administration/issues/67

  Added LDAP authentication to Plone

- The URLs generated for docmetas now include the project ID

**Bug fixes**

- Avoid waking up objects requested via other APIs than the docs API. This fixes
  possibly missing UIDs in the JSON API.

- Set session data when an authenticated user requests the login route. Fixes
  authentication problems in the doc app.

- Fix erroneous package dependencies

**Documentation**

- Added ldap configuration docs

0.2 - 2014-08-29
----------------

**backend version**
    0.2

**frontend version**
    0.2

**Enhancements**

- https://github.com/nexiles/nexiles.plone.docs/issues/4

  Added custom workflow

- https://github.com/nexiles/nexiles.plone.docs/issues/5

  Added view for docmetas

- https://github.com/nexiles/nexiles.plone.docs/issues/6

  Added Contenttype plone.docs.project and a project view

- https://github.com/nexiles/nexiles.plone.docs/issues/12

  Added authorization for nginx file requests

- https://github.com/nexiles/nexiles.plone.docs/issues/9

  Refactored code to use adapters for a jsonapi interface

- Added project api

**Bug fixes**

- https://github.com/nexiles/nexiles.plone.docs/issues/2

  Implemented Adapter to fix output of the jsonapi

**Documentation**

- Added nginx configuration docs


0.1 - unreleased
----------------

**backend version**
    0.1

**frontend version**
    0.1

**Features**

- Plone users and groups to manage documentation

- JSON API for docs

- Intranet workflow for docs

- Installable via GenericSetup

- Generate URLs dynamically

**Enhancements**

  none yet.

**Bug fixes**

  none yet.

**Documentation**

  no changes


Doc App
=======

0.2 - 2014-08-21
----------------

**backend version**
    0.2

**frontend version**
    0.2

**Enhancements**

- Integrated doc app in nexiles.starter2 repo

- The app now uses docs.nexiles.com

- Adapted the doc app to use the new projects api of the docserver.

- https://github.com/nexiles/nexiles.starter2/issues/66

  Added context menu with the option to remove downloaded documentation.

- https://github.com/nexiles/nexiles.starter2/issues/69

  Local and latest are now checkboxes.
  The filter only depends on the Plone workflow state.

- https://github.com/nexiles/nexiles.starter2/issues/75

  Refactored the code to use multiple files according to the MVC pattern.

- Factored out filter method to the store.

- Uses ids instead of titles for directory names.

**Bug fixes**

- https://github.com/nexiles/nexiles.starter2/issues/67

  Downloaded documentation has now meta data in a data.json file.

- https://github.com/nexiles/nexiles.starter2/issues/68

  Clicking on the same documentation multiple times doesn't open new tabs.
  every time.

- https://github.com/nexiles/nexiles.starter2/issues/71

  The dataview is now scrollable.

- https://github.com/nexiles/nexiles.starter2/issues/76

  Fixed the crash when a request was not completed before the app was closed.

**Documentation**

- Updated api and config docs in DocApp.coffee

- Added app docs to nexiles.starter2 repo.


0.1 - 2014-07-07
----------------

**backend version**
    0.1

**frontend version**
    0.1

**Enhancements**

- Added a "Retry" button to restart the download after an error occurred.

- The docs folder is no longer required.

**Bug fixes**

- Fix unzip errors due to missing END headers.

**Documentation**

- Updated Plone docs.

- Updated installation docs.

- Updated config docs in functions.coffee

- Added the changelog to index.rst


0.1rc1 - 2014-07-04
-------------------

**backend version**
    N/A

**frontend version**
    0.1rc1

**Features**

- Plone user authentication

- Download of documentation to local

- Filter documentation by latest

- Works offline

- Local storage of documentation icons

**Enhancements**

  none yet.

**Bug fixes**

  none yet.

**Documentation**

- Created changelog

..  vim: set ft=rst tw=75 nocin spell nosi ai sw=4 ts=4 expandtab:
