FIWARE Stream Oriented Generic Enabler - Overview
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

.. figure:: https://img.shields.io/badge/FIWARE-Media_Streams-4f3495.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAVCAYAAAC33pUlAAAABHNCSVQICAgIfAhkiAAAA8NJREFUSEuVlUtIFlEUx+eO+j3Uz8wSLLJ3pBiBUljRu1WLCAKXbXpQEUFERSQF0aKVFAUVrSJalNXGgmphFEhQiZEIPQwKLbEUK7VvZrRvbr8zzjfNl4/swplz7rn/8z/33HtmRhn/MWzbXmloHVeG0a+VSmAXorXS+oehVD9+0zDN9mgk8n0sWtYnHo5tT9daH4BsM+THQC8naK02jCZ83/HlKaVSzBey1sm8BP9nnUpdjOfl/Qyzj5ust6cnO5FItJLoJqB6yJ4QuNcjVOohegpihshS4F6S7DTVVlNtFFxzNBa7kcaEwUGcbVnH8xOJD67WG9n1NILuKtOsQG9FngOc+lciic1iQ8uQGhJ1kVAKKXUs60RoQ5km93IfaREvuoFj7PZsy9rGXE9G/NhBsDOJ63Acp1J82eFU7OIVO1OxWGwpSU5hb0GqfMydMHYSdiMVnncNY5Vy3VbwRUEydvEaRxmAOSSqJMlJISTxS9YWTYLcg3B253xsPkc5lXk3XLlwrPLuDPKDqDIutzYaj3eweMkPeCCahO3+fEIF8SfLtg/5oI3Mh0ylKM4YRBaYzuBgPuRnBYD3mmhA1X5Aka8NKl4nNz7BaKTzSgsLCzWbvyo4eK9r15WwLKRAmmCXXDoA1kaG2F4jWFbgkxUnlcrB/xj5iHxFPiBN4JekY4nZ6ccOiQ87hgwhe+TOdogT1nfpgEDTvYAucIwHxBfNyhpGrR+F8x00WD33VCNTOr/Wd+9C51Ben7S0ZJUq3qZJ2OkZz+cL87ZfWuePlwRcHZjeUMxFwTrJZAJfSvyWZc1VgORTY8rBcubetdiOk+CO+jPOcCRTF+oZ0okUIyuQeSNL/lPrulg8flhmJHmE2gBpE9xrJNkwpN4rQIIyujGoELCQz8ggG38iGzjKkXufJ2Klun1iu65bnJub2yut3xbEK3UvsDEInCmvA6YjMeE1bCn8F9JBe1eAnS2JksmkIlEDfi8R46kkEkMWdqOv+AvS9rcp2bvk8OAESvgox7h4aWNMLd32jSMLvuwDAwORSE7Oe3ZRKrFwvYGrPOBJ2nZ20Op/mqKNzgraOTPt6Bnx5citUINIczX/jUw3xGL2+ia8KAvsvp0ePoL5hXkXO5YvQYSFAiqcJX8E/gyX8QUvv8eh9XUq3h7mE9tLJoNKqnhHXmCO+dtJ4ybSkH1jc9XRaHTMz1tATBe2UEkeAdKu/zWIkUbZxD+veLxEQhhUFmbnvOezsJrk+zmqMo6vIL2OXzPvQ8v7dgtpoQnkF/LP8Ruu9zXdJHg4igAAAABJRU5ErkJgggA=
  :target: https://www.fiware.org/developers/catalogue/

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

Table of Contents
=================

.. toctree::
   :glob:
   :maxdepth: 2

   Programmers Guide <doc/user_guide>
   Installation and Administration Guide <doc/admin_guide>
   Architecture Description <doc/architecture>
   Open API Specification <doc/open_spec>
