import 'package:profile/widget/original_button.dart';
import 'package:flutter/material.dart';

class introScreen extends StatelessWidget {
  const introScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.lightBlueAccent,
      body:
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical:20 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              Image.asset('images/images (2).png'),
              OriginalButton(
                text: 'Get Statred',
                onPressesd: () => Navigator.of(context).pushNamed('login'),
                textColor:Colors.lightBlueAccent ,
                bgColor:Colors.white ,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
