import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
 // const ProfileMenu({Key? key}) : super(key: key);
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.size,
    this.press,
  }) : super(key: key);

 final double size;
  final String text ,icon;
  //icon
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical:10 ),
      child: FlatButton(
          color:Color(0x0FFF5F6F9),
          onPressed: press,
          child: Row(
            children: [
            Image.asset(icon, width:size, color:Colors.grey[70] ,),
              SizedBox(height:50),
              Expanded(
                child:Text(
                  text,
                  style:Theme.of(context).textTheme.bodyText2 ,
                ),
              ),
              Icon(Icons.arrow_forward_ios)



            ],
          )),
    );
  }
}
