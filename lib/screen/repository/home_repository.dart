import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:daccesstest/constant/apiconstant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  HomeRepository._();

  static final HomeRepository instance = HomeRepository._();
  Future<List<Map<String, dynamic>>> fetchData() async {
    log('check');
    try {
      final response = await http.get(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.getApi),
      );

      if (response.statusCode == 200) {
        // Parse the response directly as a list of maps (assuming it's a JSON array)
        final List<Map<String, dynamic>> decodedData =
            List<Map<String, dynamic>>.from(jsonDecode(response.body));
        log(decodedData.toString());

        // Process the decoded data as needed
        for (var item in decodedData) {
          log('activityDate: ${item["activityDate"]}');
          log('thaoughtOfDay: ${item["thaoughtOfDay"]}');
          // Add more processing logic as needed
        }

        return decodedData;
      } else {
        log('Failed to fetch data. Status code: ${response.statusCode}');
        log('Response: ${response.body}');
      }

      return []; // Return an empty list in case of an error
    } catch (error) {
      if (error is TimeoutException) {
        log('Request timed out');
      } else if (error is SocketException) {
        log('Error: $error');
      } else {
        log('Error: $error');
        rethrow;
      }

      return []; // Return an empty list in case of an error
    }
  }
}
