import 'package:flutter/material.dart';
import 'dart:math';
import'package:flutter/material.dart';
import'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:profile/ui/Body.dart';

class donateForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return donateFormState();
  }
}

class donateFormState extends State<donateForm> {
  final database =FirebaseDatabase.instance.reference();
  String _name ='';
 String _phoneNumber ='';
  String _email ='';
  String _country ='';
  String _medAmount ='';
  String  _medName ='';
  // String _medImage='';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
        onSaved: (value) {
         _name = value.toString();
        },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
           onSaved:(value) {
             _phoneNumber = value.toString();
           },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },

          onSaved: (value) {
          _email = value.toString();
        },
    );
  }

  Widget _buildgovernorate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Governorate'),
      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'Governorate is Required';
        }

        return null;
      },
        onSaved: (value) {
         _country = value.toString();
         },
    );
  }

  Widget _buildMedName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'MedName'),

      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'MedName is Required';
        }

        return null;
      },
          onSaved: (value) {
            _medName = value.toString();
         },
    );
  }

  Widget _buildMedAmount() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'MedAmount'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value== null || value.isEmpty) {
          return 'Med amount is Required';
        }

        return null;
      },
       onSaved: (value) {
       _medAmount = value.toString();
       },
    );
  }
  Widget _buildMedImage() {
   return Drawer(
  child: //ListView(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
           leading: Icon(Icons.camera_alt,
             size: 26,),
          title: Text('Scanning Barcode',
              style: TextStyle(
            color: Color.fromRGBO(2, 11, 52, 1.0),
          fontSize: 25,
          fontWeight: FontWeight.normal,
          fontFamily: 'Roboto',
     ),
        ),
    onTap: () => Navigator.of(context).pushNamed('/TakePictureScreen'),
         ),
      ),
  );
  }

  @override
  Widget build(BuildContext context) {
    final database =FirebaseDatabase.instance.reference();
    final dailySpecialRef =database.child('/dailySpecial');
    return Scaffold(
      appBar: AppBar(title: Text("Donation Form")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildgovernorate(),
                _buildPhoneNumber(),
                _buildMedName(),
                _buildMedAmount(),
                //    _buildMedImage(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed:  () {
                    if (_formKey.currentState!.validate()) {
                      writeData();
                      Navigator.of(context).pushNamed('submit');
                      _sendDataToSecondScreen(context);

                    }
                  }




                  //Send to API
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  void writeData() async {
    _formKey.currentState?.save();
    //print('Patient recoreded');
    //Navigator.of(context).pushNamed('/submit');
    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url = "https://taa1-bbc3c-default-rtdb.firebaseio.com/"+"data.json";

    // (Do not remove “data.json”,keep it as it is)
    try {

      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'Donation':'added',
          "name": _name,
          'email': _email,
          'country':_country,
          'PhoneNo':_phoneNumber,
          'MedNameDonated':_medName,
          'MedAmountDonated':_medAmount,
          'needed':false,
          'delivered':false,
          'donated':true,
          'expired':false
//'PrescriptionImg':_prescriptionImg,
        }),

      );


    } catch (error) {
      throw error;
    }
  }

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = _name;
    String textToSend2 = _email;
    String textToSend3 = _phoneNumber;
    String textToSend4 = _medName;
    String textToSend5 = _medAmount;
    String textToSend6 = _country;


    Navigator.push(context, MaterialPageRoute( builder: (context) => Body(account: textToSend,
        med:textToSend4+' '+textToSend5,email:textToSend2,phone:textToSend3,paths: " ",gov:textToSend6
    ),));
  }
}

//  await dailySpecialRef.set({'expired':true});
// await dailySpecialRef.update({'expired':true,'deleivered':false});
/*
                                      ()async{      await database.update(
                                   if (_formKey.currentState!.validate()) {

                              try{

                              await dailySpecialRef
                                  .set({"name": _name,
                                          'email': _email,
                                          'country':_country,
                                          'PhoneNo':_phoneNumber,
                                          'MedName':_medName,
                                           'MedAmount':_medAmount,
                              });
                              print('Donation Done');

                              }

                              catch(e){
                              print('you got an error! $e');
                              }

    }           {
                                                'dailySpecialRef/expired':true,
                                                'someotherdata/expired':false
                                              });
                                            */

// If the form is valid, display a snackbar. In the real world,
// you'd often call a server or save the information in a database
// ScaffoldMessenger.of(context).showSnackBar(
//   const SnackBar(content: Text('Processing Data')),
// );





//  _formKey.currentState.save();
