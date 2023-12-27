import 'dart:convert';
import 'dart:developer';
import 'package:daccesstest/constant/apiconstant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  PostRepo._();

  static final PostRepo instance = PostRepo._();

  Future<void> postData({
    required String command,
    required String activityDate,
    required String thought,
    PlatformFile? bFile,
    PlatformFile? aFile,
    PlatformFile? file,
  }) async {
    log('check');
    log(aFile.toString());
    log(bFile.toString());
    var param = {
      "Command": 'INSERT',
      "ActivityDate": activityDate,
      "ThaoughtOfDay": thought,
    };

    try {
      if (bFile != null) {
        param["BirthdayCard"] = await encodeFile(bFile);
      }

      if (aFile != null) {
        param["WelComeCard"] = await encodeFile(aFile);
      }

      if (file != null) {
        param["AnniversaryCard"] = await encodeFile(file);
      }

      log(param.toString());

      var response = await http.post(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.postApi),
        body: param,
      );

      log(response.statusCode.toString());
      log(response.body.toString());
    } catch (error) {
      log('Error: $error');
    }
  }

  Future<String> encodeFile(PlatformFile file) async {
    try {
      List<int> fileBytes = file.bytes!;
      String encodedFile = base64Encode(fileBytes);
      return encodedFile;
    } catch (error) {
      log('File Encoding Error: $error');
      rethrow; // Rethrow the error to indicate the issue
    }
  }
}
