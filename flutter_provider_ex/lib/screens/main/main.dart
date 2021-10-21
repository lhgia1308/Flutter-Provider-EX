import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/Place.dart';
import 'package:flutter_provider_ex/screens/main/places_categoris.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> placesCategoris = [
      "Popular",
      "Featured",
      "Most Vissited",
      "Europe",
      "Asia",
      "Africa",
      "America",
      "Australia"
    ];
    return Column(
      children: [
        PlacesCategoris(placesCategoris: placesCategoris),
        SizedBox(
          width: double.infinity,
          height: 260,
          child: PageView.builder(
            onPageChanged: (value) {},
            controller: PageController(
              viewportFraction: 0.9,
              initialPage: 0,
            ),
            itemCount: demoPlaces.length,
            itemBuilder: (BuildContext context, int index) => Stack(
              alignment: const Alignment(-0.9, 0),
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(demoPlaces[index].image),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(demoPlaces[index].name),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/heart.svg"),
                        )
                      ],
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
