//import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:profile/ui/AuthScreen.dart';
import 'package:profile/widget/original_button.dart';
import 'package:flutter/material.dart';


import '../../services/auth.dart';


class Authform extends StatefulWidget {
  final AuthType authType;
  const Authform({Key? key,required this.authType}) : super(key: key);
  //const Authform({Key? key}) : super(key: key);

  @override
  State<Authform> createState() => _AuthformState();
}

class _AuthformState extends State<Authform> {
  final _formKey =GlobalKey<FormState>();
  String _email ='',_password='',error="",_name='';
  AuthBase authBase = AuthBase();


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:40 ),
          child: Column(children: [
            SizedBox(height:16),
    TextFormField(
    onChanged:(value)=>_name = value ,
    obscureText: true,
    decoration: InputDecoration(
    labelText:'Enter your name' ,
    ),

    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Enter your Email';
      }
    }

    //{ if (value == null) {return 'Please enter some text';}
    //if (value.length < 6) {return 'Must be more than 2 charater';}},

    ),
            TextFormField(
              onChanged:(value) => _email = value ,
              decoration: InputDecoration(
                  labelText:'Enter your email' ,
                  hintText:'ex:test@gmail.com'
              ),
              validator: (value) {
                if (value== null || value.isEmpty) {
                  return 'Enter your Email';
                }

                if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
                  return 'Please enter a valid email Address';
                }

                return null;
              },




            ),

            SizedBox(height:12),
            TextFormField(
              onChanged:(value)=>_password = value ,
              obscureText: true,
              decoration: InputDecoration(
                labelText:'Enter your password' ,
              ),

              validator:(value)=>value!.length < 6 ? 'Enter your passord 6+ chars long':null,
              //{ if (value == null) {return 'Please enter some text';}
              //if (value.length < 6) {return 'Must be more than 2 charater';}},

            ),

            SizedBox(height: 18,),
            OriginalButton(
                text:widget.authType==AuthType.login?'Login':'register',
                onPressesd:() async {
                  if (_formKey.currentState!.validate()) {
                    if (widget.authType == AuthType.login) {
                      await authBase.loginWithEmailAndPassword(
                          _email, _password,_name);
                      Navigator.of(context).pushReplacementNamed('home');
                    } else {
                      //user recorded in data
                      writeData();
                      await authBase.registerWithEmailAndPassword(
                          _email, _password,_name);
                      Navigator.of(context).pushReplacementNamed('home');
                    }
                  }
                },
                textColor: Colors.white,
                bgColor:Colors.lightBlueAccent),
            SizedBox(height: 5,),
            FlatButton(
                onPressed: () {

                  if (widget.authType == AuthType.login)
                    Navigator.of(context).pushReplacementNamed('register');
                  else
                    Navigator.of(context).pushReplacementNamed('login');
                }

                ,
                child: Text(
                  widget.authType==AuthType.login? 'Don\`t have an account':
                  'you have an account',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize:18,
                  ),
                )
            )
          ],),
        ) );
  }
  void writeData() async {

    final User = <String, dynamic>{


      'name': _name,
      'email': _email,
      "password": _password,

    };
    FirebaseDatabase.instance.reference()
        .child('User')
        .push()
        .set(User)
        .then((_) => print('user recorded'))
        .catchError(
            (e) => print('you have an error $e')
    );

  }

}
