import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';

class Comment extends StatelessWidget {
  Comment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      decoration: BoxDecoration(
          border: Border.all(color: kHintTextColor),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(3, 7),
              color: kHintTextColor.withAlpha(20),
            )
          ]),
      child: const TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 3,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5),
          border: InputBorder.none,
          hintText: "Additional Comment",
          hintStyle: TextStyle(color: kHintTextColor),
        ),
      ),
    );
  }
}
