import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          RoundButton(
            onPress: () {},
            background: Colors.white,
            iconWidget: Icon(
              Icons.arrow_back,
              color: kPrimaryColor1,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "You are in place",
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
