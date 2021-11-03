import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/constrants.dart';
import 'package:flutter_provider_ex/screens/temp3/main/components/round_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  Search({
    Key? key,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.text = "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        color: kPrimaryColor1,
        boxShadow: const [
          BoxShadow(
            color: kBoxShadowColor,
            offset: Offset(0, 6),
            blurRadius: 0.4,
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hi Gia", style: Theme.of(context).textTheme.bodyText1),
                RoundButton(
                  onPress: () {
                    // print("Search clicked!");
                  },
                  background: Colors.white,
                  iconWidget: SvgPicture.asset(
                    "assets/icons/menu_doc.svg",
                    color: kPrimaryColor1,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: const Alignment(0, 1.5),
            child: textField(
              controller: searchController,
              // onTap: () {
              //   searchController.selection = TextSelection(
              //       baseOffset: 0,
              //       extentOffset: searchController.value.text.length);
              // },
              hintText: "Search",
              backgroundColor: Colors.white,
              suffixIcon: IconButton(
                onPressed: () {
                  print("Search clicked!");
                },
                icon: const Icon(Icons.search),
              ),
            ),
          )
        ],
      ),
    );
  }
}
