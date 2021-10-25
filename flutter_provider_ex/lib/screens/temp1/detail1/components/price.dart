import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/models/place.dart';

class Price extends StatelessWidget {
  Price({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$${place.price}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextSpan(text: " / "),
                TextSpan(
                  text: "Package",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.purple[900]!),
            ),
            onPressed: () {},
            child: Text(
              "Book",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
