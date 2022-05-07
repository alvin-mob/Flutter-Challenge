import 'package:flutter/material.dart';



const fontSizeHeading1 = 27.0;
const fontSizeHeading2 = 24.0;
const fontSizeHeading3 = 20.0;
const fontSizeTitle1 = 18.0;
const fontSizeTitle2 = 16.0;
const fontSizeTitle3 = 14.0;
class CustomTheme{

static const fontFamilySegoe = "Segoe";
static const fontFamilyEuclid = "Euclid";
static const fontFamilyRedHatDisplay = "RedHatDisplay";


static const primaryBlue = Color(0xFF2D82FE);
static const primaryGreen = Color(0xFF2FED51);
static const primaryOrange = Color(0xFFFF9E57);
static const secondaryGreen = Color(0xFF0C8722);
static const backgroundBlue = Color(0xFFE4EFFF);
static const borderBlue = Color(0xFF2F80ED);
static const textBlue = Color(0xFF3D7FE0);
static const buttonTextBlue1 = Color(0xFF2F80ED);
static const buttonTextBlue2 = Color(0xFF2B73DE);

static const primaryGradient =  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
//      primaryBlue,
//     primaryOrange
//      Color.fromRGBO( 255, 251,163,1),
//      Color.fromARGB( 227, 48, 186,0)
      Color(0x5Ee330bc),
      Color(0xFFFFFBA3),

    ] );

static var textStyleHeading1 = const TextStyle(
    fontFamily: fontFamilySegoe,
    fontSize: fontSizeHeading1,
    color: Colors.black,
);
static var textStyleHeading2 = const TextStyle(
    fontFamily: fontFamilySegoe,
    fontSize: fontSizeHeading2,
    color: Colors.black,
);
static var textStyleHeading3 = const TextStyle(
    fontFamily: fontFamilySegoe,
    fontSize: fontSizeHeading3,
    color: Colors.black,
);
static var textStyleTitle1 = const TextStyle(
    fontFamily: fontFamilySegoe,
    fontSize: fontSizeTitle1,
    color: Colors.black,
);
static var textStyleTitle2 = const TextStyle(
    fontFamily: fontFamilySegoe,
    fontSize: fontSizeTitle2,
    color: Colors.black,
);
static var textStyleTitle3 = const TextStyle(
    fontFamily: fontFamilySegoe,
    fontSize: fontSizeTitle3,
    color: Colors.black,
);
}