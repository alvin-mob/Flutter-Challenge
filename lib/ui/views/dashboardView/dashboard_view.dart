import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenge/constants/enums.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/core/bloc/dashboard_bloc.dart';
import 'package:flutterchallenge/core/bloc/dashboard_state.dart';
import 'package:flutterchallenge/core/models/screen_time_model.dart';
import 'package:flutterchallenge/ui/sharedWidgets/chart_legend.dart';
import 'package:flutterchallenge/ui/sharedWidgets/circular_chart.dart';
import 'package:flutterchallenge/ui/sharedWidgets/linear_progress_bar.dart';
import 'package:flutterchallenge/ui/sharedWidgets/retry_widget.dart';
import 'package:flutterchallenge/ui/views/dashboardView/widgets/dashboard_loader.dart';
import 'package:flutterchallenge/ui/views/dashboardView/widgets/device_list_widget.dart';
import 'package:flutterchallenge/ui/views/dashboardView/widgets/free_time_usage_widget.dart';
import 'package:provider/provider.dart';

class DashBoardView extends StatefulWidget {
  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {

  loadData(){
    Provider.of<DashBoardBloc>(context,listen: false).eventSink.add(DashBoardAction.Fetch);

  }


  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final dashBoardBloc = Provider.of<DashBoardBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        actions: [
          IconButton(onPressed: (){
          // dashBoardBloc.eventSink.add(DashBoardAction.Fetch);
          }, icon:SvgPicture.asset("assets/icons/settings.svg"))
        ],
        title: Row(
          children: [
            Container(
              width: 29,
              height: 29,
              decoration: const BoxDecoration(
                gradient: CustomTheme.primaryGradient,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 5,),
            Text('Michael',style: CustomTheme.textStyleTitle3,),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: width*.9,
            height: height,
            child: RefreshIndicator(
              onRefresh: ()async{
                loadData();
                },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: StreamBuilder<DashboardState>(
                  stream: dashBoardBloc.screenTimeStream,
                  initialData: DashboardState(data: null, isLoading: true, hasError: false, errorMsg:''),
                  builder: (context, snapshot) {
                    final DashboardState? state = snapshot.data;
                    if(state!.isLoading){
                      return const DashboardLoader();
                    }
//                if(snapshot.connectionState == ConnectionState.waiting)
//                  return Center(child: CircularProgressIndicator());
                    if(state.hasError){
                      return Container(
                       height: height,
                          child: RetryWidget(onTap: loadData)
                      );
                    }
                    return Column(
                      children: [
                        SizedBox(height: 20,),
                        Text("Dashboard",style: CustomTheme.textStyleHeading2.copyWith(fontFamily: CustomTheme.fontFamilyEuclid),),
                        CircularChart(),
                        ChartLegend(state.data!.chartData!),
                        SizedBox(height: 20,),
                        Divider(height:0,),
                        SizedBox(height: 30,),
                        FreeTimeUsageWidget(state.data!),
                        SizedBox(height: 20,),
                        Divider(height: 0,),
                        SizedBox(height: 20,),
                        DeviceListWidget(state.data!.deviceUsage!),
                      ],
                    );
                  }
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
