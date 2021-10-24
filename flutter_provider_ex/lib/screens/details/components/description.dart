import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/place.dart';

class Description extends StatelessWidget {
  Description({Key? key, required this.place}) : super(key: key);
  Place place;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: Theme.of(context).textTheme.caption),
        const SizedBox(height: 10),
        Text(place.description, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}
