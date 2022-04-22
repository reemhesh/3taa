import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:profile/services/auth.dart';


class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>new _homeState();


}

class _homeState extends State<home> {

 AuthBase authBase =AuthBase();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.blue

      ),
      body: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15.0,),
            Text('welcome'),
            SizedBox(height: 15.0,),
            FlatButton(
              child: Text('logout'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed:(){
               authBase.logoutWithEmailAndPassword();
               Navigator.of(context).pushReplacementNamed('login');
              },
                ),
    ]),
      ),
    );
              }


}
