import 'package:flutter/material.dart';
import 'package:profile/ui/account.dart';
import 'package:profile/ui/profile.dart';
import 'package:profile/widget/Authform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/ui/AuthScreen.dart';
import 'package:profile/ui/home.dart';
import 'package:profile/ui/intro_screen.dart';
import'package:profile/themes.dart';
import'dart:async';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:profile/ui/account.dart';
void main()async {
  //widgetFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      return
        MaterialApp(
          home: new introScreen (),
          routes: {


            'login': (context) => AuthScreen(authType: AuthType.login),
            'register': (context) => AuthScreen(authType: AuthType.register,),
            'profile': (context) => ProfileScreen(),
            'home': (context) => home(),
            'account': (context) =>Accounts(),

          },

          theme: ThemeData(
            //initTheme: MyThemes.darkTheme,
            inputDecorationTheme: InputDecorationTheme(

              filled: true,
              fillColor: Color(0xfff2f9fe),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(25)
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(25)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(25)
              ),
            ),
          ),
        );
    }
  }


/*


                )
            ) ,*/



