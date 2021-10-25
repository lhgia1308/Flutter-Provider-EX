import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/utils/responsive.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    Key? key,
    required Size size,
    required this.place,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive.isLandscape(context)
          ? _size.height * 1.5
          : _size.height * 0.9,
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: ClipRRect(
        child: Image.asset(
          place.image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
