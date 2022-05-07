import 'package:flutterchallenge/core/models/api_response.dart';
import 'package:flutterchallenge/core/models/screen_time_model.dart';
import 'package:flutterchallenge/utils/utils.dart';

import 'http_handler.dart';

class DashboardServices{

  getScreenTimeData() async {
    ApiResponse result = await HttpHandler.getRequest(
      Utils.baseUrl + "p68289/screentime",
    );
    if(!result.haserror){
      final ScreenTimeModel data = ScreenTimeModel.fromJson(result.data[0]);
      return ApiResponse(haserror: false, data: data, errormessage: '');
    }
    return result;
  }


}