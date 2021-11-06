import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/services/api_manager.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainScreen5 extends StatefulWidget {
  const MainScreen5({Key? key}) : super(key: key);

  @override
  State<MainScreen5> createState() => _MainScreen5State();
}

class _MainScreen5State extends State<MainScreen5> {
  late RefreshController tripRefreshController;
  var apiController = Get.put(API_Manager());
  @override
  void initState() {
    apiController.getTrips();
    tripRefreshController = RefreshController();
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
    return Container(
      padding: const EdgeInsets.all(10),
      height: _size.height,
      child: GetBuilder<API_Manager>(
        initState: (_) {
          print("object");
          Center(child: const CircularProgressIndicator());
        },
        builder: (_) {
          if (apiController.tripData != null) {
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
              footer: customeFooterTrip(),
              enablePullUp: true,
              enablePullDown: true,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final trip = apiController.tripData[index];
                  return ListTile(
                    title: Text("${trip.name}"),
                    subtitle: Text("${trip.airline[0].country}"),
                    trailing: Text("${trip.airline[0].name}"),
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

  Widget customeFooterTrip() {
    return CustomFooter(
      builder: (context, mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = CircularProgressIndicator();
          if (Platform.isAndroid) body = CircularProgressIndicator();
          if (Platform.isIOS) body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("Load Failed!Click retry!");
        } else if (mode == LoadStatus.canLoading) {
          body = Text(
            "Loading more",
            style: Theme.of(context).textTheme.bodyText1,
          );
        } else {
          body = Text("No more Data");
        }
        return Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: 50,
          height: 50,
          child: Center(child: body),
        );
      },
    );
  }
}
