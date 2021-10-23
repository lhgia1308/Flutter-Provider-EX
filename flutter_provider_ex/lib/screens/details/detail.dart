import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/place.dart';
import 'package:flutter_provider_ex/screens/details/components/place_info.dart';
import 'package:flutter_provider_ex/utils/responsive.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.argument}) : super(key: key);
  Object? argument;

  @override
  Widget build(BuildContext context) {
    Place place = argument as Place;
    RxInt days = place.id.obs;
    Size _size = MediaQuery.of(context).size;
    double _scale = Responsive.isLandscape(context) ? 0.5 : 0.3;
    double _height = _size.height * _scale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: _height, child: PlaceInfo(size: _height, place: place)),
        Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white38,
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          // padding: EdgeInsets.all(5),
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
                      color: kPrimaryLightColor,
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
                      color: kPrimaryLightColor,
                    ),
                    height: constraint.maxHeight,
                    child: Text("+"),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
