Integration with Orion
%%%%%%%%%%%%%%%%%%%%%%

.. content

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

Processing Media Streams
========================

Any Media Stream that flows in Kurento can be processed by one or more
modules. Some modules would rise Media Events following the logic they
are meant to with associated information. For example, the built-in
module “kms-platedetector” would rise a Media Event whenever a traffic
plate is detected, this event would contain the plate number read from
the Media Stream. This Events should be collected by the client
application an the application should act upon them.

Kurento Events
--------------

You can configure to receive Kurento Events into your client application
and extract relevant context information that can be fed to Orion.

Example:

You develop a Client Application with a Kurento attached and the
kms-platedetector built-in module. Each time a traffic plate is detected
, Kurento rises a Event and your application reacts by:

-  Inserting the Event as a MediaEvent in Orion.

-  Looking for the plate in Orion, and update the location of the
   vehicle associated.

MediaEvents to Orion
--------------------

MediaEvent is a generic FIWARE DataModel *(still under approval
process)* that allows any application using Kurento to insert in Orion
any type or Kurento Event risen by any module *If you are using Java for
implementing your client application you can
use*\ `kurento-fiware <https://github.com/naevatec/kurento-fiware-java/tree/master/kurento-fiware>`__\ *module
to simplify all the integration*.

While using the provided library you need just to:

1. Configure the connection to the Orion instance by:

   .. code:: java

      final OrionConnectorConfiguration orionConnectorConfiguration = new OrionConnectorConfiguration();

2. Define how to exactly match the detected Event to the MediaEvent
   DataModel extending the ``MediaEventPublisher`` defining a
   ``mapEntityToOrionEntity``. E.g.

   .. code:: java

      public MediaEvent mapEntityToOrionEntity(DevicePlateDetectedEvent kurentoEvent) {
        MediaEvent orion_entity = new MediaEvent();
        orion_entity.setId(...);
        orion_entity._getGsmaCommons().setDateCreated(kurentoEvent.getTimestamp());
        orion_entity.setData(kurentoEvent.getPlate());
        if (kurentoEvent.getCamera() != null) {
          orion_entity.setDeviceSource(kurentoEvent.getCamera().getId());
        }
        orion_entity.setMediasource(mapKurentoMediaSource(kurentoEvent.getSource()));
        return orion_entity;
      }

3. And publish the event.

   .. code:: java

      plateDetectedEventPublisher.publish(extendedEvent);

You can check the specifics of the MediaEvent DataModel
`here <https://github.com/Fiware/dataModels>`__.

Devices
=======

The cameras used for generating the Media Streams are also part of the
context so we expect them to be also part of the information that can be
found in Orion. Devices are an an integral part of the common entities
found in Orion and they are defined as a very generic FIWARE DataModel,
so any kind of “camera” used in the Kurento Client application can be
represented in `this
DataModel <https://fiware-datamodels.readthedocs.io/en/latest/Device/Device/doc/spec/index.html>`__.

If your Client Kurento Application is developed in Java you can also
make use of the provided
`kurento-fiware <https://github.com/naevatec/kurento-fiware-java/tree/master/kurento-fiware>`__
module to simplify all the integration.

The essential steps for inserting Devices into Orion are similar to the
Media Events’ ones:

1. Configure the connection to the Orion instance by:

   .. code:: java

      final OrionConnectorConfiguration orionConnectorConfiguration = new OrionConnectorConfiguration();


2. Define how to exactly match the custom Camera used in the application
   to the Device DataModel extending the ``DevicePublisher`` defining a
   ``mapEntityToOrionEntity``. E.g.

   .. code:: java

      public Device mapEntityToOrionEntity(Camera cam) {

        String[] supportedProtocol = { "WebRTC" };

        Device entity = new Device();

        entity.setControlledAsset(cam.getControlledAsset());
        entity.setDateInstalled(cam.getCreationDate());
        entity.setDeviceState(cam.getState());
        entity._getDeviceCommons().setSupportedProtocol(supportedProtocol);
        entity._getGsmaCommons().setId(cam.getId());
        entity._getGsmaCommons().setDateCreated(cam.getCreationDate());
        entity._getGsmaCommons().setDescription("Plate detector camera example");
        entity._getGsmaCommons().setName(cam.getName());
        entity.setIpAddress(cam.getIp());
        return entity;
      }

3. Publish the Device.

   .. code:: java

      CamPublisher cameraPublisher = new CamPublisher(orionConnectorConfiguration);
      cameraPublisher.publish(cam);


4. Update the Device for each change of state (e.g. “PAUSED” /
   “PROCESSING”) or each last value detected.

   .. code:: java

      final OrionConnectorConfiguration orionConnectorConfiguration = new OrionConnectorConfiguration();
      CamPublisher cameraPublisher = new CamPublisher(orionConnectorConfiguration);
      CamReader cameraReader = new CamReader(orionConnectorConfiguration);
      Camera cam = cameraReader.readObject(id);
      /* Update values of cam */
      cameraPubliser.update(cam);

Other entities
==============

While developing your Smart Solution you would need to work with other
Entities in Orion, for example Vehicles, Alerts, places such as museums,
gardens, etc. While Kurento Entities aren’t directly related to these,
the kurento-fiware module, provides an easy way of extending its
functionality to any other DataModel and any other custom Object. Look
for the specifications of the library for more detail.

**Follow the
proposed** \ `tutorial <https://github.com/naevatec/kurento-fiware-java/tree/master/kurento-tutorial-java>`__\  **to
get this going!**