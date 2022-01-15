import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/generated/l10n.dart';
import 'package:flutter_provider_ex/constrants.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        S.of(context).labelHeader,
        style: textStyleDefault,
      ),
    );
  }
}
