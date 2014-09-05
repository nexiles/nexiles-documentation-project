====================================
How to configure LDAP Authentication
====================================

:Author:    Jan Müller
:Date:      |today|


Installation in an Ubuntu/Debian Environment
============================================

The plone.app.ldap plugin requires OpenLDAP to be installed on Linux. We will do
this using Buildout and as the required configuration is already included in the
files on Github_ the only thing we have to do is installing some dependencies::

    sudo apt-get build-dep openldap

.. _Github: https://github.com/nexiles/nexiles.docserver.buildout

Configuration
=============

After rerunning Buildout the LDAP Add-on should be available in Plone. You can
install it by reinstalling the plone.docs Add-on. Installing it this way ensures
the LDAP configuration for the pdc01.prd.de.nexiles.intra Active Directory is
included as well. The only thing that remains to do is to enter the correct
password for the user "ldap".
You have to do this in `/usr/local/Plone/zeocluster/src/plone.docs/plone/docs/profiles/default/ldap_plugin.xml`
by setting the property "_bindpwd" before installing the Add-on.

.. caution:: Never install the "LDAPUserFolder CMF Tools" Add-on as it completely bricks
             your site and you have to "Undo" the installation via the ZMI.
             This is for CMF sites only!

You can also refer to this table for the pdc01.prd.de.nexiles.intra configuration:

+----------------------------+------------------------------------------------------------+
|       attribute name       |                          value                             |
+============================+============================================================+
| `LDAP server type`         | Active Directory                                           |
+----------------------------+------------------------------------------------------------+
| `rDN attribute`            | sAMAccountName                                             |
+----------------------------+------------------------------------------------------------+
| `User id attribute`        | sAMAccountName                                             |
+----------------------------+------------------------------------------------------------+
| `Login name attribute`     | sAMAccountName                                             |
+----------------------------+------------------------------------------------------------+
| `LDAP object classes`      | organizationalPerson,person,top,user                       |
+----------------------------+------------------------------------------------------------+
| `Bind DN`                  | cn=ldap,cn=users,dc=pdc01,dc=prd,dc=de,dc=nexiles,dc=intra |
+----------------------------+------------------------------------------------------------+
| `Base DN for users`        | ou=people,dc=pdc01,dc=prd,dc=de,dc=nexiles,dc=intra        |
+----------------------------+------------------------------------------------------------+
| `Search scope for users`   | subtree                                                    |
+----------------------------+------------------------------------------------------------+
| `Base DN for groups`       | ou=groups,dc=pdc01,dc=prd,dc=de,dc=nexiles,dc=intra        |
+----------------------------+------------------------------------------------------------+
| `Search scope for groups`  | subtree                                                    |
+----------------------------+------------------------------------------------------------+
| `User password encryption` | crypt                                                      |
+----------------------------+------------------------------------------------------------+
| `Default user roles`       | Member                                                     |
+----------------------------+------------------------------------------------------------+
| `Read Only`                | True                                                       |
+----------------------------+------------------------------------------------------------+

Troubleshooting
===============

If the full names and/or emails of your LDAP users are not displayed, check that
the LDAP plugin is the first plugin in the list of enabled Properties Plugins.
The plugins can be found in ZMI under acl_users/plugins/manage_plugins?plugin_type=IPropertiesPlugin

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
