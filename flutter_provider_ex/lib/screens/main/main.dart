import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/screens/main/places_categoris.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

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
            itemBuilder: (BuildContext context, int index) => Container(
              // margin: EdgeInsets.only(right: 17),
              child: Stack(
                alignment: const Alignment(-0.9, 1),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(demoPlaces[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kCardInfoBG.withOpacity(0.6),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              demoPlaces[index].name,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon:
                                    SvgPicture.asset("assets/icons/heart.svg"),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.star_border)
                        // SmoothStarRating(
                        //   rating: demoPlaces[index].rating,
                        //   isReadOnly: false,
                        //   // size: 80,
                        //   filledIconData: Icons.star,
                        //   halfFilledIconData: Icons.star_half,
                        //   defaultIconData: Icons.star_border,
                        //   starCount: 5,
                        //   allowHalfRating: true,
                        //   spacing: 2.0,
                        //   onRated: (value) {
                        //     print("rating value -> $value");
                        //     // print("rating value dd -> ${value.truncate()}");
                        //   },
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
