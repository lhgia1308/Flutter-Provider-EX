import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:get/get.dart';

class PlacesCategoris extends StatelessWidget {
  PlacesCategoris({Key? key, required this.placesCategoris, selectedIndex})
      : super(key: key);

  final List<String> placesCategoris;
  var selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: placesCategoris.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                selectedIndex.value = index;
              },
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    placesCategoris[index],
                    style: TextStyle(
                        fontSize: defaultFontSize,
                        color: selectedIndex == index
                            ? kBackgroundColor
                            : kTextColor),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
