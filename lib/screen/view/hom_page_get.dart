import 'dart:developer';

import 'package:daccesstest/screen/controller/home_controller.dart';
import 'package:daccesstest/screen/repository/home_repository.dart';
import 'package:daccesstest/screen/view/component/data_tile.dart';
import 'package:daccesstest/screen/view/home_page_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        HomeRepository.instance.fetchData();
      }),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text(
          'Home Page',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              log('rehan');
              Get.to(() => const HomePageForm());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GetX<HomeController>(builder: (controller) {
        return controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.groupModel.length,
                itemBuilder: (context, index) {
                  return DataTile(
                    command:
                        controller.groupModel[index]['command'] ?? 'null value',
                    activityDate: controller.groupModel[index]
                            ['activityDate'] ??
                        'null value',
                    thought: controller.groupModel[index]['thaoughtOfDay'] ??
                        'null value',
                    aLink: '${controller.groupModel[index]['birthdayCard']}',
                    bLink: '${controller.groupModel[index]['anniversaryCard']}',
                  );
                },
              );
      }),
    );
  }
}
