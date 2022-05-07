import 'package:flutter/material.dart';
import 'package:flutterchallenge/constants/theme.dart';

class PrimaryButtonOutlined extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double? width; // add this
  final double? height; // add this
  final double paddingTop;
  final bool hideShadow;
  final bool isDisabled;
  final EdgeInsets? buttonPadding;

  const PrimaryButtonOutlined(this.text, this.function,
      {this.width,
        this.height= 45,
        this.paddingTop= 10,
        this.hideShadow= false,
        this.isDisabled= false,
        this.buttonPadding,
        }); // change this

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            //boxShadow: hideShadow ? null : buttonShadow(),
            color: isDisabled?Colors.grey[700]:null,
            border: Border.all(color: CustomTheme.borderBlue,width: 2)
          //gradient: isDisabled?null:Colors.white
        ),
        child: Material(
          elevation: 0,
          color: Colors.transparent,
          child: MaterialButton(
            minWidth: 227,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            height: height,
            padding: buttonPadding ??
                const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            onPressed: isDisabled?null:function,
            child: Text(text,
                  //textAlign: TextAlign.center,
                  style: CustomTheme.textStyleTitle3.copyWith(
                      color: CustomTheme.buttonTextBlue1,
                      fontWeight: FontWeight.w600
                  ))

          ),
        ),
      ),
    );
  }
}
