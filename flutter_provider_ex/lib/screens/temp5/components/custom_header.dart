import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomHeaderTrip extends StatelessWidget {
  CustomHeaderTrip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(builder: (context, mode) {
      Widget? body;
      if (mode == RefreshStatus.canRefresh) {
        if (Platform.isAndroid) body = const CircularProgressIndicator();
        if (Platform.isIOS) body = const CupertinoActivityIndicator();
      } else if (mode == RefreshStatus.failed)
        body = const Text("Refresh failed!");
      return Container(
        width: 50,
        height: 50,
        child: Center(
          child: body,
        ),
      );
    });
  }
}
