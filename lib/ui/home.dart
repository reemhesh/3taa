import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:profile/ui/profile.dart';
//import 'package:camera/camera.dart';
import 'package:profile/widget/NavBar.dart';
import 'package:profile/widget/donationForm.dart';
import 'package:profile/widget/rec.dart';
import'package:profile/widget/donationForm.dart';

import '../views/MedicationList.dart';
//import 'pic.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final cameras = await availableCameras();
  //final firstCamera = cameras.first;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'home',
        debugShowCheckedModeBanner: false,
        home: new HomePage(),


    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // leading: Builder(
        //  builder: (BuildContext context) {
        //   return IconButton(
        //     icon: const Icon(Icons.menu),

        //      onPressed: () {},
        //    );
        //  },
        //  ),
//reading data from medicine
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 26,
            ),
            onPressed: () =>Medicine(),
          ),

          IconButton(
            icon: Icon(
              CupertinoIcons.bell,
              size: 26,
            ),
            onPressed: () {},
          ),

          IconButton(
            icon: Icon(
              CupertinoIcons.circle_fill,
              size: 26,
            ),
            onPressed: ()=>Navigator.push(context, MaterialPageRoute( builder: (builder)=>ProfileScreen())

            )
            ),

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              child: Image(
                image: AssetImage('images/logo.jpg'),
                height: 300,
                width: 300,
              ),
            ),

            Container(
              height: 50,
              width: 250,
              child: Text(
                'ATAA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(2, 11, 52, 1.0),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 50,
              width: 350,
              child: Text(
                'Media:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(2, 11, 52, 1.0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              height: 30,
              width: 350,
              child: Text(
                'Email:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromRGBO(2, 11, 52, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              height: 30,
              width: 350,
              child: Text(
                'Page:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromRGBO(2, 11, 52, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 350,
              child: Text(
                'Phone:',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromRGBO(2, 11, 52, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}

