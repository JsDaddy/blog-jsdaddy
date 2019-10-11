---
title: Arduino with Flutter
tags:
  - Development
  - FLUTTER
  - Arduino
date: 2019-10-09 17:00:00
---
![](/blog/css/images/arduino_logo.png)

If you need to connect Arduino with your Android phone by USB, you need an OTG and [usb_serial](https://pub.dev/packages/usb_serial).

## Flutter Side
Install [usb_serial](https://pub.dev/packages/usb_serial) package

First you need variable ports to keep connection 
```$xslt
  UsbPort _port;
```

Here we connect to the specific device
```dart
  Future<bool> _connectTo(device) async {
    if (_port != null) {
      _port.close();
      _port = null;
    }

    _port = await device.create();
    if (!await _port.open()) {
      return false;
    }
    await _port.setDTR(true);
    await _port.setRTS(true);
    await _port.setPortParameters(
        9600, UsbPort.DATABITS_8,
        UsbPort.STOPBITS_1, 
        UsbPort.PARITY_NONE);
    return true;
  }
```
**Important first argument of ``setPortParameters`` must be the same on Flutter Side and Arduino Side**

Here we are getting list of devices and connecting only first device 
```dart
 void _getPorts() async {
    _ports = [];
    List<UsbDevice> devices = await UsbSerial.listDevices();
    await _connectTo(devices.isEmpty ? null : devices[0]);
  }
```
On init state initialize listener for incoming events and fire ``_getPorts`` function

```dart
@override
    void initState() {
      UsbSerial.usbEventStream.listen((UsbEvent event) {
        _getPorts();
      });
      _getPorts();
      super.initState();
    }
```
And last we need function that will send message to Arduino

```dart
void sendMsg(String message) async {
  await _port.write(Uint8List.fromList(msg.codeUnits));
  }
```

## Arduino Side

All you need here it is [arduino web IDE](https://www.arduino.cc/en/Main/software)

![](/blog/css/images/arduino-side.png)
