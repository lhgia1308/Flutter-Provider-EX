import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundButton(
          background: Colors.white,
          icon: Icons.arrow_back,
          color: Colors.green,
        ),
        Text(
          "You are in place",
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
