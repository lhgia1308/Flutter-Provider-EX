import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context,
    {String? title,
    List<Widget>? actions,
    Widget? leading,
    required bool automaticallyImplyLeading}) {
  return AppBar(
    backgroundColor: Colors.amber,
    elevation: 0,
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Text(
      title!,
      style: Theme.of(context).textTheme.bodyText1,
    ),
    leading: leading,
    actions: actions,
  );
}
