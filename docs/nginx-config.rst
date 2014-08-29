===============
Configure Nginx
===============

:Author:    Jan Müller
:Date:      |today|


Installation in an Ubuntu/Debian Environment
============================================

We are using the `ngx_http_auth_request_module`_ for the authorization on the
DocServer. Therefore this module must be included in the nginx installation, i.e.
nginx must be compiled with an additional configuration parameter.

In the following steps we will use the apt-get package manager to build nginx
from source:

#. Stop and remove the old version of nginx::

    sudo service nginx stop
    sudo apt-get remove nginx

#. Install dpkg-dev::

    sudo apt-get install dpkg-dev

#. Add the nginx repository::

    sudo add-apt-repository ppa:nginx/stable

#. Add the following lines to `/etc/apt/sources.list.d/nginx-stable-lucid.list`
   to include the dpkg-src. Replace "lucid" with your version.
   (This step may have already been automatically performed on Ubuntu >= 12.04)::

    deb http://ppa.launchpad.net/nginx/stable/ubuntu lucid main
    deb-src http://ppa.launchpad.net/nginx/stable/ubuntu lucid main

#. Resynchronize the package index files::

    sudo apt-get update

#. Get the nginx sources::

    apt-get source nginx

#. Build the dependencies::

    sudo apt-get build-dep nginx

#. Clone the module to the `nginx-x.x.x/debian/modules` directory::

    git clone git@github.com:perusio/nginx-auth-request-module.git

#. Edit `nginx-x.x.x/debian/rules` to include the module::

    ...
    config.status.full: config.env.full
  	...
  	    --add-module=$(MODULESDIR)/nginx-auth-request-module \
  	...

#. Build the package::

    cd nginx-x.x.x && dpkg-buildpackage -b

#. Install the packages::

    sudo dpkg --install nginx-common_x.x.x-1ubuntu3_all.deb

    sudo dpkg --install nginx-full_x.x.x-1ubuntu3_amd64.deb

.. _`ngx_http_auth_request_module`: http://nginx.org/en/docs/http/ngx_http_auth_request_module.html


Configuration
=============

All required configuration files can be found on Github_. Copy them to your nginx
configuration directory (On Ubuntu `/etc/nginx`) and change the hostnames specified
in these files if required.
Then load your configuration::

    sudo service nginx reload

.. _Github: https://github.com/nexiles/nexiles.docserver.buildout


Additional Information
======================

The provided configuration uses an auth request to secure the files hosted by
nginx. All requests to the `/docs` route will trigger a subrequest to the
API route `/@@API/plone/api/1.0/auth`. This route will return either a 200
status code to allow access or a 403 status code to deny access. In order to
make the API work properly, a `X-Original-URI` request header is required in the
subrequest.
The API will check if the requested documentation is visible for the Plone user
that is currently logged in using a cookie or any other means of Plone authentication.

.. vim: set spell spelllang=en ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
