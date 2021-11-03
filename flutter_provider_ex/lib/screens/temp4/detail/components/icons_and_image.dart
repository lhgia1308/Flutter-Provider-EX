import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/models/plant.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';
import 'package:flutter_provider_ex/utils/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsAndImage extends StatelessWidget {
  IconsAndImage({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: Responsive.isLandscape(context)
                ? const EdgeInsets.all(20)
                : const EdgeInsets.symmetric(vertical: 40),
            height: Responsive.isLandscape(context)
                ? _size.height
                : _size.height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundButton(
                  background: Colors.white,
                  iconWidget: Icon(
                    Icons.arrow_back,
                    color: kPrimaryColor1,
                  ),
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SvgPicture.asset(
                    "assets/icons/sun.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SvgPicture.asset(
                    "assets/icons/icon_2.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SvgPicture.asset(
                    "assets/icons/icon_3.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SvgPicture.asset(
                    "assets/icons/icon_4.svg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: Responsive.isLandscape(context)
              ? _size.height
              : _size.height * 0.7,
          width: _size.width * 0.7,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor1,
                offset: const Offset(-5, 2),
                blurRadius: 20,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            child: Image.asset(
              plant.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
