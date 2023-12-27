import 'package:daccesstest/screen/controller/home_controller.dart';
import 'package:daccesstest/screen/view/hom_page_get.dart';
import 'package:daccesstest/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(ApiService());
          Get.put(
            HomeController(),
          );
        },
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
