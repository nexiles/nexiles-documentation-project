.. _UC002:

=============================================
UC002: Consultant views Documentation offline
=============================================

:Author:    Jan Müller
:Date:      2014-04-17

Description
===========

The use case describes the access of documentation without connection to the
web service using the nexiles|starter doc app.

Actors
======

**Karl**
    A consultant working at an external office without internet access.

Rationale
=========

Consultants working customers' offices or other locations without internet
access need to view documentation they previously downloaded from the doc web
service.

Preconditions
=============

- nexiles|starter must work without internet connection.
- Documentation must have been downloaded into the app directory.

Invariants
==========

- The index is not changed without a connection to the web service.

Postcondition
=============

None

Normal Flow
===========

Karl has already opened the nexiles|starter and clicks on the icon of the doc
app which opens up immediately. A small message in the upper bar shows up,
telling Karl that the app has no internet access. A grid of released
documentation is showed. All icons look the same indicating that Karl has
previously opened and downloaded the documents. The documentation he has not
yet downloaded is not shown. He switches to a grid of latest documentation and
clicks on the icon of a documentation opening it in a new tab. All contents of
the documentation are viewable when he navigates around. He switches back to
the grid of documents by clicking on its tab and opens another documentation
alongside the one he has already opened. The other documentation opens in a
new tab. Everything works as if the app had access to the internet. He can
switch between the two documents by clicking on the respective tabs.

He closes the two documents again by clicking on the close buttons of the two
tabs. After he has closed the documentation he is currently viewing, the other
documentation is shown. After having closed all tabs he returns to the grid of
documentation.

Notes
=====

- All versions of a documentation can also be found as zip files int the app
  directory.

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

