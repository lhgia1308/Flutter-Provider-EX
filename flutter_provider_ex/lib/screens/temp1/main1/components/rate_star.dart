import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/place.dart';

class RateStar extends StatelessWidget {
  RateStar({Key? key, required this.place}) : super(key: key);
  Place place;
  @override
  Widget build(BuildContext context) {
    final int quantity = 5;
    return Container(
      child: Row(
        children: _buildStar(quantity: 5, rate: place.rating),
      ),
    );
  }

  List<Widget> _buildStar({required int quantity, int rate = 0}) {
    List<Widget> _lst = [];
    for (var i = 0; i < rate; i++) {
      Widget container = Container(
        child: Icon(Icons.star, color: Colors.amber[300]),
      );
      _lst.add(container);
    }
    for (var t = rate; t < quantity; t++) {
      Widget container = Container(
        child: Icon(Icons.star_border_outlined, color: Colors.amber[300]),
      );
      _lst.add(container);
    }
    return _lst;
  }
}
