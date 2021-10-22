import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceCard extends StatelessWidget {
  PlaceCard({Key? key, required this.place}) : super(key: key);

  Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Stack(
        alignment: const Alignment(-0.9, 1),
        children: [
          //Background
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(place.image), fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kCardInfoBG.withOpacity(0.6),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      place.name,
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
                        icon: SvgPicture.asset("assets/icons/heart.svg"),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.star_border)
                // SmoothStarRating(
                //   rating: place.rating,
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
    );
  }
}
