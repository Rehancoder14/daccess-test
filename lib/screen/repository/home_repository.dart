import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:daccesstest/constant/apiconstant.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class HomeRepository {
  HomeRepository._();

  static final HomeRepository instance = HomeRepository._();

  Future<void> fetchData() async {
    log('check');
    try {
      final response = await http.get(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.getApi),
      );

      if (response.statusCode == 200) {
        // Decode the response from Base64
        final decodedData = utf8.decode(base64.decode(response.body));

        // Process the decoded data as needed
        print(decodedData);
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      if (error is TimeoutException) {
        print('Request timed out');
      } else if (error is SocketException) {
        log('Error $error');
      } else {
        print('Error: $error');
      }
    }
  }

  Future<void> postData({
    required String command,
    required String activityDate,
    required String thought,
    PlatformFile? bFile,
    PlatformFile? aFile,
  }) async {
    var param = {
      "Command": command,
      "ActivityDate": activityDate,
      "ThaoughtOfDay": thought,
    };

    if (bFile != null) {
      // Add BirthdayCard as a file
      param["BirthdayCard"] = (await http.MultipartFile.fromPath(
        'BirthdayCard',
        bFile.path!,
        filename: bFile.name,
        contentType: MediaType.parse(lookupMimeType(bFile.path!)!),
      )) as String;
    }

    if (aFile != null) {
      // Add WelcomeCard as a file
      param["WelComeCard"] = (await http.MultipartFile.fromPath(
        'WelComeCard',
        aFile.path!,
        filename: aFile.name,
        contentType: MediaType.parse(lookupMimeType(aFile.path!)!),
      )) as String;
    }

    try {
      var response = await http.post(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.postApi),
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        body: param,
      );

      if (response.statusCode == 200) {
        // Handle the successful response as needed
        log('Post request successful');
        log('Response: ${response.body}');
      } else {
        log('Failed to make the POST request. Status code: ${response.statusCode}');
        log('Response: ${response.body}');
      }
    } catch (error) {
      log('Error: $error');
    }
  }
}
