import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/core/models/screen_time_model.dart';
import 'package:flutterchallenge/utils/utils.dart';

class DeviceListWidget extends StatelessWidget {
  final DeviceUsage data;
  const DeviceListWidget(this.data, {Key? key}) : super(key: key);
 Widget _device(String iconUrl,String? time){
   return Padding(
     padding: const EdgeInsets.symmetric(vertical: 10),
     child: Row(
       children: [
         Expanded(
           flex: 2,
             child: SvgPicture.asset(iconUrl)
         ),
         Expanded(
           flex: 3,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Adi's Phone",style: CustomTheme.textStyleTitle1.copyWith(fontWeight: FontWeight.w600)),
               Text('${Utils.convertMinutesToTimeString(time)}',style: CustomTheme.textStyleTitle1.copyWith(color: CustomTheme.textBlue),)
             ],
           ),
         )
       ],
     ),
   );
 }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('By Devices',style: CustomTheme.textStyleTitle1.copyWith(fontWeight: FontWeight.w600),),
        SizedBox(height: 20,),
        _device("assets/icons/phone.svg", data.totalTime!.mobile),
        SizedBox(height: 20,),
        _device("assets/icons/laptop.svg", data.totalTime!.laptop),
        SizedBox(height: 20,),
        TextButton(onPressed: (){},
            child: Text("See All Devices",
              style: CustomTheme.textStyleTitle3.copyWith(
                  color: CustomTheme.buttonTextBlue2
              ),)),
        SizedBox(height: 40,)
      ],
    );
  }
}
