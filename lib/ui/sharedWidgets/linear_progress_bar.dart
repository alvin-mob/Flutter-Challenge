import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/core/bloc/dashboard_bloc.dart';
import 'package:flutterchallenge/core/models/screen_time_model.dart';
import 'package:provider/provider.dart';

class LinearProgressBar extends StatefulWidget {
  final ScreenTimeModel data;
   const LinearProgressBar(this.data, {Key? key}) : super(key: key);

  @override
  State<LinearProgressBar> createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar> {
  final GlobalKey _globalKey = GlobalKey();
@override
  void initState() {
  SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
    Provider.of<DashBoardBloc>(context,listen: false)
        .getLinearProgress(_globalKey.currentContext!.size!.width,
    maxTime: widget.data.freeTimeMaxUsage,
        usedTime: widget.data.chartData!.freeTime!.total);
  });
  super.initState();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  final dashboardBloc = Provider.of<DashBoardBloc>(context,listen: false);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            key: _globalKey,
            width: double.infinity,
            height: 22,
            color: CustomTheme.backgroundBlue,
          ),
        ),
        Positioned(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
              child: StreamBuilder<double>(
                stream: dashboardBloc.linearProgressStream,
                initialData: 0.0,
                builder: (context, snapshot) {
                  return AnimatedContainer(
                    width: snapshot.data,
                    height: 22,
                    color: CustomTheme.primaryGreen,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                }
              ),
            ),)
      ],

    );
  }
}
