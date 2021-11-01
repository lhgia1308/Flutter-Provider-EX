import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        color: kPrimaryColor1,
        boxShadow: const [
          BoxShadow(
            color: kBoxShadowColor,
            offset: Offset(0, 6),
            blurRadius: 0.4,
          ),
        ],
      ),
      child: Stack(
        // alignment: const Alignment(0.9, 1),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hi Gia", style: Theme.of(context).textTheme.bodyText1),
              RoundButton(
                onPress: () {},
                background: Colors.white,
                iconWidget: SvgPicture.asset(
                  "assets/icons/menu_doc.svg",
                  color: kPrimaryColor1,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Container(
            alignment: const Alignment(0, 8),
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: kBoxShadowColor,
                    offset: Offset(0, 4),
                    blurRadius: 0.4,
                  ),
                ],
              ),
              child: textField(
                hintText: "Search",
                backgroundColor: Colors.white,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
