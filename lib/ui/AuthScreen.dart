import 'package:profile/widget/Authform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
enum AuthType {login,register}
class AuthScreen extends StatelessWidget {
  final AuthType authType;

  const AuthScreen({Key? key, required this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(48),
                        bottomRight: Radius.circular(48),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 100,),
                      Center(
                        child: Text("Hello!"
                            , style: TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            )
                        ),
                      ),
                      Center(child: Image.asset('images/images (2).png', height: 290,))


                    ],
                  )
                ],
              )
              , Authform(authType: authType),
            ],
          ),
        )
    );
  }
}

