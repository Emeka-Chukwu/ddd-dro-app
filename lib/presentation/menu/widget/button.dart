import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';

class ButtonAddToBag extends StatelessWidget {
  final Function onTap;

  const ButtonAddToBag({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          alignment: Alignment.center,
          width: Responsive.screenWidth(90, context),
          height: Responsive.screenHeight(7, context),
          decoration: BoxDecoration(
            color: AppColor.droPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: AppColor.white,
              ),
              const XMargin(10),
              Text(
                "Add to bag",
                style: TextStyle(
                  color: AppColor.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonModal extends StatelessWidget {
  final Function onTap;
  final String text;

  const ButtonModal({Key? key, required this.onTap, this.text = "View Bag"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        width: Responsive.screenWidth(85, context),
        height: Responsive.screenHeight(7, context),
        decoration: BoxDecoration(
          color: AppColor.success,
          // borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: AppColor.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
