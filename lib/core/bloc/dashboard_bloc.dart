import 'dart:async';
import 'package:flutterchallenge/constants/enums.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/core/bloc/dashboard_state.dart';
import 'package:flutterchallenge/core/bloc/dashboard_state.dart';
import 'package:flutterchallenge/core/models/api_response.dart';
import 'package:flutterchallenge/core/models/screen_time_model.dart';
import 'package:flutterchallenge/core/services/dashboard_services.dart';
import 'package:flutterchallenge/ui/sharedWidgets/circular_chart.dart';
import 'package:rxdart/rxdart.dart';

class DashBoardBloc {
  ApiResponse? screenTimeResponse;
  final DashboardServices _services = DashboardServices();

  _getScreenTimeData() async {
    _screenTimeSink.add(DashboardState(data: null, isLoading: true, errorMsg: '', hasError: false));
    screenTimeResponse = await _services.getScreenTimeData();
    if(!screenTimeResponse!.haserror){
      _screenTimeSink.add(DashboardState(data: screenTimeResponse!.data, isLoading: false, errorMsg: '', hasError: false));
    }else{
      _screenTimeSink.add(DashboardState(data: null, isLoading: false, hasError: true, errorMsg: screenTimeResponse!.errormessage!));
    }
  }

  final StreamController<DashboardState>  _stateStreamController = BehaviorSubject();
  final StreamController<DashBoardAction> _eventStreamController = BehaviorSubject();

  final StreamController<double> _linearProgressStreamController = BehaviorSubject();

  StreamSink<DashboardState?> get _screenTimeSink => _stateStreamController.sink;
  Stream<DashboardState> get screenTimeStream => _stateStreamController.stream;
  StreamSink<DashBoardAction> get eventSink => _eventStreamController.sink;
  Stream<DashBoardAction> get _eventStream => _eventStreamController.stream;
  Stream<double> get linearProgressStream => _linearProgressStreamController.stream;
  StreamSink<double> get _linearProgressSink => _linearProgressStreamController.sink;


  getLinearProgress(double width,{required var usedTime, required var maxTime}){
    double progress = width * (int.parse(usedTime)/int.parse(maxTime));
    _linearProgressSink.add(progress);
  }
  DashBoardBloc() {
    _eventStream.listen((event) async {
      if(event == DashBoardAction.Fetch) {
         _getScreenTimeData();
      }
    });
  }
  List<CircularChartData> getCircularChartData(){
    final ChartData chartData = screenTimeResponse!.data.chartData;
    List<CircularChartData> data = [];
    data.add(CircularChartData("classTime", double.parse(chartData.classTime!.total!), CustomTheme.primaryBlue));
    data.add(CircularChartData("studyTime", double.parse(chartData.studyTime!.total!), CustomTheme.primaryOrange));
    data.add(CircularChartData("freeTime", double.parse(chartData.freeTime!.total!), CustomTheme.primaryGreen));
    return data;
  }

  void dispose(){
    _linearProgressStreamController.close();
    _stateStreamController.close();
    _eventStreamController.close();
  }
}