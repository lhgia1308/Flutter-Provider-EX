import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/menu.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/search.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen4 extends StatelessWidget {
  const MainScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Menu(),
          Search(),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
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
          )
        ],
      ),
    );
  }
}
