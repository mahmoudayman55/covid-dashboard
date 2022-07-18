import 'package:flutter/material.dart';
import 'device_type_enum.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData,width) {

  if (width >= 950) {
    print("device is desktop $width");

    return DeviceType.desktop;
  }
   if (width >= 600) {
    print("device is tablet $width");
    return DeviceType.tablet;
  }

    return DeviceType.mobile;
}