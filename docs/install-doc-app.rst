===================
Install the Doc App
===================

:Author:    Jan Müller
:Date:      July 4, 2014


Installation in an existing nexiles.starter
===========================================

In the starter directory copy the doc app to resources/app_config/
Then modify resources/app_config/config.json in order to add "doc_app" to the
"apps" array. After restarting the nexiles.starter the doc app should appear as
new app.

Configuration
=============

To configure the doc app you have to modify the config.json in the doc_app
directory. You should only modify the settings object. The following options can
be set there::

    "settings": {
            "docs_path": Path to the local documentation folder,
            "docs_url":  Absolute URL to the doc server JSON API,
            "docs_remote_icon": Absolute URL to the default icon for remote documentation,
            "docs_icon": Absolute URL to the default icon for local documentation,
            "docs_user": Username of the Plone user,
            "docs_password": Password of the Plone user
        }

The app path can be inserted with::

    {{app_path}}

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
