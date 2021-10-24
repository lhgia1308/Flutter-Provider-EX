import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem extends StatelessWidget {
  NavItem({
    Key? key,
    required this.icon,
    required this.isActive,
  }) : super(key: key);
  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: 10,
          onPressed: () {},
          icon: SvgPicture.asset(icon),
        ),
        Container(
          height: 4,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? kPrimaryColor : Colors.transparent,
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 6,
            //     offset: Offset(0, -2),
            //     color: isActive ? kPrimaryColor : Colors.transparent,
            //   )
            // ],
          ),
        )
      ],
    );
  }
}
