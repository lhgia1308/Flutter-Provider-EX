import 'package:flutter/material.dart';
import 'package:flutter_provider_ex/controllers/get_controller.dart';
import 'package:flutter_provider_ex/models/article.dart';
import 'package:flutter_provider_ex/models/trip.dart';
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
  Trip? trip;
  @override
  void initState() {
    getAPIController();
    tripRefreshController = RefreshController();
    super.initState();
  }

  void getAPIController() async {
    await apiController.getTrips();
    trip = apiController.trip;
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
      child: GetBuilder<GetController>(
        initState: (_) async {
          await apiController.getTrips();
          trip = apiController.trip;
        },
        builder: (_) {
          if (apiController.trip != null) {
            return SmartRefresher(
              controller: tripRefreshController,
              onRefresh: () {
                apiController.getTrips(refresh: true);
                if (apiController.tripResult)
                  tripRefreshController.refreshCompleted();
                else
                  tripRefreshController.refreshFailed();
              },
              onLoading: () {
                apiController.getTrips();
                if (apiController.tripResult)
                  tripRefreshController.refreshCompleted();
                else
                  tripRefreshController.refreshFailed();
              },
              enablePullUp: true,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final trip = apiController.trip!.data[index];
                  return ListTile(
                    title: Text("${trip.name}"),
                    subtitle: Text("${trip.airline[0].country}"),
                    trailing: Text("${trip.airline[0].name}"),
                  );
                },
                separatorBuilder: (BuildContext context, int val) =>
                    const Divider(),
                itemCount: apiController.trip!.data.length,
              ),
            );
          } else
            return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
