================
Server Solutions
================

:Author:    Jan Müller
:Date:      April 24, 2014

Comparison
==========

Plone
-----

- Feature-rich
- Full-fledged CMS
- Steep learning curve

Flask
-----

- Python
- Really basic
- Fast
- Plug-ins/extensions available
- User management has to be built from ground up.
  
Play
----

- Java
- Good test integration
- Built in Netty server
- Provides a /assets directory that can be routed like other 'Controllers' but
  contains static resources.
- The contents of /assets are compiled (Coffescript, Less etc.) and packaged
  into the jar file when the project is built.
- Good JSON support
  
Django
------

- Python
- Fast
- Concept of apps and project allows for a modular design and extensions.
- Apps follow mvc structure.
- Good default relational database integration.
- Lots of features, maybe too heavy
- By default no support for routing depending on the http method
- Strange JSON