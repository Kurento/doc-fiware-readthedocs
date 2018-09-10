KURENTO QUICK START GUIDE
%%%%%%%%%%%%%%%%%%%%%%%%%

**Welcome to the FIWARE Stream GE: Kurento! Here is what you need to do to start working with Kurento.**


**1.** **Install KMS and "Built-in modules*"**
   The `installation guide </user/installation>`__ explains different
   ways in which Kurento can be installed and how to install any
   built-in modules you would need.

   |

**2.** **Configure KMS**
   KMS is able to run as-is after a normal installation. However, there
   are several parameters that you might want to tune in the
   `configuration
   files <https://doc-kurento.readthedocs.io/en/stable/user/configuration.html>`__.

   |

**3.** **Install and configure Orion**
   You want to make a Smart Solution, so you need to manage the context
   so you would want to use Orion Context Broker. Check the `Orion
   Context Broker Installation & Administration 
   Guide <https://fiware-orion.readthedocs.io/en/master/admin/index.html>`__.

   |

**4.** **Write an Application**
   Write an application that queries the `Kurento
   API <https://doc-kurento.readthedocs.io/en/stable/features/kurento_api.html>`__
   to make use of the capabilities offered by KMS. The easiest way of
   doing this is to build on one of the provided `Kurento
   Clients <https://doc-kurento.readthedocs.io/en/stable/features/kurento_client.html>`__. And integrate it with Orion Context Broker.
   In general, you can use *any programming language* to write your
   application, as long as it speaks the `Kurento
   Protocol <https://doc-kurento.readthedocs.io/en/stable/features/kurento_protocol.html>`__ and it's able to use the REST API of Orion.  
   Have a look at the
   `features <https://doc-kurento.readthedocs.io/en/stable/user/features.html>`__
   offered by Kurento, and follow any of the multiple
   `tutorials <https://doc-kurento.readthedocs.io/en/stable/user/tutorials.html>`__
   that explain how to build basic applications.

   |

**5.** **Ask for help**
   If you face any issue with Kurento itself or have difficulties
   configuring the plethora of mechanisms that form part of WebRTC,
   don’t hesitate to `ask for
   help <https://doc-kurento.readthedocs.io/en/stable/user/support.html>`__
   to the Kurento community of users.

   .. raw:: html

      <!-- FIWARE contact? -->

   |

**6.** **Enjoy!**
   Kurento is a project that aims to bring the latest innovations closer
   to the people, and help connect them together. Make a great
   application with it, and let us know! We will be more than happy to
   find out about who is using Kurento and what is being built with it
   :-)


*** built-in modules** are extra modules developed by the Kurento
team to enhance the basic capabilities of Kurento Media Server.
