import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late GlobalKey<AnimatedListState> _keyList = GlobalKey<AnimatedListState>();

  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 500),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCirc,
  ));

  @override
  void initState() {
    apiController.getTrips();
    tripRefreshController = RefreshController();

    // _controller = AnimationController(
    //   duration: Duration(milliseconds: 500),
    //   vsync: this,
    // )..forward();

    // _offsetAnimation = Tween<Offset>(
    //   begin: const Offset(1, 0),
    //   end: const Offset(0, 0),
    // ).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInCirc,
    // ));

    super.initState();
  }

  @override
  void dispose() {
    tripRefreshController.dispose();
    apiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    Tween<Offset> _offset =
        Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
    // apiController.tripData.forEach((element) {
    //   _keyList.currentState!.insertItem(apiController.tripData.length - 1);
    // });
    return Container(
      padding: const EdgeInsets.all(10),
      height: _size.height,
      child: GetBuilder<API_Manager>(
        builder: (_) {
          if (apiController.tripData.length > 0) {
            for (var element in apiController.tripData) {
              _keyList.currentState
                  ?.insertItem(apiController.tripData.length - 1);
            }
            return SmartRefresher(
              controller: tripRefreshController,
              onRefresh: () {
                apiController.getTrips(isRefresh: true);
                // inspect(apiController.trip);
                // print(
                //     "apiController.currentPage: ${apiController.currentPage}");
                if (apiController.tripStatus == 1)
                  tripRefreshController.refreshCompleted();
                else if (apiController.tripStatus == 0)
                  tripRefreshController.refreshFailed();
              },
              onLoading: () {
                apiController.getTrips();
                // print(
                //     "apiController.currentPage: ${apiController.currentPage}");
                // print(
                //     "apiController.totalPageTrip: ${apiController.totalPageTrip}");
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
              //   key: _keyList,
              //   initialItemCount: apiController.tripData.length,
              //   itemBuilder: (context, index, animation) {
              //     final trip = apiController.tripData[index];
              //     return SlideTransition(
              //       child: TripList(trip: trip),
              //       position: _offsetAnimation,
              //     );
              //   },
              // ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final trip = apiController.tripData[index];
                  // apiController.loadTime = apiController.loadTime + 20;
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
