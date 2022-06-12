import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:profile/ui/editprofile.dart';
import 'package:profile/themes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:profile/widget/appbar_widget.dart';

class ProfileScreen extends StatelessWidget {

  static String routeName ='/profile';
  final icon =CupertinoIcons.moon_stars;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // appBar:buildAppBar(context),
      body:/* Body(gov: null, account:null, email:null,
           phone: null, med :null , paths : null
         )*/SettingsUI(),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical:14),
          decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(40),
              topRight:Radius.circular(40),


            ),
            boxShadow:[BoxShadow(
              color: Color(0xFFDADADA).withOpacity(0.15),
              offset:Offset(0,-15),
              blurRadius: 20,
            )
            ],
          ),
          child:SafeArea(
            child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                children: [
                  IconButton(
                      onPressed: (){},
                      iconSize:30.0 ,
                      icon:Image.asset('images/pharamcy2.png',
                        //  color:Colors.blueGrey[50]
                      )
                  ),
                  IconButton(
                      onPressed: (){},
                      iconSize:32.0 ,
                      icon:Icon(Icons.home, color:Colors.grey ,)
                  ),
                  IconButton(
                      onPressed: (){},
                      iconSize:30.0 ,

                      icon:Icon(Icons.receipt_rounded , color:Colors.grey)

                  ),

                ] ),
          )
      ),

    );



  }
}
