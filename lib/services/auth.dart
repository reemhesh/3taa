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
  Future<Users?> registerWithEmailAndPassword(
      String email,String password) async{
    try{
      final authResult = await  FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return _userFromFireBase(authResult.user!);
    }catch(e){
      print(e.toString());

    }
  }
  Future<Users?> loginWithEmailAndPassword(
      String email,String password)async
  {
    try{ final authResult = await  FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return _userFromFireBase(authResult.user!);}
    catch(e){
      print(e.toString());

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
