import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/appbar.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/comment.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/header.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/ride_info.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeScreen3 extends StatelessWidget {
  HomeScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          AppHeader(),
          Positioned(
            top: -100,
            left: 10,
            child: Image.asset(
              "assets/images/bg.png",
              height: 280,
              // width: doub,
            ),
          ),
          Column(
            children: [
              CustomAppBar(),
              const SizedBox(height: 50),
              Image.asset(
                "assets/images/avata.png",
                width: 160,
              ),
              const SizedBox(height: 10),
              Text("Your driver", style: Theme.of(context).textTheme.bodyText1),
              Text("Mr Gia", style: Theme.of(context).textTheme.headline4),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RideInfo(title: "Time", value: "15 min"),
                  RideInfo(title: "Price", value: "\$ 9.99"),
                  RideInfo(title: "Distance", value: "2.3 km"),
                ],
              ),
              Divider(),
              Text("Mark", style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 5),
              Text(
                "How is you trip",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 10),
              SmoothStarRating(
                allowHalfRating: false,
                onRated: (v) {},
                starCount: 5,
                size: 40,
                isReadOnly: false,
                spacing: 10,
                color: Colors.amber,
                borderColor: Colors.amber,
              ),
              const SizedBox(height: 10),
              Comment(),
              // const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Submit", style: Theme.of(context).textTheme.button),
                    const SizedBox(width: 10),
                    RoundButton(
                      onPress: () {},
                      background: Colors.green,
                      iconWidget:
                          Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
