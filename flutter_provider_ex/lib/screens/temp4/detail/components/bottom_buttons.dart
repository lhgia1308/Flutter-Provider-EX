import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';

class BottomButtons extends StatelessWidget {
  BottomButtons({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: 70,
      child: Row(
        children: [
          Container(
            width: _size.width / 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
              ),
              color: kPrimaryColor1,
            ),
            child: Text(
              "Buy Now",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                ),
                color: Colors.amber[900],
              ),
              child: Text("Description"),
            ),
          ),
        ],
      ),
    );
  }
}
