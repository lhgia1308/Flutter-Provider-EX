import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/screens/details/components/choose_day.dart';
import 'package:flutter_provider_ex/screens/details/components/description.dart';
import 'package:flutter_provider_ex/screens/details/components/place_detail_title.dart';
import 'package:flutter_provider_ex/screens/details/components/place_image.dart';
import 'package:flutter_provider_ex/screens/details/components/place_info.dart';
import 'package:flutter_provider_ex/screens/details/components/price.dart';
import 'package:flutter_provider_ex/screens/main/components/rate_star.dart';
import 'package:flutter_provider_ex/utils/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.argument}) : super(key: key);
  Object? argument;

  @override
  Widget build(BuildContext context) {
    Place place = argument as Place;
    Size _size = MediaQuery.of(context).size;
    return Stack(
      alignment: const Alignment(-0.9, 1.1),
      children: [
        PlaceImage(size: _size, place: place),
        DelayedDisplay(
          delay: const Duration(microseconds: 10),
          child: Container(
            width: double.infinity,
            // height: Responsive.isLandscape(context) ? 120 : 130,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaceDetailTitle(place: place),
                const SizedBox(height: 10),
                ChooseDay(place: place),
                const SizedBox(height: 10),
                Description(place: place),
                const SizedBox(height: 10),
                Price(place: place)
              ],
            ),
          ),
        )
      ],
    );
  }
}
