import 'package:flutter/material.dart';

class RideInfo extends StatelessWidget {
  RideInfo({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle2),
        const SizedBox(height: 5),
        Text(value, style: Theme.of(context).textTheme.subtitle1)
      ],
    );
  }
}
