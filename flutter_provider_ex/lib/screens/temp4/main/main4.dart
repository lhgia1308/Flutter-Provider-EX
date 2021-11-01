import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/menu.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/recommended_title.dart';
import 'package:flutter_provider_ex/screens/temp4/main/components/search.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen4 extends StatelessWidget {
  const MainScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Menu(),
          Search(),
          const SizedBox(height: 30),
          RecommendedTitle(),
          const SizedBox(height: 10),
          Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plantList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 170,
                  child: Stack(
                    alignment: const Alignment(-0.4, 0.8),
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          plantList[index].image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        // width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${plantList[index].name}\n",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  TextSpan(
                                    text: plantList[index].country,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "${plantList[index].price}",
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
