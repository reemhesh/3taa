import 'dart:io';
import'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import'package:firebase_database/firebase_database.dart';
import '../ui/editprofile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:path/path.dart';

class donateForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return donateFormState();
  }
}

class donateFormState extends State<donateForm> {
  final database = FirebaseDatabase.instance.reference();
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _country = '';
  String _medAmount = '';
  String _medName = '';

  // String _medImage='';


//to upload images as files
  PlatformFile? pickedFile;
  UploadTask? uploadtask;

  Future<void> _uploadImage() async {
    FirebaseStorage store = FirebaseStorage.instance;
    final path = 'Medimages/${pickedFile?.name?? ' '}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadtask = ref.putFile(file);
    }
    );
    final snapshot = await uploadtask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link:$urlDownload');
    setState(() {
      uploadtask = null;
    }
    );
  }


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        if (value == null || value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (value) {
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

      onSaved: (value) {
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
      onSaved: (value) {
        _country = value.toString();
      },
    );
  }

  Widget _buildMedName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'MedName'),

      validator: (value) {
        if (value == null || value.isEmpty) {
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
        if (value == null || value.isEmpty) {
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
    final database = FirebaseDatabase.instance.reference();
    final dailySpecialRef = database.child('/dailySpecial');
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        writeData();
                        //addnewDonation();
                        Navigator.of(context).pushNamed('submit');
                      //  _sendDataToSecondScreen(context);
                      }
                    }
                ),
                buildProgress()


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

    final donation = <String, dynamic>{

      "name": _name,
      'email': _email,
      'country': _country,
      'PhoneNo': _phoneNumber,
      'MedNameDonated': _medName,
      'MedAmountDonated': _medAmount,
      'needed': false,
      'delivered': false,
      'donated': true
    };
    final Storage = <String, dynamic>{


      'MedNameDonated': _medName,
      'MedAmountDonated': _medAmount,
      "ScanningBarcode": 'ScanningBarcode',
      'delivered': false,
      'donated': true,
      'expired': false
    };


    database
        .child('User')
        .child('Donation')
        .push()
        .set(donation)
        .then((_) => print('donation has been written!'))
        .catchError(
            (e) => print('you have an error $e')
    );
    database
        .child('Storage')
        .push()
        .set(Storage)
        .then((_) => print('donation has been written!'))
        .catchError(
            (e) => print('you have an error $e')
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = _name;
    String textToSend2 = _email;
    String textToSend3 = _phoneNumber;
    String textToSend4 = _medName;
    String textToSend5 = _medAmount;
    String textToSend6 = _country;
    print('name' + _name + 'email' + _email);

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        EditProfilePage(account: textToSend,
            email: textToSend2,
            phone: textToSend3,
            gov: textToSend6,
            med: _medName + _medAmount,
            paths: null),));
  }


  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
    stream:uploadtask?.snapshotEvents,
    builder:(context,snapshot){
      if(snapshot.hasData){
        final data = snapshot.data!;
        double progress = data.bytesTransferred/data.totalBytes;
        return SizedBox(
          height:50,
          child:Stack(
            fit:StackFit.expand,
            children: [
              LinearProgressIndicator(
                value:progress,
                backgroundColor: Colors.green,
              ),
              Center(
                child:Text('${(100*progress).roundToDouble()}%'
                ,style:const TextStyle(color:Colors.white)
                )
              )
            ],
          )
        );
      }
      else{
        return const SizedBox(height:50);
      }
    }
  );



}
