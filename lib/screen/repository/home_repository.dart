import 'dart:developer';

import 'package:daccesstest/constant/apiconstant.dart';
import 'package:daccesstest/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeRepository {
  HomeRepository._();

  static final HomeRepository instance = HomeRepository._();

  final _apiService = Get.find<ApiService>();
  Future<void> getData() async {
    try {
      final response = await _apiService.get(ApiConstant.getApi);
      log(response.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      if (e is DioError) {
        rethrow;
      }
      rethrow;
    }
  }

  // Future<void> postData(String dataToPost) async {
  //   // Replace 'YOUR_API_URL' with the actual API endpoint
  //   final apiUrl = 'YOUR_API_URL';

  //   try {
  //     // Encode the data to Base64
  //     String base64EncodedData = base64.encode(utf8.encode(dataToPost));

  //     // Make the POST request with the encoded data
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: {
  //         'Content-Type':
  //             'application/json', // Adjust the content type if needed
  //       },
  //       body: jsonEncode({'data': base64EncodedData}),
  //     );

  //     if (response.statusCode == 200) {
  //       // Handle the successful response as needed
  //       log('Post request successful');
  //       log('Response: ${response.body}');
  //     } else {
  //       // Handle errors
  //       log('Failed to make the POST request. Status code: ${response.statusCode}');
  //       log('Response: ${response.body}');
  //     }
  //   } catch (error) {
  //     // Handle network or encoding errors
  //     log('Error: $error');
  //   }
  // }
}
