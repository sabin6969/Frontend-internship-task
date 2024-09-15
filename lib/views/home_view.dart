import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobileapp/constants/app_assets_constants.dart';
import 'package:mobileapp/controllers/item_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter + Node Js Task"),
      ),
      body: GetX<ItemController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
              child: Lottie.asset(
                AppAssetsConstants.loadingLottieAnimationPath,
              ),
            );
          } else if (controller.itemsModel != null) {
            return RefreshIndicator(
              onRefresh: () async {
                controller.fetchAllItems();
              },
              child: controller.itemsModel!.data.isEmpty
                  ? const Center(
                      child: Text(
                        "No items to display add some",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.itemsModel?.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            controller.itemsModel?.data[index].itemName ?? "",
                          ),
                          leading: Text(
                            controller.itemsModel?.data[index].id.toString() ??
                                "",
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.deleteItems(
                                id: controller.itemsModel?.data[index].id ?? 0,
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
