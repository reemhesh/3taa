import 'package:flutter/material.dart';

class MyThemes {
  static final primary = Colors.lightBlueAccent;
  static final primaryColor = Colors.blue.shade300;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    colorScheme: ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primary),
    dividerColor: Colors.blueAccent,
  );
}
 /*ThemeData(

                inputDecorationTheme:InputDecorationTheme(

                  filled:true ,
                  fillColor:Color(0xfff2f9fe) ,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(25)
                  ),
                )
            ),*/