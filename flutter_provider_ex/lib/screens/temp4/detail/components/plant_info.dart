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
    return Container(
      padding: const EdgeInsets.all(10),
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
    );
  }
}
