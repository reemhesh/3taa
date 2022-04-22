import 'package:flutter/gestures.dart';
import'package:flutter/material.dart';
import 'package:profile/ui/ProfileMenu.dart';
import 'package:profile/ui/ProfilePic.dart';
import'dart:async';
import 'package:http/http.dart' as http;
import'dart:convert';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        scrollDirection:Axis.vertical ,

     child: Column(
          children:[
        SizedBox(height:90),
        ProfilePic(),
        SizedBox(
        height: 30,),


        ProfileMenu(
          size:30.0,
           icon:'images/person.jpg',
        text:'         My Account',

          press:() => Navigator.of(context).pushNamed('account'),

        ),

       ProfileMenu(
         size:30.0,
         icon:'images/notif.png',
         text:'        Notifications',
         press: (){},
       ),
            ProfileMenu(
              size:30.0,
              icon:'images/meddd.png',
              text:'           Medication',
              press: (){},
            ),
            ProfileMenu(
              size:30.0,
              icon:'images/pre.png',
              text:'           Prescription',
              press: (){},
            ),



            ProfileMenu(
              size:20.0,
              icon:'images/locatinnn.png',
              text:'           Location',
              press: (){},
            ),
            ProfileMenu(
              size:20.0,
              icon:'images/settings.png',
              text:'           Settings',
              press: (){},
            ),
            ProfileMenu(
              size:25.0,
              icon:'images/help.png',
              text:'           Help',
              press: (){},
            ),



          ]


      ),
    );
   
    }


}
