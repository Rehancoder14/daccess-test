import 'dart:developer';

import 'package:daccesstest/screen/repository/home_repository.dart';
import 'package:daccesstest/screen/repository/post_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PlatformFile? file;
  PlatformFile? anniversaryfile;
  PlatformFile? welcomeFile;
  TextEditingController commandController = TextEditingController();
  TextEditingController thoughtController = TextEditingController();
  TextEditingController activityDateController = TextEditingController();
  TextEditingController welcomeController = TextEditingController();
  List<dynamic> groupModel = [];

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getData();

    super.onInit();
  }

  fileUploadBirthday() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
      ],
      allowMultiple: false,
    );
    if (result != null) {
      file = result.files.first;
      log(file.toString());
    } else {
      log(' No file selected');
    }
  }

  fileUploadAnniversary() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
      ],
      allowMultiple: false,
    );
    if (result != null) {
      anniversaryfile = result.files.first;
      log(anniversaryfile.toString());
    } else {
      log(' No file selected');
    }
  }

  fileUploadWelcome() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'png',
      ],
      allowMultiple: false,
    );
    if (result != null) {
      log(result.files[0].bytes.toString());
      welcomeFile = result.files.first;

      log(welcomeFile.toString());
    } else {
      log(' No file selected');
    }
  }

  getData() async {
    isLoading.value = true;
    groupModel = await HomeRepository.instance.fetchData();
    isLoading.value = false;
  }

  postData() async {
    await PostRepo.instance.postData(
        file: welcomeFile,
        command: commandController.text,
        activityDate: activityDateController.text,
        thought: thoughtController.text,
        bFile: file,
        aFile: anniversaryfile);
  }

  void pickDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      print('Selected Date: $pickedDate');
      activityDateController.text = pickedDate.toString();
    }
  }
}
