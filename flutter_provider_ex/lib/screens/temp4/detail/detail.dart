import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/plant.dart';
import 'package:flutter_provider_ex/screens/temp4/detail/components/bottom_buttons.dart';
import 'package:flutter_provider_ex/screens/temp4/detail/components/icons_and_image.dart';
import 'package:flutter_provider_ex/screens/temp4/detail/components/plant_info.dart';

class DetailScreen4 extends StatelessWidget {
  const DetailScreen4({Key? key, required this.argument}) : super(key: key);
  final Object? argument;

  @override
  Widget build(BuildContext context) {
    Plant plant = argument as Plant;
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        IconsAndImage(plant: plant),
        const SizedBox(height: 10),
        PlantInfo(plant: plant),
        const SizedBox(height: 10),
        BottomButtons(size: _size),
      ],
    );
  }
}
