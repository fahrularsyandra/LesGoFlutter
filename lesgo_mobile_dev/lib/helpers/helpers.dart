import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helpers{

  headers() async {
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString('access_token');

    return Options(headers: {"authorization": "Bearer $token "});
  }
}