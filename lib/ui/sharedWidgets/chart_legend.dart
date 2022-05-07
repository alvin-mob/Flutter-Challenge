import 'package:flutter/material.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/core/models/screen_time_model.dart';
import 'package:flutterchallenge/utils/utils.dart';

class ChartLegend extends StatelessWidget {
  final ChartData data;
  const ChartLegend(this.data,{Key? key}) : super(key: key);
  Widget _legendItem(String label, Color color, String? time){
   return Row(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              color:color,
              shape: BoxShape.circle
            ),
          ),
        ),
        SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label,style: CustomTheme.textStyleTitle3),
            const SizedBox(height: 3),
            Text(Utils.convertMinutesToTimeString(time),style: CustomTheme.textStyleTitle3.copyWith(
              fontFamily: CustomTheme.fontFamilyRedHatDisplay,
              fontWeight: FontWeight.w700
            ),)
          ],
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         _legendItem("Class", CustomTheme.primaryBlue, data.classTime!.total),
         _legendItem("Study", CustomTheme.primaryOrange, data.studyTime!.total),
         _legendItem("Free-time", CustomTheme.primaryGreen, data.freeTime!.total),
        ],
      ),
    );
  }
}
