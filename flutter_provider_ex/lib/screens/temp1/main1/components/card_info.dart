import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/screens/temp1/main1/components/rate_star.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardInfo extends StatelessWidget {
  CardInfo({Key? key, required this.place, required this.scale})
      : super(key: key);
  Place place;
  double scale;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        height: constraint.maxHeight * scale,
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
                Expanded(child: Text(place.name)),
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
            RateStar(place: place)
          ],
        ),
      );
    });
  }
}
