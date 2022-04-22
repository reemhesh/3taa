import 'package:flutter/material.dart';
class OriginalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressesd;
  final Color textColor;
  final Color bgColor;

  const OriginalButton({Key? key,
    required this.text,
    required this.onPressesd,
    required this.textColor,
    required this.bgColor})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(25)
        ),
        color:bgColor,
        onPressed:onPressesd ,
        child:Text(text
            , style:TextStyle(
              color:textColor ,
              fontSize: 18,
            )
        ),
      ),
    );
  }
}

