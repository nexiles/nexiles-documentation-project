===========
The Doc App
===========

:Author:    Jan Müller
:Date:      |today|


Installation in an existing nexiles.starter
===========================================

The starter must require the following node modules in its package.json::

    "dependencies": {
        "mkdirp": "~0.5.0",
        "adm-zip": "~0.4.4",
        "request": "^2.36.0"
    }

In the starter directory copy the doc app to resources/app_config/
Then modify resources/app_config/config.json in order to add "doc_app" to the
"apps" array. After restarting the nexiles.starter the doc app should appear as
new app.

Folder Structure (local)
========================

Local documentation in the **docs** folder should be structured in the following way::

    my.generic.project
     └── my.generic.documentation
         ├── 0.1
         ├── v0.2
         └── 0.3

Inside a specific version folder must be an **index.html** file. This file is
opened when the documentation icon is clicked.

In the **docs** folder must be an data.json file that specifies the meta data for
the local records.

JSON Structure
==============

Documentation meta data must be in a predefined JSON structure to be recognized
by the app correctly::

      {
           items: [
           {
               uid: "dd3df633e6e242e19a412beb2647c020",
               docs: [
                   {
                       uid: "385077b2905140938cbfc9a82491b799",
                       visibility: "external",
                       id: "remote-documentation-1",
                       modification_date: "Aug 14, 2014 02:31 PM",
                       zip: "http://docs.nexiles.com/docs/remote-project/remote-documentation-1/0.2.zip",
                       title: "remote.documentation",
                       url: "http://docs.nexiles.com/documentation/remote-project/remote-documentation-1",
                       doc_icon: "http://docs.nexiles.com/docs/remote-project/remote-documentation-1/icon.png",
                       state: "released",
                       version: "0.2",
                       doc_url: "http://docs.nexiles.com/docs/remote-project/remote-documentation-1/0.2/index.html"
                   },{
                       uid: "eed8af3c0c5c40b694fcbc62f65778a9",
                       visibility: "internal",
                       id: "remote-documentation",
                       modification_date: "Aug 14, 2014 02:31 PM",
                       zip: "http://docs.nexiles.com/docs/remote-project/remote-documentation/v0.3.zip",
                       title: "remote.documentation",
                       url: "http://docs.nexiles.com/documentation/remote-project/remote-documentation",
                       doc_icon: "http://docs.nexiles.com/docs/remote-project/remote-documentation/icon.png",
                       state: "draft",
                       version: "v0.3",
                       doc_url: "http://docs.nexiles.com/docs/remote-project/remote-documentation-1/v0.3/index.html"
                   }
               ],
               visibility: "external",
               released: "385077b2905140938cbfc9a82491b799",
               id: "remote-project",
               github: "https://github.com/nexiles/remote.project",
               api_url: "http://localhost:8080/@@API/docs/api/1.0/projects/dd3df633e6e242e19a412beb2647c020",
               modification_date: "Aug 14, 2014 02:33 PM",
               title: "remote.project",
               url: "http://docs.nexiles.com/documentation/remote-project/",
               state: "released",
               latest: "eed8af3c0c5c40b694fcbc62f65778a9"
           }
      }

.. note:: The "uid" property is used internally to identify the records. It should
          not be changed manually.

Configuration
=============

To configure the doc app you have to modify the config.json in the doc_app
directory. You should only modify the settings object. The following options can
be set there::

    "settings": {
        "docs_path": Path to the local documentation folder,
        "docs_api":  Absolute URL to the doc server JSON API,
        "plone_api": Absolute URL to the Plone JSON API,
        "docs_remote_icon": Absolute URL to the default icon for remote documentation,
        "docs_icon": Absolute URL to the default icon for local documentation,
        "docs_user": Username of the Plone user,
        "docs_password": Password of the Plone user
    }

The app path can be inserted with::

    {{app_path}}

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
