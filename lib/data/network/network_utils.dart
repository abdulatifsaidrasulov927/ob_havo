import 'dart:convert';
import 'dart:io';

import 'package:n8_default_project/data/models/universal_data.dart';
import 'package:http/http.dart' as http;

UniversalDataForDaly handleHttpErrors(http.Response response) {
  switch (response.statusCode) {
    case HttpStatus.badRequest:
      {
        return UniversalDataForDaly(
          error: "Bad request exception",
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.unauthorized:
      {
        return UniversalDataForDaly(
          error: jsonDecode(response.body)["message"],
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.forbidden:
      {
        return UniversalDataForDaly(
          error: jsonDecode(response.body)["message"],
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.notFound:
      {
        return UniversalDataForDaly(
          error: jsonDecode(response.body)["message"],
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.internalServerError:
      {
        return UniversalDataForDaly(
          error:
              "Error occurred while Communication with Server with StatusCode : ${response.statusCode}",
          statusCode: response.statusCode,
        );
      }
    case HttpStatus.notImplemented:
      {
        return UniversalDataForDaly(
          error: "Server Error : ${response.statusCode}",
          statusCode: response.statusCode,
        );
      }
    default:
      return UniversalDataForDaly(
        error: "Unknown Error occurred!",
        statusCode: response.statusCode,
      );
  }
}
