import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/generated/l10n.dart';

class Header extends StatelessWidget {
  var parastr = {};
  Header({Key? key, required this.parastr}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        S.of(context).labelHeader,
        style: parastr['textStyleDefault'],
      ),
    );
  }
}
