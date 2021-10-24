import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:get/get.dart';

class ChooseDay extends StatelessWidget {
  ChooseDay({Key? key, required this.place}) : super(key: key);
  Place place;
  @override
  Widget build(BuildContext context) {
    RxInt days = place.id.obs;
    return Row(
      children: [
        Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.black),
            color: Colors.white38,
          ),
          child: LayoutBuilder(builder: (context, constraint) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    days--;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kButtonColor,
                    ),
                    height: constraint.maxHeight,
                    child: Text("-"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Obx(() => Text("${days}")),
                ),
                GestureDetector(
                  onTap: () {
                    days++;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kButtonColor,
                    ),
                    height: constraint.maxHeight,
                    child: Text("+"),
                  ),
                )
              ],
            );
          }),
        ),
        const SizedBox(width: 30),
        const Icon(Icons.timer),
        const SizedBox(width: 10),
        Obx(() => Text("${days} Days"))
      ],
    );
  }
}
