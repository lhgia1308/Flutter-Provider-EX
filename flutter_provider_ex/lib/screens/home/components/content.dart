import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/controllers/login_controller.dart';
import 'package:flutter_provider_ex/models/user_detail.dart';
import 'package:flutter_provider_ex/routes.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  var parastr = {};
  HomeContent({Key? key, required this.parastr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserDetail? userDetail;
    return Column(
      children: [
        Consumer<LoginController>(
          builder: (context, model, child) {
            return Container(
              child:
                  Text("Home Content xin chao ${model.getUserDetail!.email}}"),
            );
          },
        ),
        Text(
          "context watch: ${context.watch<LoginController>().getUserDetail!.displayName}",
          style: TextStyle(color: context.watch<LoginController>().getColor()),
        ),
        ElevatedButton(
          child: Text("Change color Text"),
          onPressed: () {
            context.read<LoginController>().colorText = Colors.blue;
          },
        ),
        ElevatedButton(
          child: Text("Contact"),
          onPressed: () {
            Navigator.of(context).pushNamed(RouteManager.contactScreen);
          },
        ),
        ElevatedButton(
          child: Text("Logout"),
          onPressed: () async {
            await Provider.of<LoginController>(context, listen: false)
                .googleLogout();
            userDetail = context.watch();
            if (userDetail != null) {
              Navigator.of(context).pushNamed(RouteManager.homeScreen);
            }
          },
        )
      ],
    );
  }
}
