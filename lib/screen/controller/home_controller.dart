import 'dart:developer';

import 'package:daccesstest/screen/model/home_model.dart';
import 'package:daccesstest/screen/repository/home_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PlatformFile? file;
  PlatformFile? anniversaryfile;
  TextEditingController commandController = TextEditingController();
  TextEditingController thoughtController = TextEditingController();
  TextEditingController activityDateController = TextEditingController();
  List<GroupModel> groupModel = [];
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
    } else {
      log(' No file selected');
    }
  }

  getData() {}

  postData() async {
    await HomeRepository.instance.postData(
        command: commandController.text,
        activityDate: activityDateController.text,
        thought: thoughtController.text,
        bFile: file,
        aFile: anniversaryfile);
  }
}
