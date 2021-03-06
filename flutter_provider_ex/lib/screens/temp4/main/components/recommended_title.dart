import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';

class RecommendedTitle extends StatelessWidget {
  RecommendedTitle({Key? key, required this.onPress}) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: Theme.of(context).textTheme.caption,
              ),
              RoundButton(
                onPress: onPress,
                background: kPrimaryColor1,
                iconWidget: Text(
                  "More",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                width: 80,
              )
            ],
          )
        ],
      ),
    );
  }
}
