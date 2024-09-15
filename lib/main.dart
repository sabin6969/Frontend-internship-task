import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/constants/app_route_constants.dart';
import 'package:mobileapp/controllers/item_controller.dart';
import 'package:mobileapp/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteConstants.homePageRoute,
      getPages: [
        GetPage(
          name: AppRouteConstants.homePageRoute,
          page: () => const HomeView(),
          binding: BindingsBuilder(
            () {
              Get.lazyPut(
                () => ItemController(),
              );
            },
          ),
        ),
      ],
    );
  }
}
