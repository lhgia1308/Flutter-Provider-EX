import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/screens/main/components/rate_star.dart';
import 'package:flutter_provider_ex/utils/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceInfo extends StatelessWidget {
  PlaceInfo({
    Key? key,
    required this.height,
    required this.place,
  }) : super(key: key);

  final double height;
  final Place place;

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(seconds: 1),
      child: Container(
        height: height,
        child: Stack(
          alignment: const Alignment(-0.9, 1.1),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: ClipRRect(
                child: Image.asset(
                  place.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: Responsive.isLandscape(context) ? 120 : 130,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.name),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/location_pin.svg"),
                      const SizedBox(width: 10),
                      Text(place.location)
                    ],
                  ),
                  RateStar(place: place),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
