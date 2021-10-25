import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    Key? key,
    required this.tapEvent,
  }) : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: kPrimaryColor,
        ),
        width: 200,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Let's Go!",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Image.asset(
                "assets/images/arrow.png",
                fit: BoxFit.scaleDown,
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
