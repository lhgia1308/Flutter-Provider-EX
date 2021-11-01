import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';

class RecommendedTitle extends StatelessWidget {
  RecommendedTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              RoundButton(
                onPress: () {
                  print("fsfds");
                },
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
