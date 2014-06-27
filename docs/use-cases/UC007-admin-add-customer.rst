.. _UC007:

============================================
UC007: Give Customer Access to Documentation
============================================

:Author:    Jan Müller
:Date:      2014-04-22

Description
===========

An administrator wants to give a customer access to non public documentation
of a module or a product for which the customer has acquired a maintenance
contract.

Actors
======

**Otto**
    A customer working at the company X.
**Anton**
    A developer who has administrative privileges on the web service.

Rationale
=========

When a customer acquires a new product, module or maintenance contract, he has
to be given access to the documentation for this product over the doc app. For
contracts a expiration date must be set as the company should no longer have
access to new documentation, only retaining the old documents, when the
maintenance contract expires.

Preconditions
=============

- Anton must be an administrator.
- Otto's company already has a user account.
- The right authentication key is stored in Otto's app.

Invariants
==========

- The documentation and the meta data on the server is not changed.

Postcondition
=============

- Otto must have access to (new) documentation for his product.
- When the contract expires only old documentation of the product can be
  viewed.

Normal Flow
===========

Anton accesses the user management interface over the website where he has to
log in. A list of all existing users is shown containing the user account of
company X.

He can easily edit the user account to grant Otto access to all documentation
for a specific project/module. In the edit form that is displayed when he
clicks on an edit icon of a user in the list he can also set an expiration
date for the access to the latest released documentation of a product. As Otto
has a contract for one year, Anton gives him the required permissions and sets
the date to the correct day one year later. He saves the changes that he made
and exits the web interface.

Otto opens the doc app and can now see the released documentation for his
products.

Notes
=====

None

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:

