import 'dart:developer';

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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const DataTile();
        },
      ),
    );
  }
}
