import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/plant.dart';

class PlantInfo extends StatelessWidget {
  PlantInfo({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${plant.name} \n",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  TextSpan(
                      text: "${plant.country}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ),
          Text(
            "\$${plant.price}",
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: Container(
            padding: EdgeInsets.all(val * 10),
            child: child,
          ),
        );
      },
    );
  }
}
