import 'package:flutter/cupertino.dart';

class Responsive {
  static double screenHeight(double height, BuildContext context) {
    // ignore: prefer_final_locals
    var portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    // ignore: prefer_final_locals
    var viewportHeight = portrait
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;
    return viewportHeight * (height / 100);
  }

  static double screenWidth(double width, BuildContext context) {
    // ignore: prefer_final_locals
    var portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    // ignore: prefer_final_locals
    var viewportHeight = portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.width;
    return viewportHeight * (width / 100);
  }
}
