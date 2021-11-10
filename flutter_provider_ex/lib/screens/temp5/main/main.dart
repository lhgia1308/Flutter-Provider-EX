import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider_ex/models/trip.dart';
import 'package:flutter_provider_ex/screens/temp5/components/custom_footer.dart';
import 'package:flutter_provider_ex/screens/temp5/components/custom_header.dart';
import 'package:flutter_provider_ex/screens/temp5/components/trip_list.dart';
import 'package:flutter_provider_ex/services/api_manager.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainScreen5 extends StatefulWidget {
  const MainScreen5({Key? key}) : super(key: key);

  @override
  State<MainScreen5> createState() => _MainScreen5State();
}

class _MainScreen5State extends State<MainScreen5>
    with SingleTickerProviderStateMixin {
  late RefreshController tripRefreshController;
  var apiController = Get.put(API_Manager());
  late GlobalKey<AnimatedListState> _listKey;

  late final AnimationController animationController;
  late Duration animationDuration;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<Offset> _offsetAnimation1;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    apiController.getTrips();
    _listKey = GlobalKey<AnimatedListState>();
    tripRefreshController = RefreshController();

    animationDuration = const Duration(seconds: 2);

    animationController =
        AnimationController(duration: animationDuration, vsync: this);

    _offsetAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInCirc),
    );

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 30, end: 50), weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 50, end: 30), weight: 50)
      ],
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInCirc),
    );

    animationController.addListener(() {
      // print(animationController.value);
      // print(_offsetAnimation.value);
    });

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          print("AnimationStatus.completed");
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          print("AnimationStatus.dismissed");
        });
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    tripRefreshController.dispose();
    apiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: _size.height,
      child: GetBuilder<API_Manager>(
        builder: (_) {
          if (apiController.tripData.length > 0) {
            animationController.forward();
            return SmartRefresher(
              controller: tripRefreshController,
              onRefresh: () {
                apiController.getTrips(isRefresh: true);
                // inspect(apiController.trip);
                if (apiController.tripStatus == 1)
                  tripRefreshController.refreshCompleted();
                else if (apiController.tripStatus == 0)
                  tripRefreshController.refreshFailed();
              },
              onLoading: () {
                apiController.getTrips();
                if (apiController.tripStatus == 1)
                  tripRefreshController.loadComplete();
                else if (apiController.tripStatus == 0)
                  tripRefreshController.loadFailed();
                else if (apiController.tripStatus == 2)
                  tripRefreshController.loadNoData();
              },
              header: CustomHeaderTrip(),
              footer: CustomFooterTrip(),
              enablePullUp: true,
              enablePullDown: true,
              // child: AnimatedList(
              //   key: _listKey,
              //   initialItemCount: apiController.tripData.length,
              //   itemBuilder: (context, index, animation) {
              //     final trip = apiController.tripData[index];
              //     return SlideTransition(
              //       child: TripList(trip: trip),
              //       position: animation.drive(
              //         Tween(
              //           begin: const Offset(1, 0),
              //           end: const Offset(0, 0),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final trip = apiController.tripData[index];
                  return SlideTransition(
                    position: _offsetAnimation,
                    child: TripList(trip: trip),
                  );
                },
                separatorBuilder: (BuildContext context, int val) =>
                    const Divider(),
                itemCount: apiController.tripData.length,
              ),
            );
          } else
            return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
