===================
How to backup Plone
===================

:Author:    Jan Müller
:Date:      |today|


Configuration in an Ubuntu/Debian Environment
=============================================

If you installed Plone using the Buildout configuration provided on Github_
you should have the `collective.recipe.backup` recipe already installed.
If not already done you should register the backup cron jobs by editing the
following files:

To `/etc/cron.d/zeopack` add::

    42 4 * * 0 plone_daemon /usr/local/Plone/zeocluster/bin/zeopack

To `/etc/cron.d/plonebackup` add::

    42 3 * * * plone_daemon /usr/local/Plone/zeocluster/bin/backup

This configuration will make an incremental backup every day and once a week
pack the ZODB. By default the backups will be located at `/backup/plone`.

.. _Github: https://github.com/nexiles/nexiles.docserver.buildout

Backup and Restore
==================

The cron jobs will backup your Zope Object Database and your BLOB storage to the
directory specified in your `buildout.cfg`.

To restore a backup execute the following command as `plone_daemon` with a
date-time argument::

    bin/restore

For more information refer to the `Plone documentation`_.

.. _`Plone documentation`: http://docs.plone.org/manage/deploying/backup.html

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
