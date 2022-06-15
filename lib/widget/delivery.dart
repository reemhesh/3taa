import 'package:flutter/material.dart';
import 'dart:math';
import'package:flutter/material.dart';
import'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:profile/ui/Body.dart';
import 'dart:convert';
import 'package:profile/ui/profile.dart';

class deliverForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deliverFormState();
  }
}

class deliverFormState extends State<deliverForm> {

  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _country = '';

  // String _medImage='';
  String _pathsFromTo = '';


  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _name = value.toString();
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _phoneNumber = value.toString();
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },

      onSaved: (String? value) {
        _email = value.toString();
      },
    );
  }

  Widget _buildgovernorate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Governorate'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Governorate is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _country = value.toString();
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

  Widget _buildPathFromTo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'PathFromTo'),
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'delivery paths is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _pathsFromTo = value.toString();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final database = FirebaseDatabase.instance.reference();
    final deliverRef = database.child('/deliver');
    //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Delivery Form")),
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
                _buildPathFromTo(),
                //    _buildMedImage(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed:
                      () {
                if (_formKey.currentState!.validate()) {
                 writeData();
                  Navigator.of(context).pushNamed('submit');
                 _sendDataToSecondScreen(context);
                }
                }

                    //.catchError((error)=>



                  //  _formKey.currentState.save();


                  //Send to API
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = _name;
    String textToSend2 = _email;
    String textToSend3 = _phoneNumber;
    String textToSend6 = _country;
    String textToSend7 = _pathsFromTo;


    Navigator.push(context, MaterialPageRoute( builder: (context) =>Body(account: textToSend,
        email:textToSend2,phone:textToSend3,gov:textToSend6, med:  null,paths:textToSend7),));

  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void writeDa() async {
    _formKey.currentState?.save();
    //print('Patient recoreded');
    //Navigator.of(context).pushNamed('/submit');
    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url = "https://taa1-bbc3c-default-rtdb.firebaseio.com/ ";

    // (Do not remove “data.json”,keep it as it is)
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'Delviering_person':'added',
          "name": _name,
          'email': _email,


//'PrescriptionImg':_prescriptionImg,
        }),
      );

    } catch (error) {
      throw error;
    }
  }
  void writeData() async {
    _formKey.currentState?.save();
    final delivery_list = <String, dynamic>{
      "name": _name,
      'email': _email,
      'PhoneNo': _phoneNumber,
      'country': _country,
      'pathsfromto': _pathsFromTo,

    };


  FirebaseDatabase.instance.reference()
      .child('User')
      .child('Deliveriers_list')
      .push()
      .set(delivery_list)
      .then((_)=>print('donation has been written!'))
      .catchError(
  (e)=>print('you have an error $e')
  );
  }
    /* database
        .child('Storage')
        .get()
        .then((_)=>print(Storage as List))
        .catchError(
            (e)=>print('you have an error $e')
    );*/

}




