Configuration
%%%%%%%%%%%%%

Kurento works by orchestrating a broad set of technologies that must be
made to work together. Some of these technologies can accept different
configuration parameters that Kurento makes available through several
configuration files:

-  ``/etc/kurento/kurento.conf.json``: The main configuration file.
   Provides settings for the behavior of Kurento Media Server itself.

-  ``/etc/kurento/modules/kurento/MediaElement.conf.ini``: Generic
   parameters for all kinds of *MediaElement*.

-  ``/etc/kurento/modules/kurento/SdpEndpoint.conf.ini``: Audio/video
   parameters for *SdpEndpoint*\ s (i.e. *WebRtcEndpoint*\ and
   *RtpEndpoint*).

-  ``/etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini``: Specific
   parameters for *WebRtcEndpoint*.

-  ``/etc/kurento/modules/kurento/HttpEndpoint.conf.ini``: Specific
   parameters for *HttpEndpoint*.

-  ``/etc/default/kurento-media-server``: This file is loaded by the
   system’s service init files. Defines some environment variables,
   which have an effect on features such as the *Debug Logging*, or the
   *Kernel Dump* files that are generated when a crash happens.


STUN and TURN Configuration
===========================

If Kurento Media Server is located behind a NAT you need to use a
`STUN <https://en.wikipedia.org/wiki/STUN>`__ or
`TURN <https://en.wikipedia.org/wiki/Traversal_Using_Relays_around_NAT>`__
in order to achieve `NAT
traversal <https://en.wikipedia.org/wiki/NAT_traversal>`__. In most of
cases, a STUN server will do the trick. A TURN server is only necessary
when the NAT is symmetric.

The connection of these server is configured in the WebRtcEndpoint
configuration file:
``/etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini``

STUN Configuration
------------------

For configuring the STUN Server in Kurento you must *(uncomment and)*
set the following parameters in the WebRtcEndPoint configuration file:

::

   stunServerAddress=<stun_ip_address>
   stunServerPort=<stun_port>

The parameter **stunServerAddress** should be an IP address (not domain
name).

There is plenty of public STUN servers available, for example:

::

   173.194.66.127:19302
   173.194.71.127:19302
   74.125.200.127:19302
   74.125.204.127:19302
   173.194.72.127:19302
   74.125.23.127:3478
   77.72.174.163:3478
   77.72.174.165:3478
   77.72.174.167:3478
   77.72.174.161:3478
   208.97.25.20:3478
   62.71.2.168:3478
   212.227.67.194:3478
   212.227.67.195:3478
   107.23.150.92:3478
   77.72.169.155:3478
   77.72.169.156:3478
   77.72.169.164:3478
   77.72.169.166:3478
   77.72.174.162:3478
   77.72.174.164:3478
   77.72.174.166:3478
   77.72.174.160:3478
   54.172.47.69:3478

TURN Configuration
------------------

For configuring the STUN Server in Kurento you must *(uncomment and)*
set the following parameter in the WebRtcEndPoint configuration file:

::

   turnURL=user:password@address:port

As before, TURN address should be an IP address (not domain name).

Remarks
-------

1. Note that it is somewhat easy to find free STUN servers available on
   the net, because their functionality is pretty limited and it is not
   costly to keep them working for free. However, this doesn’t happen
   with TURN servers, which act as a media proxy between peers and thus
   the cost of maintaining one is much higher. It is rare to find a TURN
   server which works for free while offering good performance. Usually,
   each user opts to maintain their own private TURN server instances.

   |

2. `Coturn <http://coturn.net/>`__ is an open source implementation of a
   TURN/STUN server. In the
   `FAQ <https://doc-kurento.readthedocs.io/en/stable/user/faq.html>`__
   section there is a description about how to install and configure it.

   |

3. In order to check the availability of either TURN and STUN servers
   you can check here:
   https://webrtc.github.io/samples/src/content/peerconnection/trickle-ice/

Debug Logging
=============

Kurento Media Server generates log files that are stored in
``/var/log/kurento-media-server/``. The content of this folder is as
follows:

-  ``media-server_<timestamp>.<log_number>.<kms_pid>.log``: Output log
   of a currently running instance of KMS.
-  ``media-server_error.log``: Errors logged by third-party libraries.
-  ``logs``: Folder that contains older KMS logs. The logs in this
   folder are rotated, so they don’t fill up all the space available in
   the disk.

Each line in a log produced by KMS has a fixed structure:

::

   [timestamp] [pid] [memory] [level] [component] [filename:loc] [method] [message]

-  ``[timestamp]``: Date and time of the logging message (e.g.
   *2017-12-31 23:59:59,493295*).
-  ``[pid]``: Process Identifier of *kurento-media-sever* (e.g.
   *17521*).
-  ``[memory]``: Memory address in which the *kurento-media-sever*
   component is running (e.g. *0x00007fd59f2a78c0*).
-  ``[level]``: Logging level. This value typically will be *INFO* or
   *DEBUG*. If unexpected error situations happen, the *WARN* and
   *ERROR* levels will contain information about the problem.
-  ``[component]``: Name of the component that generated the log line.
   E.g. *KurentoModuleManager*, *webrtcendpoint*, or *qtmux*, among
   others.
-  ``[filename:loc]``: Source code file name (e.g. *main.cpp*) followed
   by the line of code number.
-  ``[method]``: Name of the function in which the log message was
   generated (e.g. *loadModule()*, *doGarbageCollection()*, etc).
-  ``[message]``: Specific log information.

For example, when KMS starts correctly, this trace is written in the log
file:

::

   [timestamp] [pid] [memory]  info  KurentoMediaServer  main.cpp:255  main()  Kurento Media Server started

KMS Logging levels and components
---------------------------------

Each different **component** of KMS is able to generate its own logging
messages. Besides that, each individual logging message has a severity
**level**, which defines how critical (or superfluous) the message is.

These are the different message levels, as defined by the `GStreamer
logging
library <https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gstreamer/html/gst-running.html>`__:

-  **(1) ERROR**: Logs all *fatal* errors. These are errors that do not
   allow the core or elements to perform the requested action. The
   application can still recover if programmed to handle the conditions
   that triggered the error.
-  **(2) WARNING**: Logs all warnings. Typically these are *non-fatal*,
   but user-visible problems that *are expected to happen*.
-  **(3) FIXME**: Logs all “fixme” messages. Fixme messages are messages
   that indicate that something in the executed code path is not fully
   implemented or handled yet. The purpose of this message is to make it
   easier to spot incomplete/unfinished pieces of code when reading the
   debug log.
-  **(4) INFO**: Logs all informational messages. These are typically
   used for events in the system that *happen only once*, or are
   important and rare enough to be logged at this level.
-  **(5) DEBUG**: Logs all debug messages. These are general debug
   messages for events that *happen only a limited number of times*
   during an object’s lifetime; these include setup, teardown, change of
   parameters, etc.
-  **(6) LOG**: Logs all log messages. These are messages for events
   that *happen repeatedly* during an object’s lifetime; these include
   streaming and steady-state conditions.
-  **(7) TRACE**: Logs all trace messages. These messages for events
   that *happen repeatedly* during an object’s lifetime such as the
   ref/unref cycles.
-  **(8) MEMDUMP**: Log all memory dump messages. Memory dump messages
   are used to log (small) chunks of data as memory dumps in the log.
   They will be displayed as hexdump with ASCII characters.

Logging categories and levels can be set by two methods:

-  Use the specific command-line argument while launching KMS. For
   example, run:

   ::

      /usr/bin/kurento-media-server \
        --gst-debug-level=3 \
        --gst-debug=Kurento*:4,kms*:4

-  Use the environment variable GST_DEBUG. For example, run:

   ::

      export GST_DEBUG="3,Kurento*:4,kms*:4"
      /usr/bin/kurento-media-server

Suggested levels
~~~~~~~~~~~~~~~~

Here are some tips on what logging components and levels could be most
useful depending on what is the issue to be analyzed. They are given in
the environment variable form, so they can be copied directly into the
KMS configuration file, */etc/default/kurento-media-server*:

-  Default suggested levels:

   ::

      export GST_DEBUG="3,Kurento*:4,kms*:4"

-  COMEDIA port discovery:

   ::

      export GST_DEBUG="3,rtpendpoint:4"

-  ICE candidate gathering:

   ::

      export GST_DEBUG="3,kmsiceniceagent:5,kmswebrtcsession:5,webrtcendpoint:4"

   Notes:

   -  *kmsiceniceagent* shows messages from the Nice Agent (handling of
      candidates).
   -  *kmswebrtcsession* shows messages from the KMS WebRtcSession
      (decision logic).
   -  *webrtcendpoint* shows messages from the WebRtcEndpoint (very
      basic logging).

-  Event MediaFlow{In|Out} state changes:

   ::

      export GST_DEBUG="3,KurentoMediaElementImpl:5"

-  Player:

   ::

      export GST_DEBUG="3,playerendpoint:5"

-  Recorder:

   ::

      export GST_DEBUG="3,KurentoRecorderEndpointImpl:4,recorderendpoint:5,qtmux:5"

-  REMB congestion control:

   ::

      export GST_DEBUG="3,kmsremb:5"

   Notes:

   -  *kmsremb:5* (debug level 5) shows only effective REMB send/recv
      values.
   -  *kmsremb:6* (debug level 6) shows full handling of all source
      SSRCs.

-  RPC calls:

   ::

      export GST_DEBUG="3,KurentoWebSocketTransport:5"

-  RTP Sync:

   ::

      export GST_DEBUG="3,kmsutils:5,rtpsynchronizer:5,rtpsynccontext:5,basertpendpoint:5"

-  SDP processing:

   ::

      export GST_DEBUG="3,kmssdpsession:4"

-  Transcoding of media:

   ::

      export GST_DEBUG="3,Kurento*:5,kms*:4,agnosticbin*:7"

-  Unit tests:

   ::

      export GST_DEBUG="3,check:5"

3rd-party libraries: libnice
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**libnice** is `the GLib
implementation <https://nice.freedesktop.org/>`__ of
`ICE <https://doc-kurento.readthedocs.io/en/stable/glossary.html#term-ice>`__,
the standard method used by
`WebRTC <https://doc-kurento.readthedocs.io/en/stable/glossary.html#term-webrtc>`__
to solve the issue of `NAT
Traversal <https://doc-kurento.readthedocs.io/en/stable/glossary.html#term-nat-traversal>`__.

This library has its own logging system that comes disabled by default,
but can be enabled very easily. This can prove useful in situations
where a developer is studying an issue with the ICE process. However,
the debug output of libnice is very verbose, so it makes sense that it
is left disabled by default for production systems.

Run KMS with these environment variables defined: ``G_MESSAGES_DEBUG``
and ``NICE_DEBUG``. They must have one or more of these values,
separated by commas:

-  libnice
-  libnice-stun
-  libnice-tests
-  libnice-socket
-  libnice-pseudotcp
-  libnice-pseudotcp-verbose
-  all

Example:

::

   export G_MESSAGES_DEBUG="libnice,libnice-stun"
   export NICE_DEBUG="$G_MESSAGES_DEBUG"
   /usr/bin/kurento-media-server
