import 'package:flutterchallenge/core/models/screen_time_model.dart';

class DashboardState{
  bool isLoading;
  ScreenTimeModel? data;
  bool hasError;
  String errorMsg;
  DashboardState(
      {
        required this.data,
        required this.isLoading,
        required this.hasError,
        required this.errorMsg
      });
}