import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';

class FeaturedPlantTitle extends StatelessWidget {
  FeaturedPlantTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Plant",
                style: Theme.of(context).textTheme.caption,
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
