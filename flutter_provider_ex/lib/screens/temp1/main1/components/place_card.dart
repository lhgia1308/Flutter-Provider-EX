import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/screens/temp1/main1/components/card_info.dart';

class PlaceCard extends StatelessWidget {
  PlaceCard({Key? key, required this.place}) : super(key: key);

  Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        alignment: const Alignment(-0.9, 1),
        children: [
          Hero(
            tag: place.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LayoutBuilder(builder: (context, constraint) {
                return Image.asset(
                  place.image,
                  width: double.infinity,
                  height: constraint.maxHeight,
                  fit: BoxFit.cover,
                );
              }),
            ),
          ),
          CardInfo(place: place, scale: 0.5)
        ],
      ),
    );
  }
}
