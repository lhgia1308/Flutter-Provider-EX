import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/trip.dart';
import 'package:flutter_provider_ex/services/api_manager.dart';

class TripList extends StatelessWidget {
  TripList({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final Datum trip;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${trip.name}",
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(
        "${trip.airline[0].country}",
        style: Theme.of(context).textTheme.subtitle2,
      ),
      trailing: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.1,
            child: ClipRRect(
              child: Image.network(
                trip.airline[0].logo,
                fit: BoxFit.cover,
                width: 120,
              ),
            ),
          ),
          Text(
            "${trip.airline[0].name}",
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
