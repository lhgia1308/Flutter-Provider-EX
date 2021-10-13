import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/routes.dart';

class HomeContent extends StatelessWidget {
  var parastr = {};
  HomeContent({Key? key, required this.parastr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text("Home Content xin chao ${parastr['username']}"),
        ),
        ElevatedButton(
          child: Text("Contact"),
          onPressed: () {
            Navigator.of(context).pushNamed(RouteManager.contactScreen);
          },
        ),
        ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
