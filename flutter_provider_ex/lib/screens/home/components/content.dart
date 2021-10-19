import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_provider_ex/controllers/login_controller.dart';
import 'package:flutter_provider_ex/generated/l10n.dart';
import 'package:flutter_provider_ex/models/user_detail.dart';
import 'package:flutter_provider_ex/routes.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  var parastr = {};
  HomeContent({Key? key, required this.parastr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserDetail? _userDetail = context.watch<LoginController>().getUserDetail;
    String? _displayName = _userDetail == null ? "" : _userDetail.displayName;
    //Having 3 methods get data from Provider
    Color? _color = context.watch<LoginController>().getColor;
    // Color? _color1 = context.watch<LoginController>().getColor1();
    // Color? _color =
    //     Provider.of<LoginController>(context, listen: false).getColor;
    // Color? _color =
    //     Provider.of<LoginController>(context, listen: true).getColor1();
    String? _idUser = _userDetail == null ? "" : _userDetail.id;
    String? _email = _userDetail == null ? "" : _userDetail.email;
    return Column(
      children: [
        //Show data from Provider using Consume, condition must return a widget
        //Show Avata
        Consumer<LoginController>(
          builder: (context, model, child) {
            String? _displayName1 = model.getUserDetail == null
                ? ""
                : model.getUserDetail?.displayName;
            String? _photoURL = model.getUserDetail == null
                ? ""
                : model.getUserDetail?.photoURL ?? "";
            if (_photoURL != "") {
              return CircleAvatar(
                child: Image.network(
                  _photoURL,
                  fit: BoxFit.contain,
                ),
              );
            } else {
              return CircleAvatar(
                child: Image.asset(
                  "assets/images/IconApp.png",
                  fit: BoxFit.cover,
                ),
              );
            }
          },
        ),
        //Shown id
        Text(
          "ID: ${_idUser}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        //Show name
        Text(
          "${S.of(context).labelName}: ${_displayName}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        //Show email
        Text(
          "Email: ${_email}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        // ElevatedButton(
        //   child: Text(
        //     "Change color Text",
        //     style: context.watch<LoginController>().getDefaultTextStyle(),
        //   ),
        //   onPressed: () {
        //     //Having 2 methods set data to Provider
        //     context.read<LoginController>().setColorText(Colors.black);
        //     // Provider.of<LoginController>(context, listen: false)
        //     //     .setColorText(Colors.black);
        //     //DO NOT USE listen: true
        //     // Provider.of<LoginController>(context, listen: true)
        //     //     .setColorText(Colors.black);
        //   },
        // ),
      ],
    );
  }
}
