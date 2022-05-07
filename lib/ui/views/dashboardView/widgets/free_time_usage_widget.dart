import 'package:flutter/material.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/core/models/screen_time_model.dart';
import 'package:flutterchallenge/ui/sharedWidgets/linear_progress_bar.dart';
import 'package:flutterchallenge/ui/sharedWidgets/primary_button_outlined.dart';
import 'package:flutterchallenge/utils/utils.dart';

class FreeTimeUsageWidget extends StatelessWidget {
  final ScreenTimeModel screenTimeData;
  const FreeTimeUsageWidget(this.screenTimeData,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Free-time Usage',
          style: CustomTheme.textStyleHeading3.copyWith(
              fontFamily: CustomTheme.fontFamilyEuclid,
              fontWeight: FontWeight.w500),),
        SizedBox(height: 20,),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Used',style: CustomTheme.textStyleTitle2,),
                SizedBox(height: 10,),
                Text("${Utils.convertMinutesToTimeString(screenTimeData.chartData!.freeTime!.total)}",
                  style: CustomTheme.textStyleHeading2.copyWith(
                  color: CustomTheme.secondaryGreen,
                  fontWeight: FontWeight.bold
                  ))
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Max',style: CustomTheme.textStyleTitle2,),
                SizedBox(height: 10,),
                Text("${Utils.convertMinutesToTimeString(screenTimeData.freeTimeMaxUsage)}",
                  style: CustomTheme.textStyleHeading2.copyWith(
                  fontWeight: FontWeight.bold
                  ))
              ],
            )
          ],
        ),
        SizedBox(height: 20,),
        LinearProgressBar(screenTimeData),
        SizedBox(height: 20,),
        PrimaryButtonOutlined("Extend Free-time", (){}),
        TextButton(onPressed: (){},
            child: Text("Change Time Restrictions",
              style: CustomTheme.textStyleTitle3.copyWith(
                color: CustomTheme.buttonTextBlue2
              ),))
      ],
    );
  }
}
