import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/routes.dart';
import 'package:flutter_provider_ex/screens/home1/components/welcome_button.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Winter\n Vacation Trips",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
              "Enjoy your winter vacations with warmth and amazing sightseeing on the mountains. Enjoy the best experiense with us!"),
          const SizedBox(
            height: 30,
          ),
          WelcomeButton(
            tapEvent: () {
              Navigator.of(context).pushNamed(RouteManager.mainScreen);
            },
          )
        ],
      ),
    );
  }
}
