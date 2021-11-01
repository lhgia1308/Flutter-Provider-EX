import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/controllers/get_controller.dart';
import 'package:flutter_provider_ex/screens/temp1/main1/components/place_card.dart';
import 'package:get/get.dart';

class AdvSlider extends StatelessWidget {
  AdvSlider({Key? key}) : super(key: key);

  var controller = Get.put(GetController());
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(
      viewportFraction: 1,
      initialPage: 0,
    );
    Timer.periodic(
      const Duration(seconds: 5),
      (Timer timer) {
        int sliderLen = demoPlaces.length;
        if (controller.currentSlider < sliderLen - 1) {
          controller.increaseSlider(1);
        } else {
          controller.setCurrentSilder(0);
        }
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            controller.currentSlider,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        }
      },
    );
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: PageView.builder(
              onPageChanged: (value) {
                controller.setCurrentSilder(value);
                // print("currentSlider: ${controller.currentSlider}");
              },
              controller: _pageController,
              itemCount: demoPlaces.length,
              itemBuilder: (BuildContext context, int index) =>
                  PlaceCard(place: demoPlaces[index]),
            ),
          ),
          GetBuilder<GetController>(
            builder: (_) => Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  demoPlaces.length,
                  (index) => buildDotNav(index: index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDotNav({index}) {
    // print("controller.currentSlider1: ${controller.currentSlider}");
    return AnimatedContainer(
      duration: const Duration(microseconds: 10),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: controller.currentSlider == index ? 24.0 : 6.0,
      decoration: BoxDecoration(
        color: controller.currentSlider == index
            ? kPrimaryColor
            : kPrimaryColor.withAlpha(70),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
