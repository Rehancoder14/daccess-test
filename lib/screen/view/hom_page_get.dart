import 'dart:developer';

import 'package:daccesstest/screen/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              await HomeRepository.instance.getData();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
