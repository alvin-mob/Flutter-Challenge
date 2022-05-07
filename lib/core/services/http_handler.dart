import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutterchallenge/utils/logger.dart';
import 'package:http/http.dart';
import 'package:flutterchallenge/core/models/api_response.dart';

const timeoutDuration = Duration(seconds: 20);
class HttpHandler{
  static Future<ApiResponse> getRequest(String url) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      Logger.log("get url", url);
      Response response = await get(Uri.parse(url)).timeout(timeoutDuration);
      int statusCode = response.statusCode;
      Logger.log("statusCode", statusCode.toString());
      String body = response.body;
      Logger.log("response", body);
      if (response.statusCode >= 200 && response.statusCode <= 250) {
        final result = jsonDecode(response.body);
          apiResponse.haserror = false;
          apiResponse.data = result;

      } else {
        apiResponse.haserror = true;
        apiResponse.errormessage = response.body;
      }
    } on TimeoutException {
      return ApiResponse(haserror: true, errormessage: 'Timeout');
    } on SocketException {
      return ApiResponse(haserror: true, errormessage: 'Network error');
    } catch (e) {
      return ApiResponse(haserror: true, errormessage: e.toString());
    }
    return apiResponse;
  }
}