import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/screens/main/components/rate_star.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceDetailTitle extends StatelessWidget {
  const PlaceDetailTitle({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
