import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/featured_plant_title.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/featured_plants.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/menu.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/recommended_plants.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/recommended_title.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/search.dart';

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
          RecommendedTitle(onPress: () {}),
          const SizedBox(height: 10),
          RecommendedPlants(),
          const SizedBox(height: 10),
          FeaturedPlantTitle(),
          const SizedBox(height: 10),
          FeaturedPlants(onPress: () {}),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
