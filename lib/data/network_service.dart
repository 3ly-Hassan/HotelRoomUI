import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkService {
  Future<Map<String, dynamic>> getHotel() async {
    try {
      var response =
          await Dio().get('http://privatestays.jyif.org/api/properties/41');
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return {};
    }
  }
}
