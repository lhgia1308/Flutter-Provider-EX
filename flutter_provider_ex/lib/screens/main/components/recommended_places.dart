import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/routes.dart';
import 'package:flutter_provider_ex/screens/main/components/card_info.dart';
import 'package:flutter_provider_ex/utils/responsive.dart';

class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisCount: Responsive.isLandscape(context) ? 3 : 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: List.generate(
        demoPlaces.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(RouteManager.detailScreen,
                arguments: demoPlaces[index]);
          },
          child: Stack(
            alignment: const Alignment(-0.9, 1),
            children: [
              Hero(
                tag: demoPlaces[index].id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    demoPlaces[index].image,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CardInfo(place: demoPlaces[index], scale: 0.6)
            ],
          ),
        ),
      ),
    );
  }
}
