import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void changeScreen(BuildContext context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
