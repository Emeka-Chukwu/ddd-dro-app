import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';

class ImageHolder extends StatelessWidget {
  final String imageUrl;

  const ImageHolder({Key? key, required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Image(
        image: AssetImage(
          imageUrl.png,
        ),
        height: Responsive.screenHeight(20, context),
        width: Responsive.screenHeight(20, context),
        fit: BoxFit.contain,
      ),
    );
  }
}
