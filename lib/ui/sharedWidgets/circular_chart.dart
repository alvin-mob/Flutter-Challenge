import 'package:flutter/material.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/core/bloc/dashboard_bloc.dart';
import 'package:flutterchallenge/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                  widget: Container(
                      child: PhysicalModel(
                          child: Container(),
                          shape: BoxShape.circle,
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: const Color.fromRGBO(230, 230, 230, 1)))),
              CircularChartAnnotation(
                  widget: Container(
                      child:  Column(
                        children: [
                          Text('Total',textAlign: TextAlign.center,
                              style:  CustomTheme.textStyleHeading3.copyWith(
                                fontFamily: CustomTheme.fontFamilyRedHatDisplay,
                                fontWeight: FontWeight.w700
                              )),
                          Text('${Utils.convertMinutesToTimeString("150")}',textAlign: TextAlign.center,
                              style:  CustomTheme.textStyleHeading1.copyWith(
                              )),
                        ],
                      )))
            ],
            series: <CircularSeries>[
              // Renders doughnut chart
              DoughnutSeries<CircularChartData, String>(
                  dataSource: Provider.of<DashBoardBloc>(context,listen: false).getCircularChartData(),
                  pointColorMapper:(CircularChartData data,  _) => data.color,
                  xValueMapper: (CircularChartData data, _) => data.x,
                  yValueMapper: (CircularChartData data, _) => data.y,
                  innerRadius: '85%'
              )
            ]
        )
    );
  }
}


class CircularChartData {
  CircularChartData(this.x, this.y,this.color);
  final String x;
  final double y;
  final Color color;


}