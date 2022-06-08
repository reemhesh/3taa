import 'package:flutter/gestures.dart';
import'package:flutter/material.dart';
import 'package:profile/ui/ProfilePic.dart';
import'dart:async';
import 'package:http/http.dart' as http;
import'dart:convert';

class Body extends StatelessWidget {



   String account='';
   String gov='';
   String email='';
   String phone='';
   String med='';
   String paths='';

  // receive data from the FirstScreen as a parameter
  Body({Key? key,String? account,String? email,
    String? phone,
    String? med ,
    String? gov,
    String? paths})
      : super(key: key);



  @override
  Widget build(BuildContext context) {

    return
      SingleChildScrollView(
        scrollDirection:Axis.vertical ,

        child: Column(
            children:[
              SizedBox(height:30),
              ProfilePic(),
              SizedBox(
                height: 30,),


              Column(
                children: [
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [Icon(Icons.person,size:30.0),buildTextField('Account',account)],

                 ),
                    TextField(),
                    SizedBox(
                      height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(Icons.email,size:30.0),buildTextField('Email',email)],

                  ),
                    SizedBox(
                      height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(Icons.phone,size:30.0),buildTextField('Phone NO',phone)],

                  ),
                    SizedBox(
                      height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Icon(Icons.location_on,size:30.0),buildTextField('Loaction',gov)],

                    ),
                    SizedBox(
                      height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Image.asset('images/meddd.png',scale:30.0),buildTextField('Medication',med)],

                  ),
                    SizedBox(
                      height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Image.asset('images/pre.png',scale:30.0),buildTextField('Prescription','')]),
                  SizedBox(
                    height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Image.asset('images/paths.jpg',scale:30.0),buildTextField('PATHS',paths)],

                  ),
        //location
      ]),
            ])



      );

  }
  Widget buildTextField(String labelText, String placeholder){

    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
    decoration: InputDecoration(
    contentPadding: EdgeInsets.only(bottom: 3),
    labelText: labelText,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintText: placeholder,
    hintStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
      prefixIcon:Icon(Icons.edit)
    )
    )
    );

  }



}
