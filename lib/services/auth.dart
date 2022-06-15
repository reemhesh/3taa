import'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'dart:async';

class Users{

  final String uid;

  Users(@required this.uid);


}

class AuthBase{
  Users? _userFromFireBase(User user){
    final uid = user.uid;
    return user != null ? Users(user.uid): null;
    //Users(uid);
  }
  final FirebaseAuth _auth= FirebaseAuth.instance;



  Future<Users?> registerWithEmailAndPassword(
      String email,String password,String name) async{
    try{
      final authResult = await  _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(_userFromFireBase(authResult.user!));
      return _userFromFireBase(authResult.user!);
      //
    }catch(e){
      print('Here is the error'+e.toString());
      return null;
    }
  }
    Future<Users?> loginWithEmailAndPassword(String email,
        String password,String name) async
    {
      try {
        final authResult =
                 await _auth
                    .signInWithEmailAndPassword(email: email, password: password);
        return _userFromFireBase(authResult.user!);
       // return  await registerWithEmailAndPassword( email, password);
      }
      catch (e) {
        print('Here is the error'+e.toString());
      }
    }

  Future<void> logoutWithEmailAndPassword()async
  {
    try{
      final authResult = await  FirebaseAuth.instance
          .signOut();
    }catch(e){
      print(e.toString());

    }

  }

}
