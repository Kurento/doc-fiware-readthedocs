
-  `Introduction <#introduction>`__
   -  `Requirements <#requirements>`__
-  `Installation <#installation>`__

   -  `KMS <#kms>`__
   -  `Built-in modules <#built-in-modules>`__

-  `Running Kurento from a Docker
   container <#running-kurento-from-a-docker-container>`__

Introduction
============

KMS has explicit support for two Long-Term Support (*LTS*) distributions
of Ubuntu: **Ubuntu 14.04 (Trusty)** and **Ubuntu 16.04 (Xenial)**. Only
the 64-bits editions are supported.

For other OS and versions check `Running Kurento from a Docker
container <#running-kurento-from-a-docker-container>`__

Requirements
------------

To guarantee the right working of the enabler RAM memory and HDD size
should be at least:

-  4 GB RAM

-  16 GB HDD (this figure is not taking into account that multimedia
   streams could be stored in the same machine. If so, HDD size must be
   increased accordingly).

Installation
============

KMS
---

Currently, the main development environment for KMS is Ubuntu 16.04
(Xenial), so if you are in doubt, this is the preferred Ubuntu
distribution to choose. However, all features and bug fixes are still
being backported and tested on Ubuntu 14.04 (Trusty), so you can
continue running this version if required.

1. Define what version of Ubuntu is installed in your system. Open a
   terminal and copy **only one** of these commands:

   .. sourcecode:: bash

      # KMS for Ubuntu 14.04 (Trusty)
      DISTRO="trusty"

   .. sourcecode:: bash

      # KMS for Ubuntu 16.04 (Xenial)
      DISTRO="xenial"

2. Add the Kurento repository to your system configuration. Run these
   two commands in the same terminal you used in the previous step:

   .. sourcecode:: bash

      sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83

   .. sourcecode:: bash

      sudo tee "/etc/apt/sources.list.d/kurento.list" >/dev/null <<EOF
      # Kurento Media Server - Release packages
      deb [arch=amd64] http://ubuntu.openvidu.io/6.7.1 $DISTRO kms6
      EOF

3. Install KMS:

   .. sourcecode:: bash

      sudo apt-get update
      sudo apt-get install kurento-media-server

This will install the KMS release version that was specified in the
previous commands.

The server includes service files which integrate with the Ubuntu init
system, so you can use the following commands to start and stop it:

.. sourcecode:: bash

   sudo service kurento-media-server start
   sudo service kurento-media-server stop

To verify that KMS is up and running, use this command and look for the
``kurento-media-server``\ process:

.. sourcecode:: bash

   ps -ef | grep kurento-media-server
   > nobody  1270  1  0 08:52 ?  00:01:00  /usr/bin/kurento-media-server

Unless configured otherwise, KMS will open the port ``8888`` to receive
requests and send responses by means of the `Kurento
Protocol <https://doc-kurento.readthedocs.io/en/stable/features/kurento_protocol.html>`__.
Use this command to verify that this port is listening for incoming
packets:

.. sourcecode:: bash

   sudo netstat -tupan | grep kurento

   > tcp6  0  0 :::8888  :::*  LISTEN  1270/kurento-media-server

Built-in modules
----------------

**Built-in modules** are extra modules developed by the Kurento team to
enhance the basic capabilities of Kurento Media Server. So far, there
are four built-in modules, that are installed as follows:

-  **kms-pointerdetector**: Filter that detects pointers in video
   streams, based on color tracking.

   .. sourcecode:: bash

      sudo apt-get install kms-pointerdetector

-  **kms-chroma**: Filter that takes a color range in the top layer and
   makes it transparent, revealing another image behind.

   .. sourcecode:: bash

      sudo apt-get install kms-chroma

-  **kms-crowddetector**: Filter that detects people agglomeration in
   video streams.

   .. sourcecode:: bash

      sudo apt-get install kms-crowddetector

-  **kms-platedetector**: Filter that detects vehicle plates in video
   streams.

   .. sourcecode:: bash

      sudo apt-get install kms-platedetector

   .. warning.. sourcecode:: bash

      The plate detector module is a prototype and its results
      are not always accurate. Consider this if you are planning to use
      this module in a production environment.

Running Kurento from a Docker container
=======================================

Starting a Kurento media server instance is easy. Kurento media server
exposes port 8888 for client access. So, assuming you want to map port
8888 in the instance to local port 8888, you can start kurento media
server with:

.. sourcecode:: bash

   # Xenial 
   $ docker run -d --name kms -p 8888:8888 kurento/kurento-media-server:xenial-latest
   # Trusty
   $ docker run -d --name kms -p 8888:8888 kurento/kurento-media-server:trusty-latest

To check that kurento media server is ready and listening, issue the
following command (you need to have curl installed on your system):

.. sourcecode:: bash

   $ curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: 127.0.0.1:8888" -H "Origin: 127.0.0.1" http://127.0.0.1:8888/kurento

You will get something like:

.. sourcecode:: bash

   HTTP/1.1 500 Internal Server Error
   Server: WebSocket++/0.7.0

Don’t worry about the second line (``500 Internal Server Error``). It’s
ok, because we are not talking the protocol Kurento media server
expects, we are just checking that the server is up and listening for
connections.
