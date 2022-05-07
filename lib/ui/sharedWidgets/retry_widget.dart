import 'package:flutter/material.dart';
import 'package:flutterchallenge/constants/theme.dart';
import 'package:flutterchallenge/ui/sharedWidgets/primary_button_outlined.dart';

class RetryWidget extends StatelessWidget {
  VoidCallback onTap;
  RetryWidget({required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Something went wrong !",style: CustomTheme.textStyleHeading2,),
        PrimaryButtonOutlined("Retry", onTap,width: 100)
      ],
    );
  }
}
