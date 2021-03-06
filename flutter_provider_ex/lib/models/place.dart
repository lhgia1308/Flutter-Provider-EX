import 'package:flutter/material.dart';

class Place {
  final int id;
  final String name;
  final String description;
  final String location;
  final String image;
  final int rating;
  final double price;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.image,
    required this.rating,
    required this.price,
  });
}
