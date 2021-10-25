import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            "Recommended",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              "View all",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
