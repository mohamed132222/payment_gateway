import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles/styles.dart';

AppBar buildAppBar({String? title, void Function()? onPressed}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_outlined),
      onPressed: onPressed,
    ),

    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(title ?? "", textAlign: TextAlign.center, style: Styles.font25),
  );
}
