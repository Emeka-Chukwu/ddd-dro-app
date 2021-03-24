import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final Function onTap;
  final IconData iconData;

  const ButtonIcon({
    Key? key,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.lightGrey,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
        ),
      ),
    );
  }
}
