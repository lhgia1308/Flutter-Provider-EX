import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/routes.dart';

class RecommendedPlants extends StatelessWidget {
  RecommendedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: plantList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RouteManager.detailScreen4,
                  arguments: plantList[index]);
            },
            child: Container(
              // decoration:
              // BoxDecoration(border: Border.all(color: Colors.black)),
              width: 170,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                // alignment: const Alignment(-0.4, 0.8),
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      plantList[index].image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${plantList[index].name}\n",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                TextSpan(
                                  text: plantList[index].country,
                                  style: Theme.of(context).textTheme.subtitle2,
                                )
                              ],
                            ),
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
            ),
          );
        },
      ),
    );
  }
}
