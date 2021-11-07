import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomFooterTrip extends StatelessWidget {
  CustomFooterTrip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (context, mode) {
        Widget? body;
        if (mode == LoadStatus.idle) {
          if (Platform.isAndroid) body = const CircularProgressIndicator();
          if (Platform.isIOS) body = const CupertinoActivityIndicator();
        } else if (mode == LoadStatus.loading) {
          body = const CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = const Text("Load Failed!Click retry!");
        } else if (mode == LoadStatus.canLoading) {
          body = Text(
            "Loading more",
            style: Theme.of(context).textTheme.bodyText1,
          );
        } else {
          body = const Text("No more Data");
        }
        return Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: 50,
          height: 50,
          child: Center(child: body),
        );
      },
    );
  }
}
