import 'package:flutter/material.dart';

class ImageHelper {
  static Image loadImage(String imageName, {double? width, double? height}) {
    return Image.asset(
      imageName,
      width: width,
      height: height,
    );
  }
}
