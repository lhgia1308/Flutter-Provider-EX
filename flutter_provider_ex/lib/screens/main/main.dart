import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/controllers/get_controller.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/screens/main/components/places_categoris.dart';
import 'package:flutter_provider_ex/screens/main/components/recommened.dart';
import 'package:flutter_provider_ex/screens/main/components/sider.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.put(GetController());
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlacesCategoris(placesCategoris: placesCategoris),
        Sider(),
        Recommended(),
        GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            demoPlaces.length,
            (index) => GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text("data"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
