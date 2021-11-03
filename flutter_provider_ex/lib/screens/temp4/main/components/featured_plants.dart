import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';

class FeaturedPlants extends StatelessWidget {
  FeaturedPlants({Key? key, required this.onPress}) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredPlantList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onPress,
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  featuredPlantList[index].image!,
                  fit: BoxFit.cover,
                  width: 300,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
