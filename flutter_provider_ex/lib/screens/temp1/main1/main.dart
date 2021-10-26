import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/controllers/get_controller.dart';
import 'package:flutter_provider_ex/screens/temp1/main1/components/places_categoris.dart';
import 'package:flutter_provider_ex/screens/temp1/main1/components/recommended_places.dart';
import 'package:flutter_provider_ex/screens/temp1/main1/components/recommened.dart';
import 'package:flutter_provider_ex/screens/temp1/main1/components/sider.dart';
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
        RecommendedPlaces()
      ],
    );
  }
}
