FIWARE Stream Oriented Generic Enabler - Overview
=================================================


The Stream Oriented Generic Enabler (GE) provides a framework devoted to
simplify the development of complex interactive multimedia applications through
a rich family of APIs and toolboxes. It provides a media server and a set of
client APIs making simple the development of advanced video applications for
WWW and smartphone platforms. The Stream Oriented GE features include group
communications, transcoding, recording, mixing, broadcasting and routing of
audiovisual flows. It also provides advanced media processing capabilities
involving computer vision, video indexing, augmented reality and speech
analysis.

The Stream Oriented GE modular architecture makes simple the integration of
third party media processing algorithms (i.e. speech recognition, sentiment
analysis, face recognition, etc.), which can be transparently used by
application developers as the rest of built-in features.

The Stream Oriented GE’s core element is a Media Server, responsible for media
transmission, processing, loading and recording. It is implemented in low level
technologies based on GStreamer to optimize the resource consumption. It
provides the following features:

- Networked streaming protocols, including HTTP (working as client and
  server), RTP and WebRTC.
- Group communications (MCUs and SFUs functionality) supporting both media
  mixing and media routing/dispatching.
- Generic support for computational vision and augmented reality filters. -
  Media storage supporting writing operations for WebM and MP4 and playing in
  all formats supported by GStreamer.
- Automatic media transcodification between any of the codecs supported by
  GStreamer including VP8, H.264, H.263, AMR, OPUS, Speex, G.711, etc.


Why Using Kurento in a “Smart Solution”?
========================================

The Stream-oriented GE provides a suitable structure to multimedia
information, so it can be inserted into the context in an homogeneous
way and can be consumed by client application front-ends or application
backends just like any other context information.

Information can be extracted to convert media devices like cameras into
IoT devices using the Kurento real-time media Stream processing GE.
Context information can be generated as a result of the media streams
analysis or the reception of context data to take decisions in the way
the media is processed.

.. toctree::
   :glob:
   :hidden:
   :includehidden:
   :maxdepth: 6

   Getting Started <doc/quick_start_guide>
   Installation and Administration Guide <doc/admin/index>
   Programmers Manual <doc/developers/index>
   Open API Specification <doc/open_spec>
   Glossary <doc/glossary>
