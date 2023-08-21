import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:n8_default_project/data/models/detail/one_call_data.dart';
import 'package:n8_default_project/data/models/main/weather_main_model.dart';
import 'package:n8_default_project/data/models/universal_data.dart';
import 'package:n8_default_project/data/network/network_utils.dart';
import 'package:n8_default_project/utils/constants.dart';

class ApiProvider {
  static Future<UniversalData> getMainWeatherDataByQuery(
      {required String query}) async {
    Uri uri =
        Uri.parse("$baseUrl/data/2.5/weather?q=$query&appid=$apiKeyForMain");

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalData(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)));
      }

      return UniversalData(error: "Error!");
    } catch (err) {
      return UniversalData(error: err.toString());
    }
  }

  static Future<UniversalDataForDaly> getWeatherOneCallData({
    required double lat,
    required double long,
  }) async {
    //139d82d53b7f20c0a44c1bc27377f9ff
    //4a8eaf9ed512f638cdd7a82434895402
    Uri uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=41.211855&lon=69.204212&appid=649ff9f2558d2c45135158b30bc262d8");

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == HttpStatus.ok) {
        return UniversalDataForDaly(
            data: OneCallData.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalDataForDaly(error: "Internet Error!");
    } on FormatException {
      return UniversalDataForDaly(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalDataForDaly(error: err.toString());
    }
  }

  static Future<UniversalDataForDaly> getMainWeatherDataByLatLong({
    required double lat,
    required double long,
  }) async {
    Uri uri = Uri.https(
      baseUrlWithoutHttp,
      "/data/2.5/weather",
      {
        "appid": apiKeyForMain,
        "lat": lat.toString(),
        "lon": long.toString(),
      },
    );

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return UniversalDataForDaly(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalDataForDaly(error: "Internet Error!");
    } on FormatException {
      return UniversalDataForDaly(error: "Format Error!");
    } catch (err) {
      return UniversalDataForDaly(error: err.toString());
    }
  }
}
